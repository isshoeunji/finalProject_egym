package kosta.mvc.service;

import kosta.mvc.domain.Review;

public interface ReviewService {

	/**
     * 등록하기
     */
	void insert(Review review);
	
	/**
	 * 삭제
	 */
	void delete(Long no);
}
