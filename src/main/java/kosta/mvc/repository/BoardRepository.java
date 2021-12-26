package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

	/**
	 * 조회수 증가(JPQL문법)
	 * */
	@Query("update Board b set b.boardReadnum = b.boardReadnum+1 where b.boardNo=?1")
	@Modifying // DDL 또는 DML문장
	int readnumUpdate(Long boardNo);
	
	
	Page<Board> findByBoardKind(int boardKind, Pageable pageable);
	
	//Page<Board> findByTag(Tag tag, Pageable pageable);
	
	//@Query(value = "select * from board where TAGREL_NO=?1" , nativeQuery = true) 
	@Query(value = "select b from Board b where b.tag.tagrelNo=?1" ) 
	Page<Board> selectByTag(Long tagrelNo, Pageable pageable);

	/**
	 * 마이페이지 - 회원번호로 작성한 게시물 조회하기
	 */
	@Query(value = "select b from Board b where b.member.memberNo=?1")
	Page<Board> findByMemberNo(Long memberNo, Pageable pageable);


	/**
	 * 챌린지등록하기 - challengeNo에 해당하는 boardList가져오기
	 */
	@Query(value="select b from Board b where b.challenge.challengeNo=?1")
	List<Board> findByChallengeNo(Long challengeNo);

	/**
	 * 마이페이지 - challengNo에 해당 boardPage
	 */
	@Query(value="select b from Board b where b.challenge.challengeNo=?1")
	Page<Board> findByChallengeNo(Long challengeNo, Pageable pageable);
	
}
