package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Review;
import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional 
public class ReviewServiceImpl implements ReviewService {

	private final ReviewRepository reviewRepository;

	@Override
	public void insert(Review review) {
		reviewRepository.save(review);
		
	}

	@Override
	public void delete(Long reviewNo) {
		UserOrderDetail userOrderDetail = reviewRepository.findById(reviewNo).orElse(null).getUserOrderDetail();
		
		reviewRepository.deleteById(reviewNo);
		userOrderDetail.setReview(null); //참조 되어있는 userOrderDetail의 review도 delete 해줘야한다.
	}
	
}
