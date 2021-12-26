package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.order.NonuserRefund;
import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.domain.order.UserRefund;
import kosta.mvc.repository.NonuserOrderDetailRepository;
import kosta.mvc.repository.NonuserRefundRepository;
import kosta.mvc.repository.UserOrderDetailRepository;
import kosta.mvc.repository.UserRefundRepository;
import kosta.mvc.repository.product.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service  //생성 id="productServiceImpl"
@RequiredArgsConstructor
@Transactional
public class RefundServiceImpl implements RefundService {

	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	UserRefundRepository userRefundRepository;
	
	@Autowired
	NonuserRefundRepository nonuserRefundRepository;

	@Autowired
	UserOrderDetailRepository userOrderDetailRepository; 
	
	@Autowired
	NonuserOrderDetailRepository nonuserOrderDetailRepository;
	
	@Override
	public UserRefund insertUserRefund(UserRefund userRefund) {
		return userRefundRepository.save(userRefund);
	}

	@Override
	public NonuserRefund insertNonuserRefund(NonuserRefund nonuserRefund) {
		return nonuserRefundRepository.save(nonuserRefund);
	}

	@Override
	public Page<UserRefund> selectUserRefund(Pageable pageable) {
		return userRefundRepository.findAll(pageable);
	}

	@Override
	public List<NonuserRefund> selectNonuserRefund() {
		return nonuserRefundRepository.findAll();
	}

	@Override
	public UserRefund userRefund(Long userRefundNo) {
		UserRefund userRefund = userRefundRepository.findById(userRefundNo).orElse(null);
		return userRefund;
	}

	@Override
	public NonuserRefund nonuserRefund(Long nonuserRefundNo) {
		return nonuserRefundRepository.findById(nonuserRefundNo).orElse(null);
	}

	@Override
	public void agreeUserRefund(Long userRefundNo) {
		
		//refund의 refund_status값 수정
		int result = userRefundRepository.statusUpdate(userRefundNo);
		if (result ==0) throw new RuntimeException();
		
		UserRefund userRefund = userRefundRepository.getById(userRefundNo);
		UserOrderDetail detail = userRefund.getUserOrderDetail();
		
		//orderDetail의 status 값 수정
		result = userOrderDetailRepository.requestUserorderCancle(detail.getUserOrderDetailNo());
		if(result==0) throw new RuntimeException();
		
		//재고량 증가시키기
		result = productRepository.updateStock(detail.getProductCount()*-1, detail.getProduct().getProductNo());
		if(result==0) throw new RuntimeException("취소후 재고량 증가 실패");
		
	}

	@Override
	public void agreeNonuserRefund(Long nonuserRefundNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserRefund selectRefundByKeyword(Long keyword) {
		//return userRefundRepository.selectRefundByKeyword(keyword);
		return userRefundRepository.findById(keyword).orElse(null);
	}
	
	
	
}
