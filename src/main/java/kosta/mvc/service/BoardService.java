package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Board;


public interface BoardService {
	/**
	    * 전체검색
	    * */
		List<Board> selectAll();
		
		/**
		 * 전체검색 - Page처리
		 * */
		Page<Board> selectAll(Pageable pageable);
		
		/**
		 * 카테고리별 select
		 * */
		Page<Board> findByBoardKind(int boardKind, Pageable pageable);
		
		
		/**
		 * 지역방 지역 카테고리별 select
		 * */
		Page<Board> findByTag(Long tagrel_no, Pageable pageable);
		
		
		/**
		 * 등록
		 * */
		void insert(Board board);
		
		/**
		 * 글번호 검색 
		 *   : 조회수 증가....
		 *      - state가 true이면 조회수 증가한다.
		 * */
		Board selectBy(Long boardNo , boolean state);
		
		/**
		 * 수정하기
		 * */
		
	    Board update(Board board);
	    
	    /**
	     * 삭제하기
	     * */
	    void delete(Long boardNo, String password);
	    
	    /**
	     * challengeNo에 해당하는 boardList가져오기  
	     */
		List<Board> findByChallengeNo(Long challengeNo);
	
}
