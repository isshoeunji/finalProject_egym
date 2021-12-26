package kosta.mvc.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.order.NonuserOrder;
import kosta.mvc.domain.order.NonuserOrderDetail;
import kosta.mvc.domain.order.NonuserRefund;
import kosta.mvc.domain.order.UserOrder;
import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.domain.order.UserRefund;
import kosta.mvc.repository.CartRepository;
import kosta.mvc.repository.NonuserOrderDetailRepository;
import kosta.mvc.repository.NonuserOrderRepository;
import kosta.mvc.repository.UserOrderDetailRepository;
import kosta.mvc.repository.UserOrderRepository;
import kosta.mvc.repository.product.ProductRepository;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	UserOrderRepository userOrderRepository;
	
	@Autowired
	UserOrderDetailRepository userOrderDetailRepository;
	
	@Autowired
	NonuserOrderRepository nonuserOrderRepository;
	
	@Autowired
	NonuserOrderDetailRepository nonuserOrderDetailRepository;
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	RefundService refundService;
	
	@Override
	public UserOrder insertUserOrder(UserOrder userOrder, List<Cart> deleteCartList) {
		UserOrder order = userOrderRepository.save((UserOrder)userOrder);
		if (order==null) throw new RuntimeException("테이블에 주문등록 불가능으로 예외발생");

		
		for(UserOrderDetail detail: order.getUserOrderDetailList()) { //이미 필터링된 애들
			detail.setUserOrder(order);
			productRepository.updateStock(detail.getProductCount(), detail.getProduct().getProductNo());
			
		}
		List<Cart> cartList = userOrder.getMember().getCartList();
	    //System.out.println("usercartListSize : " + cartList.size());
		for(Cart cart: deleteCartList) {
			cartRepository.delete(cart);
			cartList.remove(cart);
		}
		
		
		
		return order;
	}

	@Override
	public NonuserOrder insertNonuserOrder(NonuserOrder nonuserOrder, List<Cart> cartList) {
		NonuserOrder order = nonuserOrderRepository.save((NonuserOrder)nonuserOrder);
		
		if (order==null) throw new RuntimeException("테이블에 주문등록 불가능으로 예외발생");
		
		for(NonuserOrderDetail detail: order.getNonuserOrderDetailList()) {
			detail.setNonuserOrder(order);
			productRepository.updateStock(detail.getProductCount(), detail.getProduct().getProductNo());

		}
		
		for(Cart cart: cartList) {
			cartRepository.delete(cart);
		}
		
		return order;
	}
	
	@Override
	public Page<UserOrder> selectUserOrder(Pageable pageable) {
		return userOrderRepository.findAll(pageable);
	}

	@Override
	public Page<NonuserOrder> selectNonuserOrder(Pageable pageable) {
		return nonuserOrderRepository.findAll(pageable);
	}

	@Override
	public UserOrder selectUserOrder(Long orderNo) {
		
		return userOrderRepository.findById(orderNo).orElse(null);
	}

	@Override
	public NonuserOrder selectNonuserOrder(Long orderNo) {
		return nonuserOrderRepository.findById(orderNo).orElse(null);
	}

	@Override
	public UserOrderDetail selectUserOrderDetail(Long orderDetailNo) {
		return userOrderDetailRepository.findById(orderDetailNo).orElse(null);
	}

	@Override
	public NonuserOrderDetail selectNonuserOrderDetail(Long orderDetailNo) {
		return nonuserOrderDetailRepository.findById(orderDetailNo).orElse(null);

	}

	@Override
	public int changeUserOrderStatus(Long orderDetailNo) {
		int result = userOrderDetailRepository.statusUpdate(orderDetailNo);
		return result;
	}

	@Override
	public int changeNonuserOrderStatus(Long orderDetailNo) {
		int result = nonuserOrderDetailRepository.statusUpdate(orderDetailNo);
		return result;
	}

	/**
	 * 비회원 주문조회
	 */
	@Override
	public NonuserOrder selectNonuserOrder(HttpServletResponse response, Long nonuserOrderNo, String receiverName, String receiverPhone) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
		NonuserOrder result = nonuserOrderRepository.findByNonuserOrderNoAndReceiverNameAndReceiverPhone(nonuserOrderNo, receiverName, receiverPhone);
		PrintWriter out = response.getWriter();
		if(result == null) {
			out.println("<script>");
    		out.println("alert('정보를 정확하게 입력해주세요.');");
    		out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			return result;
		}
		
	}

	/**
	 * 환불을 신청한다.
	 * */
	@Override
	public void updateUserOrderDetailStatus(Long orderDetailNo, String reason) {
		int result = userOrderDetailRepository.requestUserorderCancle(orderDetailNo);
		if (result==0) throw new RuntimeException("주문취소 신청 실패");
		UserOrderDetail detail = selectUserOrderDetail(orderDetailNo);
		
		System.out.println(detail.getUserOrderDetailNo());
		UserRefund userRefund = new UserRefund().builder().userOrderDetail(detail).refundReason(reason).refundStatus("신청완료").build();
		userRefund = refundService.insertUserRefund(userRefund);
		if (userRefund==null) throw new RuntimeException("환불 등록 실패");
		
	}

	@Override
	public void updateNonuserOrderDetailStatus(Long orderDetailNo, String reason) {
		int result = nonuserOrderDetailRepository.requestUserorderCancle(orderDetailNo);
		if (result==0) throw new RuntimeException("주문취소 신청 실패");

		NonuserOrderDetail detail = selectNonuserOrderDetail(orderDetailNo);
		NonuserRefund refund = new NonuserRefund().builder().nonuserOrderDetail(detail).refundReason(reason).refundStatus("신청완료").build();
		refund = refundService.insertNonuserRefund(refund);
		if (refund==null) throw new RuntimeException("환불 등록 실패");
		
	}

	@Override
	public Page<UserOrderDetail> userOrderDetailPage(List<UserOrder> list, Pageable pageable, int status) {
		return userOrderDetailRepository.findByStatusAndUserOrderIn(status, list, pageable);
	}

	@Override
	public Page<UserOrderDetail> userCancleOrderDetailPage(List<UserOrder> list, Pageable pageable, int status) {
		return userOrderDetailRepository.findByStatusGreaterThanAndUserOrderIn(status, list, pageable);
	}

	@Override
	public Page<UserOrder> orderListSelectByKeyword(String keyword, Pageable pageable) {
    	//Long key1 = Long.parseLong(keyword);
		
		keyword = "%" + keyword +"%";
		
		return userOrderRepository.findByReceiverNameLike(keyword, pageable);
	}

	@Override
	public List<UserOrder> findAllList() {
		return userOrderRepository.findAll();
	}

	@Override
	public Page<NonuserOrder> nonuserOrderlistByKeyword(String keyword, Pageable pageable) {
		keyword = "%" + keyword +"%";
		return nonuserOrderRepository.findByReceiverNameLike(keyword, pageable);
	}

	@Override
	public List<NonuserOrder> findAllNonuserList() {
		return nonuserOrderRepository.findAll();
	}

	
	
	

}
