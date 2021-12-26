package kosta.mvc.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.BurnCalory;

public interface BurnCalorieRepository extends JpaRepository<BurnCalory, Long> {

	Page<BurnCalory> findByExerciseLike(String keyword, Pageable pageable);

}
