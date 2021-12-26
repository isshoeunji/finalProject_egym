package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Challenge;
import kosta.mvc.domain.Grade;
import kosta.mvc.domain.Info;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reply;

public interface MypageService {

	
	/**
	 * member 조회
	 */
	Member findByMemberNo(Long memberNo);

	

	/**
	 * memberInfo 조회
	 */
	Info findInfo(Long memberNo);
	
	/**
	 * level 조회
	 */
	
	/**
	 * challenge 조회
	 */
	List<Challenge> findChallenge(Long memberNo);
	
	/**
	 * 작성한 게시물 조회 
	 */
	Page<Board> findBoard(Long memberNo, Pageable pageable);

	List<Board> findBoard(Long memberNo);


	/**
	 * challengNo에 해당하는 boardPage조회
	 */
	Page<Board> findBoardByChallengeNo(Long challengeNo, Pageable pageable);


	/**
     * 마이페이지 - 개인정보 수정 
     */
	void update(Member member, String path);


	/**
	 * 모든 등급정보 가져오기
	 */
	List<Grade> selectGradeList();


	/**
	 * 작성한 댓글 조회
	 */
	Page<Reply> findReply(Long memberNo, Pageable pageable);

}
