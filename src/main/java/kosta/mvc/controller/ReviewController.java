package kosta.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Review;
import kosta.mvc.domain.order.UserOrder;
import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.domain.product.Product;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.OrderService;
import kosta.mvc.service.ProductService;
import kosta.mvc.service.ReviewService;

@Controller
@RequestMapping("/shop/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	ProductService productService;
	@Autowired
	MemberService memberService;
	@Autowired
	OrderService orderService;

	/**
	 * 리뷰 등록하기 폼
	 */
	@RequestMapping("insert/{productNo}/{memberNo}/{userOrderDetailNo}")
	public ModelAndView insertReview(@PathVariable Long productNo, @PathVariable Long memberNo, @PathVariable Long userOrderDetailNo) {
		Product product = productService.selectByNo(productNo, false);

		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.addObject("memberNo", memberNo);
		mv.addObject("userOrderDetailNo", userOrderDetailNo);
		mv.setViewName("shop/review/write");
		return mv;
	}

	/**
	 * 리뷰 등록하기
	 */
	@RequestMapping("insert") 
	public String insert(Review review, Long productNo, Long memberNo, Long userOrderDetailNo, int rating,
			MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session) { 
		
		String path = session.getServletContext().getRealPath("/save");
		MultipartFile file = multipartHttpServletRequest.getFile("file"); //이미지 하나만 업로드
		
		
		
		try {
			file.transferTo(new File(path + "/" + file.getOriginalFilename()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		review.setProduct(Product.builder().productNo(productNo).build());
		review.setMember(Member.builder().memberNo(memberNo).build());
		review.setUserOrderDetail(UserOrderDetail.builder().userOrderDetailNo(userOrderDetailNo).build());
		review.setRating(rating);
		review.setReviewImage(file.getOriginalFilename());
		reviewService.insert(review);
		
		return "redirect:/shop/user/orderList";
	}
	
	/**
	 * 리뷰 상품 페이지에서 삭제하기
	 */
	@RequestMapping("delete/{reviewNo}/{productNo}")
	public String delete(@PathVariable Long reviewNo, @PathVariable Long productNo) {
		reviewService.delete(reviewNo);
		
		return "redirect:/shop/select/single/" + productNo + "/1";
	}
	
	/**
	 * 리뷰 내가쓴 리뷰 페이지에서 삭제하기
	 */
	@RequestMapping("deleteReview/{reviewNo}/{productNo}")
	public String deleteReview(@PathVariable Long reviewNo, @PathVariable Long productNo) {
		reviewService.delete(reviewNo);
		
		return "redirect:/shop/review/reviewList";
	}
	
	/**
	 * 리뷰 목록 보기
	 */
	@RequestMapping("reviewList")
	public ModelAndView reviewList(Principal principal, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "userOrderDetailNo");
		
		String id = principal.getName();
		Member m = memberService.selectByMemberId(id);
		List<UserOrder> orderList = m.getOrderList();
		
		Page<UserOrderDetail> pageList = orderService.userOrderDetailPage(orderList, pageable, 0);
		
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		ModelAndView mv = new ModelAndView();
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.setViewName("shop/review/reviewList");
		mv.addObject("list", pageList);
		
		return mv;
	}
}
