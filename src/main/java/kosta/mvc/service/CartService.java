package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Cart;

public interface CartService {
	
	/**
	 *  아이디 또는 비회원 식별번호로 장바구니 상품 정보 조회
	 * : 상품이름, 가격, 이미지파일이름, 상품수량, 상품번호
	 * */
	List<Cart> selectCart(String id);
	
	/**
	 * single페이지에서 회원/식별번호에 해당하는 장바구니에 상품 추가
	 * */
	void insertCart(String id, Long productNo, int qty);
	
	/**
	 * 회원/식별번호와 상품번호에 해당하는 상품 장바구니에서 삭제
	 * */
	void deleteCart(Long cartNo);

	
	/**
	 * 장바구니의 수량변경
	 * */
	void updateCart(List<Cart> cartList);
	
	/**
	 * 장바구니
	 * */
	void moveCart(List<Cart> cartList, String id);
	


}
