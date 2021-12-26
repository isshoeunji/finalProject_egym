package kosta.mvc.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.FoodCalory;

public interface FoodCalorieRepository extends JpaRepository<FoodCalory, Long> {

	Page<FoodCalory> findByFoodNameLike(String keyword, Pageable pageable);

}
