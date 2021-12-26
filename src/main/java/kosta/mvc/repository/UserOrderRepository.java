package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.order.UserOrder;

public interface UserOrderRepository extends JpaRepository<UserOrder, Long> {

	
	@Query("select u from UserOrder u where u.receiverName like %?1% or u.userOrderNo like %?1%")
	List<UserOrder> selectByKeyword(String keyword);
	
	Page<UserOrder> findByReceiverNameLike(String key1, Pageable pageable);
}
