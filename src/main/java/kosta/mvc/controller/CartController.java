package kosta.mvc.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Address;
import kosta.mvc.domain.Cart;
import kosta.mvc.dto.CartListDTO;
import kosta.mvc.service.AddressService;
import kosta.mvc.service.CartService;

@Controller
@RequestMapping("/shop")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private AddressService addressService;
	
	List<Cart> list;
	/**
	 * 아이디/식별번호에 해당하는 장바구니 상품 정보 조회
	 *  : 상품이름, 가격, 이미지파일이름, 상품수량, 상품번호
	 * */
	@RequestMapping("/selectCart")
	public ModelAndView selectCart(HttpSession session, Principal principal, HttpServletRequest request) {
//		Cookie[] list =  request.getCookies();
		
//		for(CooKie c : list) {
//			c.get
//		}
		
		System.out.println("카트 컨트롤러, 식별번호 : "+session.getId());
		//식별값 또는 아이디 값을 넘긴다.
		List<Cart> cartList = new ArrayList<Cart>();
		List<Cart> soldoutList = new ArrayList<Cart>();
		//회원번호에 해당하는 기본배송지 찾기 
		Address addr = null;
		
		if(principal!=null) {
			System.out.println("principal이 존재합니다");
			list=cartService.selectCart(principal.getName());
			addr = addressService.findBasicAddr(principal.getName());
		}
		else list=cartService.selectCart(session.getId());
		
		for(Cart cart: list) {
			if(cart.getProduct().getStock() < cart.getCartCount()) soldoutList.add(cart);
			else cartList.add(cart);
		}
		
		ModelAndView mv = new ModelAndView();
		
		//카트리스트가 둘 다 비어있으면 empty로!
		if(cartList.size()==0 && soldoutList.size()==0) {
			mv.setViewName("shop/user/emptyCart");
		}
		else {
			mv.addObject("cartList", cartList);
			mv.addObject("soldoutList", soldoutList);
			mv.addObject("addr", addr);
			mv.setViewName("shop/user/cart");
		}
		
		return mv;

	}
	
	/**
	 * 장바구니로 이동
	 * */
	@RequestMapping("/cart")
	public void cartForm() {
		
	}
	
	/**
	 * 장바구니에 상품 추가(등록)
	 * */
	 @RequestMapping("/addToCart") 
	 public String insertCart(HttpSession session, Long productNo, String quantity,Principal principal) { //회원번호/식별번호, 상품번호, 상품수량
		String id = session.getId();
		//System.out.println("principal: " + principal);
		int qty = Integer.parseInt(quantity);
		System.out.println(productNo+"번 상품의 개수 : "+qty);
		
		if (principal!=null) cartService.insertCart(principal.getName(), productNo, qty);
		else cartService.insertCart(id, productNo, qty); 

		return "redirect:/shop/select/single/"+productNo+"/0";
	}
	 
	
	/**
	 * 장바구니에서 상품번호에 해당하는 상품 삭제
	 * */
	
	  @RequestMapping("/deleteCart/{cartNo}") 
	  public String deleteCart(@PathVariable Long cartNo) {
		  //세션 아이디와 pno로 조회한 해당 장바구니에서 상품 삭제
		  System.out.println(cartNo);
		  cartService.deleteCart(cartNo);
		  
		  return "redirect:/shop/selectCart"; 
	  }
	 
	  
	  /**
	   * 장바구니에 담긴 상품금액 조회
	   * */
	  @RequestMapping("/")
	  public ModelAndView sumCart(HttpSession session) {
		  int sum=0;
		  List<Cart> cartList=cartService.selectCart(session.getId());
		  for(Cart c : cartList) {
			  int price = c.getProduct().getPrice();
			  sum += (price*c.getCartCount());
			  
		  }
		  System.out.println("합계:"+sum);
		  
		  return new ModelAndView("shop/cart", "sum", sum);
	  }
	  
	  /**
	   * 장바구니 내용 수정
	   * */
	  @RequestMapping("/updateCart")
	  public String updateCart(CartListDTO cartList) {
		 
		 cartService.updateCart(cartList.getList());
		 
		 return "redirect:/shop/selectCart";
	  }
	 
	 /**
	  * 상품목록에서 장바구니에 해당 상품 1 추가
	  * */
	 @RequestMapping("/addToCart/{cateCode}/{pno}")
	 public String addOneToCart(@PathVariable int cateCode, @PathVariable Long pno, HttpSession session, Principal principal) {

		 if (principal!=null) cartService.insertCart(principal.getName(), pno, 1);
			else cartService.insertCart(session.getId(), pno, 1); 
		 
		 return "redirect:/shop/select/"+cateCode;
	 }
	 
	 
}
