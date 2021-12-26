package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.product.Product;

public interface ProductService {

	/**
	 * 등록
	 * */
	void insert(Product product);
	
	/**
	 * 수정
	 * */
	void update(Product product, String path);
	
	/**
	 * 번호에 따른 검색
	 * :조회수 - state가 true이면 조회수 증가
	 * */
	Product selectByNo(Long productNo, boolean state);
	
	/**
	 * 카테고리별 검색
	 * */
	//List<Product> selectByCateCode(int cateCode);
	Page<Product> selectByCateCode(int cateCode, Pageable pageable);
	
	/**
	 * 조회수 상위 10개 검색
	 * */
	List<Product> selectByReadNum();
	
	/**
	 * 최신날짜 9개 검색
	 * */
	List<Product> selectByDate();
}
