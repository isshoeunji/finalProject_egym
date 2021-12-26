package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Address;
import kosta.mvc.domain.Grade;

public interface GradeRepository extends JpaRepository<Address, Long>{
	
	/**
	 * 모든 grade정보 가져오기 
	 */
	@Query(value="select g from Grade g")
	List<Grade> findAllGrade();	
}
