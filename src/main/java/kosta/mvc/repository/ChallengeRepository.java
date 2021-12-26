package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Challenge;

public interface ChallengeRepository extends JpaRepository<Challenge, Long>{
	
	/**
	 * 진행중인 챌린지 조회 
	 */
	@Query(value = "select c from Challenge c where c.challengeCategory=?1 AND c.member.memberNo=?2 AND c.challengeState=0")
	Challenge selectChallenge(int challengeCategory,Long memberNo);
	
	/**
	 * 챌린지 카테고리별 조회 ---> BoardRepository로 옮겨야 하나...?
	 */
	@Query(value = "select b from Board b where b.challenge.challengeCategory=?1" ) 
	Page<Board> findByChallengeCategory(int challengeCategory, Pageable pageable);

	/**
	 * 마이페이지 - 회원번호로 도전한 챌린지 조회하기 
	 */
	@Query(value = "select c from Challenge c where c.member.memberNo=?1")
	List<Challenge> findByMemberNo(Long memberNo);
	
	@Query(value = "update Challenge c set c.challengeState=1 where c.dailyCheck=0 and c.challengeState=0")
	@Modifying
	int updateChallengeState();
	
	@Query(value = "update Challenge c set c.dailyCheck=0")
	@Modifying
	int initDailyCheck();
}