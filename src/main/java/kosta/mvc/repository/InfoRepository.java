package kosta.mvc.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Info;

public interface InfoRepository extends JpaRepository<Info, Long> {
	
	@Query("select i from Info i where i.infoNo=?1")
	Optional<Info> selectByInfoNo(int infoNo);
	
	@Query("update Info i set i.attendCheck=0")
	@Modifying
	int updateAttendCheck();
}
