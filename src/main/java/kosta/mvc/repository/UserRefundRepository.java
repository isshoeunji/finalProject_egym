package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.order.UserRefund;

public interface UserRefundRepository extends JpaRepository<UserRefund, Long> {

	/**
	 * status 값 변경 -> 환불완료로 변경
	 * */
	@Query("update UserRefund r set r.refundStatus='환불완료' where r.userRefundNo=?1")
	@Modifying
	int statusUpdate(Long userRefundNo);
	
	/**
	 * 관리자가 회원, 비회원의 환불내역을 검색어로 검색한다. (환불번호, 주문상세번호)
	 * */
	@Query("select u from UserRefund u where u.userRefundNo like %?1% or u.userOrderDetail like %?1%")
	List<UserRefund> selectRefundByKeyword(String keyword);
	
	UserRefund findByUserRefundNo(Long userRefundNo);
}
