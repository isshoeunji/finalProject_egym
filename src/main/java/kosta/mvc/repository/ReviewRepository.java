package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {

}
