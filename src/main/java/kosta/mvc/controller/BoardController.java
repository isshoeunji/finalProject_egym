/**
 * 작성자 : 서은지
 * */
package kosta.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Tag;
import kosta.mvc.service.BoardService;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private final BoardService boardService;
	
	private final MemberService memberService;
	
	/**
	 * 등록폼
	 * */
	@RequestMapping("/write")
	public void write(Principal principal) {
	}
	
	/**
	 * 등록하기(커뮤니티 게시판, 다이어트꿀팁 게시판)
	 * */
	@RequestMapping("/insert")
	public String insert(Principal principal, Board board, Tag tag) throws NullPointerException {
			String[] tagList = {"서울", "경기·인천","강원도","충청도","전라도","경상도","제주도"};
			//System.out.println("principle.getName() : "+principal.getName()); // eunji?
			
			//로그인한 memberId로 member객체가져오기 
			Member member = memberService.selectByMemberId(principal.getName());
			//System.out.println("member : " + member); //member객체
			
			//해당 member객체의 memberNickname 가져와서 memberNick에 담기
			String memberNick = member.getMemberNickname();
			//System.out.println("memberNick : " + memberNick); //isshoeunji
			
			//memberId 담기
			String memberId = member.getMemberId();
			
		    //System.out.println(tag.getTagrelNo());
		    
		    if(tag.getTagrelNo() != null) { //지역방의 지역카테고리 값이 들어오면
		    	tag.setTegContent(tagList[Math.toIntExact(tag.getTagrelNo())-2]);
		    	board.setTag(tag);
		    }
		    
		    board.setMemberId(memberId);
		    board.setMember(member);
		    board.setMemberNickname(memberNick);
		    boardService.insert(board);
		
		return "redirect:/board/select/" + board.getBoardKind();
	}
	
	/**
	 * 게시판 수정폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long boardNo, int boardKind) {
		//System.out.println("수정폼 시작"+boardNo);
		//System.out.println("수정폼 시작 boardKind ===> " + boardKind);
		Board board = boardService.selectBy(boardNo, false); //조회수 증가x
		if(boardKind == 6) {
			ModelAndView mv = new ModelAndView("board/updateHometraining", "board", board);
			return mv;
			
		} else if(boardKind >= 7 && boardKind <= 10) {
			ModelAndView mv = new ModelAndView("board/udateDietTip", "board", board);
			return mv;
			
		} else {
			ModelAndView mv = new ModelAndView("board/update", "board", board);
			return mv;
		}
	}
	
	/**
	 * 수정 완료
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Board board) {
		System.out.println("수정완료 controller의 update 메소드...");
		System.out.println(board.getBoardNo());
		
		Board dbBoard = boardService.update(board);
		return new ModelAndView("board/detail", "board", dbBoard);
	}
	
	/**
	 * 카테고리별 게시판 이동 by은지_2021.12.03
	 * */
	@RequestMapping("/select/{boardKind}")
	public ModelAndView list(@PathVariable int boardKind, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "boardNo" );
		ModelAndView mv = new ModelAndView();
		if(boardKind == 0) { //boardKind가 view에서 0으로 넘어온다면
			Page<Board> boardList = boardService.selectAll(pageable); //board의 전체를 가지고 와서 boardList에 담아준다
			mv.addObject("pageList", boardList);
			mv.setViewName("board/boardView");
			
		} else if(boardKind == 6) { //홈트레이닝(운동) 게시판으로 이동_2021.12.05
			Page<Board> boardList = boardService.findByBoardKind(boardKind, pageable);
			mv.addObject("pageList", boardList);
			mv.setViewName("board/hometraining");
			
		} else if(boardKind >= 7 && boardKind <= 10) { //7,8,9,10 은 dietTip.jsp로 이동_2021.12.08
			Page<Board> boardList = boardService.findByBoardKind(boardKind, pageable);
			mv.addObject("pageList", boardList);
			mv.setViewName("board/dietTip");
		}
		
		else { //boardkind가 0 이외의 값으로 들어오면 boardKind에 맞는 게시물들만 찾아준다.
			Page<Board> boardList = boardService.findByBoardKind(boardKind, pageable);
			mv.addObject("pageList", boardList);
			mv.setViewName("board/boardView");
		}
		//상수로 잡자
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		//System.out.println(boardList.getSize());
		return mv;
	}
	
	/**
	 * 지역방, 홈트레이닝게시판 카테고리별 게시판 이동
	 * */
	@RequestMapping("/selectByTag/{tagrelNo}")
	public ModelAndView selectByTag(@PathVariable Long tagrelNo, @RequestParam(defaultValue = "1") int nowPage) {
		//System.out.println("tagrelNo : " + tagrelNo);
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "boardNo" );
		Page<Board> boardList = boardService.findByTag(tagrelNo, pageable);
		
		//상수로 잡자
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		ModelAndView mv = new ModelAndView();
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.addObject("pageList", boardList);
		if(tagrelNo >= 21 && tagrelNo <= 27) {
			mv.setViewName("board/hometraining");
		} else {
			mv.setViewName("board/boardView");
		}
		return mv;
	}
	
	
	/**
	 * 해당 게시물 상세 조회 
	 */
	@RequestMapping("/detail/{boardNo}")
	public ModelAndView detail(@PathVariable Long boardNo, String flag) {
		boolean state = flag == null;
		Board board = boardService.selectBy(boardNo, state);
		
		//게시물 댓글 개수구하기 test_2021.12.07은지
		//System.out.println("board.getReplyList().size() ===> " + board.getReplyList().size());
		//System.out.println("board.getMemberId()" + board.getMemberId());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/detail");
		mv.addObject("board", board);
		
		return mv;
	}
	
	/**
	 * 삭제하기_2021.12.05
	 * */
	@RequestMapping("/delete")
	public String delete(Board board, Long boardNo, String password) {
		boardService.delete(boardNo, password);
		
		return "redirect:/board/select/" + board.getBoardKind();
	}
	
	/**
	 * 홈트레이닝 게시물 등록폼_2021.12.06
	 * */
	@RequestMapping("/writeHometraining")
	public void writeHometraining() {
		
	}
	
	
	/**
	 * 홈트레이닝 게시물 등록하기_2021.12.06
	 * */
	@RequestMapping("/insertHometarining")
	public String insertHometraining(Principal principal, Board board, Tag tag) {
		String[] tagList = {"전신", "복부", "상체", "하체", "스트레칭", "댄스", "요가"};

		//로그인한 memberId로 member객체가져오기 
		Member member = memberService.selectByMemberId(principal.getName());
		
		//해당 member객체의 memberNickname 가져와서 memberNick에 담기
		String memberNick = member.getMemberNickname();
		
		//memberId 담기
		String memberId = member.getMemberId();
		
		tag.setTegContent(tagList[Math.toIntExact(tag.getTagrelNo()-21)]);
		board.setTag(tag);
		
		board.setMemberId(memberId);
	    board.setMember(member);
	    board.setMemberNickname(memberNick);
		boardService.insert(board);
		
		return "redirect:/board/select/6";
	}
	
	/**
	 * 다이어트 꿀팁 게시물 등록폼_2021.12.08
	 * */
	@RequestMapping("/writeDietTip")
	public void writeDietTip() {
		
	}
	
	
}
