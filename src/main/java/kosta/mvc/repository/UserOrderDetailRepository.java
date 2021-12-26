package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.order.UserOrder;
import kosta.mvc.domain.order.UserOrderDetail;

public interface UserOrderDetailRepository extends JpaRepository<UserOrderDetail, Long> {

	/**
	 * 회원번호에 따른 주문 상세페이지 리스트 리턴 
	 * */
	Page<UserOrderDetail> findByStatusAndUserOrderIn(int status, List<UserOrder> userOrder, Pageable pageable);

	/**
	 * 주문이 취소된 회원의 주문 상세 페이지 리스트 리턴
	 * */
	Page<UserOrderDetail> findByStatusGreaterThanAndUserOrderIn(int status, List<UserOrder> userOrder, Pageable pageable);
	
	/**
	 * 상태 값 증가 -> 배송상태 변경
	 * */
	@Query("update UserOrderDetail o set o.orderStatus=o.orderStatus+1 where o.userOrderDetailNo=?1")
	@Modifying
	int statusUpdate(Long orderDetailNo);
	
	/**
	 * 회원의 주문 취소 요청에 따른 상태(status)값 변경
	 * */
	@Query("update UserOrderDetail o set o.status=o.status+1 where o.userOrderDetailNo=?1")
	@Modifying
	int requestUserorderCancle(Long orderDetailNo);
	
	
	
}
