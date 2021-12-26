package kosta.mvc.service;


import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Board;
import kosta.mvc.repository.BoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService {

	private final BoardRepository boardRepository;
	
	@Override
	public List<Board> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Board> selectAll(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Override
	public void insert(Board board) {
		Board b = boardRepository.save(board);
		
	}

	@Override
	public Board selectBy(Long boardNo, boolean state) {
		
		//조회수 
		if(state) {
			if(boardRepository.readnumUpdate(boardNo)==0) {
				throw new RuntimeException(boardNo+"번호 오류로 조회수 증가 실패로 인해 검색할 수 없습니다.");
			}
		}
		
		//검색
		Board board = boardRepository.findById(boardNo).orElse(null);
		
		return board;
	}
	


	//by은지_2021.12.05
	@Override
	public Board update(Board board) {
		System.out.println("service의 update 메소드...");
		//수정일 넣기
		LocalDateTime today = LocalDateTime.now();
		board.setBoardUpdate(today);
		
		//글번호 검증
		Board dbBoard = boardRepository.findById(board.getBoardNo()).orElse(null);
		if(dbBoard == null) throw new RuntimeException("글번호 오류로 수정할 수 없습니다.");
		
		//비밀번호 일치여부 확인
		if(!dbBoard.getPassword().equals(board.getPassword())) {
			throw new RuntimeException("비밀번호 오류로 수정할 수 없습니다.");
		}
		
		//게시글 수정하기
		dbBoard.setBoardTitle(board.getBoardTitle());
		dbBoard.setBoardContent(board.getBoardContent());
		
		return dbBoard; //수정된 값이 들어간 dbBoard 리턴해준다.
	}

	/**
	 * 삭제하기_2021.12.05
	 * */
	@Override
	public void delete(Long boardNo, String password) {
		// 비밀번호 검증
		Board board = boardRepository.findById(boardNo).orElse(null);
		if(board == null) throw new RuntimeException("글번호 오류로 삭제할 수 없습니다.");
		
		if(board.getPassword().equals(password)) {
			throw new RuntimeException("비밀번호를 다시 확인해주세요(삭제실패)");
		}

		boardRepository.delete(board);
	}

	/**
	 * 카테고리별 검색
	 * */
	@Override
	public Page<Board> findByBoardKind(int boardKind, Pageable pageable) {
		return boardRepository.findByBoardKind(boardKind, pageable);
	}

	/**
	 * 지역방 지역카테고리별 검색
	 * */
	@Override
	public Page<Board> findByTag(Long tagrel_no, Pageable pageable) {
		//Tag tag = Tag.builder().tagrelNo(tagrel_no).build();
		System.out.println("service........");
		Page<Board> p = boardRepository.selectByTag(tagrel_no, pageable);;
		System.out.println("end ---------------");
		return p;
	}

	@Override
	public List<Board> findByChallengeNo(Long challengeNo) {
		return boardRepository.findByChallengeNo(challengeNo);
	}

}
