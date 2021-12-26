package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.order.NonuserRefund;
import kosta.mvc.domain.order.UserRefund;

public interface NonuserRefundRepository extends JpaRepository<NonuserRefund, Long> {

	/**
	 * status 값 변경 -> 환불완료로 변경
	 * */
	@Query("update NonuserRefund r set r.refundStatus='환불완료' where r.nonuserRefundNo=?1")
	@Modifying
	int statusUpdate(Long nonuserRefundNo);
	
}
