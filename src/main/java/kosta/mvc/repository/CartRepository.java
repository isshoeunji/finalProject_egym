package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
	
	/**
	 * 아이디/식별번호로 조회 
	 * */
	@Query("select c from Cart c where c.cartValue=?1")
	@Modifying //DDL, DML 문장
	List<Cart> selectCart(String id);
	
	/**
	 * 같은 상품번호에 해당하는 cart 정보가 있는지 조회 (session 아이디에 추가)
	 * */
	@Query("select c.cartNo from Cart c inner join c.product p where c.cartValue=?1 and p.productNo=?2")
	Long doubleCheck(String id, Long productNo);
	
	/**
	 * 상품번호에 해당하는 장바구니 정보 찾기
	 * */
	@Query("select c.cartNo from Cart c inner join c.product p where c.cartValue=?1 and p.productNo=?2")
	Long selectByPno(String id, Long productNo);
	
	/**
	 * 같은 상품번호에 해당하는 cart 정보가 있는지 조회 (회원 아이디에 추가)
	 * */
	@Query("select c.cartNo from Cart c inner join c.product p where c.cartValue=?1 and p.productNo=?2")
	Long doubleCheck(Long id, Long productNo);
	
	 
	

}
