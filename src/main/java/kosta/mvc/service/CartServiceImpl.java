package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.product.Product;
import kosta.mvc.repository.CartRepository;
import kosta.mvc.repository.product.ProductImageRepository;
import kosta.mvc.repository.product.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional 
public class CartServiceImpl implements CartService {
	
	private final CartRepository cartRepository;
	private final ProductRepository productRepository;
	private final ProductImageRepository productImageRepository;
	//private final MemberRepository memberRepository;
	

	/**
	 *  아이디 또는 비회원 식별번호로 장바구니 상품 정보 조회
	 * : 상품이름, 가격, 이미지파일이름, 상품수량, 상품번호
	 * */
	@Override
	public List<Cart> selectCart(String sessionId) {
		List<Cart> cartList = cartRepository.selectCart(sessionId);

		return cartList;
	}

	
	/**
	 * 회원/식별번호에 해당하는 장바구니에 상품 추가
	 * */
	@Override
	public void insertCart(String id, Long productNo, int qty) {
		
		Product product= productRepository.getById(productNo);
		//상품 이름, 상품 가격 조회하기
		
		//중복되는 상품번호 조회
		Long cartNo= cartRepository.doubleCheck(id, productNo);
		
		//만약 상품 번호에 해당하는 데이터가 존재한다면(조회) 수량만 업데이트
		  if(cartNo==null) { 
			  //아니면 등록
			  //조회한 db정보로 Cart 생성
			  Cart cartSave = new Cart(null, id, qty, product, null);
			  cartRepository.save(cartSave);
		  }else{
			  Cart dbCart= cartRepository.getById(cartNo);
			  int result=(dbCart.getCartCount())+qty;
			  dbCart.setCartCount(result); 
		  }
		  
	}

	/**
	 * 회원/식별번호와 상품번호에 해당하는 상품 장바구니에서 삭제
	 * */
	@Override
	public void deleteCart(Long cartNo) {
		cartRepository.deleteById(cartNo);
	}


	@Override
	public void updateCart(List<Cart> cartList) {
		for(Cart cart: cartList) {
			Cart dbCart = cartRepository.findById(cart.getCartNo()).orElse(null);
			dbCart.setCartCount(cart.getCartCount());
		}
	}


	
	  @Override 
	  public void moveCart(List<Cart> cartList, String id) { 
		  for(Cart cart: cartList) { 
			  insertCart(id, cart.getProduct().getProductNo(),cart.getCartCount()); 
			  cartRepository.delete(cart); 
			  }
	  }
	 


	
}






