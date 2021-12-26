package kosta.mvc;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.BurnCalory;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.repository.BoardRepository;
import kosta.mvc.repository.BurnCalorieRepository;
import kosta.mvc.repository.ChallengeRepository;
import kosta.mvc.repository.InfoRepository;
import kosta.mvc.repository.UserOrderDetailRepository;
import kosta.mvc.service.MemberService;

@SpringBootTest
@Transactional // DML문장을 하기 위해서는 필수!!
@Commit // 자동으로 커밋이 이루어진다.
public class BoardRepositoryTest {

	@Autowired
	private UserOrderDetailRepository rep;

	@Autowired
	private ChallengeRepository crep;
	
	@Autowired
	private BurnCalorieRepository brep;
	
	@Autowired
	private InfoRepository irep;
	
	@Autowired
	private MemberService ms;
	//	@Autowired
//	private BoardRepository rep;

	@Test
	public void test() {
		System.out.println("Board관련 테스트 할 예정입니다.");
	}

	/**
	 * 전체검색
	 */
//	  @Test
//	  public void selectAll() { 
//		  List<Board> boardList = rep.findAll();
//		  System.out.println("갯수 : " + boardList.size());
//	  
//	  
//		  for(Board b : boardList) { 
//			  System.out.println(b); 
//		  }
//	  
//		  boardList.forEach(b->System.out.println(b));
//		  
//	  }
//	 

	/**
	 * 등록하기
	 */
//	@Test
//	void insert() {
//		//자유게시판 등록 (boardKind - 3)
//		
//		  for (int i = 0; i < 5; i++) { 
//			  // rep.save(new FreeBoard(null, null, null, null, null, null, null, i));
//			  Board board = Board.builder().boardTitle("제목" +i).boardContent("자유내용자유내용" + i).boardKind(3).password("1234").build();
//		  
//		  rep.save(board); }
//		 
//	}
	
	/**
	 * 검색 test
	 * */
	
	 @Test 
	 public void testRead() {
		 irep.updateAttendCheck();
		 
	 }
	 

}
