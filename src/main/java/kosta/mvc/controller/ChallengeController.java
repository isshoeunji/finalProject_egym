package kosta.mvc.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Cart;
import kosta.mvc.domain.Challenge;
import kosta.mvc.domain.Info;
import kosta.mvc.domain.Member;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.service.BoardService;
import kosta.mvc.service.ChallengeService;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/challenge")
@RequiredArgsConstructor
public class ChallengeController {
	
	private final ChallengeService challengeService;
	  
	private final BoardService boardService;
	
	private final MemberService memberService; 
	
	
	 
	
	/**
	 * 전체 챌린지 조회
	 * boardKind == 5
	 */
	@RequestMapping("/select")
	public ModelAndView list(@RequestParam(defaultValue = "1") int nowPage) {
		int boardKind = 5;
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "boardNo" );
		ModelAndView mv = new ModelAndView();

		Page<Board> boardList = boardService.findByBoardKind(boardKind, pageable);
		mv.addObject("pageList", boardList);

		//상수로 잡자
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.setViewName("board/challenge/boardView");
		return mv;
	}
	
	/**
	 * 카테고리별 게시판 이동 
	 * 1. 30일 아침밥 챙기기 | 2. 30일 유산소 운동 | 3. 30일 플랭크 | 4. 30일 전신운동
	 */
	@RequestMapping("/select/{challengeCategory}")
	public ModelAndView categoryList(@PathVariable int challengeCategory, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1, 5, Direction.DESC, "boardNo" );
	
		//Board boardList = challengeService.findByCallengeCategory(challengeCategory, pageable);
		Page<Board> boardList = challengeService.findByCallengeCategory(challengeCategory, pageable);
		
		
		//상수로 잡자
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		ModelAndView mv = new ModelAndView();
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.addObject("pageList", boardList);
		mv.setViewName("board/challenge/boardView");
		//System.out.println(boardList.getSize());
		return mv;
	}
	
	                                                                         
	/**
	 * 등록폼
	 */
	@RequestMapping("/write")
	public String write() {
		return "board/challenge/write";
	}
	
	/**
	 * 등록하기
	 */
	@RequestMapping("/insert")
	public String insert(HttpSession session, Principal principal, Board board, int challengeCategory) {		
		  
		  //로그인한 memberId로 member객체가져오기 
		  Member member = memberService.selectByMemberId(principal.getName());
		  
		  //Info info = member.getInfo();
		  //System.out.println("info : "+info);
		  board.setBoardKind(5);

		  System.out.println("진행중인 챌린지가 있는지 조회");
		  //진행중인 challenge조회 
		  Challenge ischallenge =
				  challengeService.selectChallenge(challengeCategory, member.getMemberNo());
		  System.out.println("진행중인 챌린지는 : "+ischallenge);

		  //진행중인 챌린지가 있다.
		  if(ischallenge!=null) { 
			  if(ischallenge.getDailyCheck() == 0) {
				  //오늘 날짜구하기
				  LocalDate today = LocalDate.now();
				  System.out.println("today : "+today);
				  
				  //challengeNo에 해당하는 boardList 
				  List<Board> boardList = boardService.findByChallengeNo(ischallenge.getChallengeNo());

				  for(Board b : boardList) {				  
						  Info info = member.getInfo();
						  
						  //경험치 +10추가, 총 게시물 수 +1증가 
						  if(ischallenge.getChallengeCnt()<28) {
							  challengeService.update(info, 10);
						  }
						  //경험치 +50추가, 총 게시물 수 +1증가 
						  if(ischallenge.getChallengeCnt()==28) {
							  challengeService.update(info, 60);
							  
							  //챌린지 성공으로 상태바꾸기  
							  ischallenge.setChallengeState(2);
					  
						  }		  
				  }
				  
				//cnt증가
				  int challengeCnt=ischallenge.getChallengeCnt()+1;
				  ischallenge.setChallengeCnt(challengeCnt);
				  System.out.println("cnt증가!!");
				  
				  //dailyCheck 1로 바꾸기
				  ischallenge.setDailyCheck(1);
				  
				  challengeService.update(ischallenge);
				  
				  //member.setInfo(info);				  
			  }  
			  board.setMember(member);
			  board.setChallenge(ischallenge);
			  boardService.insert(board);
			  
			  //게시물 작성 수 1증가 
			  int contentNo=member.getInfo().getContentNo()+1;
			  member.getInfo().setContentNo(contentNo);
			  
		  } else {
			  //진행중인 챌린지가 없으니 challenge생성하고 board에 challenge넣기
			  Challenge challenge = new Challenge(null, null, 0, 0, challengeCategory, null, board.getMember(), 1);

			  
			  //경험치 증가, 게시물 작성 수 1증가
			  Info info = member.getInfo();
			  challengeService.update(info, 10);

			  challenge.setMember(member);
			  challengeService.insert(challenge);
			  board.setMember(member);
			  board.setChallenge(challenge);
			  boardService.insert(board);
			  		  
		  }
		    
		return "board/challenge/detail";
	}
	
	/**
	 * 해당 게시물 조회
	 */
	@RequestMapping("/detail/{boardNo}")
	public ModelAndView detail(@PathVariable Long boardNo, String flag) {
		boolean state = flag == null;
		
		Board board = boardService.selectBy(boardNo, state);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/challenge/detail");
		mv.addObject("board", board);
		
		return mv;
	}
	
	/**
	 * 수정폼
	 */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long boardNo) {
		System.out.println("수정폼 시작"+boardNo);
		Board b = boardService.selectBy(boardNo, false);	//조회수 증가 안됨
		System.out.println("boardService.selectBy결과 : "+b);
		ModelAndView mv = new ModelAndView("board/challenge/update", "board", b);
		return mv;
	}
	/**
	 * 수정완료
	 */
	@RequestMapping("/update")
	public ModelAndView update(Board board) {
		System.out.println("board update start");
		Board dbBoard = boardService.update(board);
		return new ModelAndView("board/challenge/detail", "board", dbBoard);
	}
	
	/**
	 * 삭제하기
	 */
	@RequestMapping("/delete")
	public String delete(Long boardNo, String password) {
		boardService.delete(boardNo, password);
		
		return "redirect:select";
	}
	
}
