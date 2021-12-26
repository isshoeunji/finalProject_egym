package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.order.NonuserOrderDetail;

public interface NonuserOrderDetailRepository extends JpaRepository<NonuserOrderDetail, Long> {

	/**
	 * 상태 값 증가
	 * */
	@Query("update NonuserOrderDetail o set o.orderStatus=o.orderStatus+1 where o.nonuserOrderDetailNo=?1")
	@Modifying
	int statusUpdate(Long orderDetailNo);
	
	/**
	 * 비회원의 주문 취소 요청에 따른 상태(status)값 변경
	 * */
	@Query("update NonuserOrderDetail o set o.status=1 where o.nonuserOrderDetailNo=?1")
	@Modifying
	int requestUserorderCancle(Long orderDetailNo);
	
}
