package kosta.mvc.repository.product;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.product.ProductQuestion;

public interface ProductQuestionRepository extends JpaRepository<ProductQuestion, Long> {

	
	
}
