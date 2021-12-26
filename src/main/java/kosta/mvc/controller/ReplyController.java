/**
 * 작성자 : 서은지
 * 날짜 : 2021.12.06
 * */
package kosta.mvc.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reply;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.ReplyService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reply")
@RequiredArgsConstructor
public class ReplyController {
	
	private final ReplyService replyService;

	private final MemberService memberService;
	
	/**
	 * 댓글 등록
	 * */
	@RequestMapping("/insert")
	public String insert(Principal principal, Reply reply, Long boardNo) {
		//로그인한 memberId로 member 객체 가져오기
		Member member = memberService.selectByMemberId(principal.getName());
		
		//member 객체의 memberNickname 가져와서 memberNick에 담기
		String memberNickname = member.getMemberNickname(); 
		//System.out.println("memberNickname : " + memberNickname);
		String memberId = member.getMemberId();
		
		//부모글번호를 Reply에 세팅
		reply.setBoard(Board.builder().boardNo(boardNo).build());
		
		//댓글 객체에 로그인 되어있는 member객체를 넣어준다
		reply.setMember(member);
		reply.setMemberId(memberId);
		reply.setMemberNickname(memberNickname);
		replyService.insert(reply);
		
		//댓글 등록 후 부모글의 상세보기 페이지로 이동
		return "redirect:/board/detail/"+boardNo+"?flag=1";
	}
	
	/**
	 * 댓글 삭제하기
	 * */
	@RequestMapping("/delete/{replyNo}/{boardNo}")
	public String delete(@PathVariable Long replyNo, @PathVariable Long boardNo) {
		replyService.delete(replyNo);
		
		return "redirect:/board/detail/"+boardNo+"?flag=1";
	}
}
