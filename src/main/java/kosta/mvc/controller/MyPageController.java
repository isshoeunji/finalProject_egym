package kosta.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Challenge;
import kosta.mvc.domain.Info;
import kosta.mvc.domain.Grade;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reply;
import kosta.mvc.domain.product.ProductImage;
import kosta.mvc.dto.MemberDto;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.MypageService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user/myPage")
@RequiredArgsConstructor
public class MyPageController {
	
	private final MypageService myPageService;
	private final MemberService memberService; 
	
	/**
	 * 마이페이지 - main
	 * member, info, level, 회원의 게시물, 회원의 챌린지,회원의 댓글 
	 * grade DB모두 가져오기 
	 */
	@RequestMapping("")
	public ModelAndView myPage(HttpSession session, Principal principal) {
		Member member = memberService.selectByMemberId(principal.getName());
		ModelAndView mv = new ModelAndView();
		
		//member
		mv.addObject("member", member);
		
		//boardList
		List<Board> boardList = member.getBoardList();
		mv.addObject("boardList", boardList);
		
		//챌린지
		List<Challenge> challengeList = member.getChallengeList();
		mv.addObject("challengeList", challengeList);
		
		//댓글
		
		//gradeList
		List<Grade> gradeList = myPageService.selectGradeList(); 
		
		mv.addObject("gradeList",gradeList);
		mv.setViewName("board/myPage/main");
		return mv;
	}
	
	/**
	 * 나의 게시물 모아보기
	 */
	@RequestMapping("/board")
	public ModelAndView board(HttpSession session, Principal principal, @RequestParam(defaultValue = "1") int nowPage) {
		Member member = memberService.selectByMemberId(principal.getName());
		Long memberNo = member.getMemberNo();
		
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "boardNo" );
		ModelAndView mv = new ModelAndView();
		
		Page<Board> pageList = myPageService.findBoard(memberNo, pageable);
		mv.addObject("pageList", pageList);
		
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		
		mv.addObject("member", member);
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		
		mv.setViewName("board/myPage/myBoard");
		return mv;
	}
	
	/**
	 * 나의 댓글 모아보기 
	 */
	@RequestMapping("/reply")
	public ModelAndView comments(HttpSession session, Principal principal, @RequestParam(defaultValue = "1") int nowPage) {
		Member member = memberService.selectByMemberId(principal.getName());
		Long memberNo = member.getMemberNo();
		
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "replyNo" );		
		ModelAndView mv = new ModelAndView();
		
		Page<Reply> pageReply = myPageService.findReply(memberNo, pageable);
		mv.addObject("pageReply", pageReply);
		
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;

		mv.addObject("member", member);		
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.setViewName("board/myPage/myReply");		
		return mv;
	}
	
	/**
	 * 내 정보 보기 
	 */
	@RequestMapping("/setting")
	public ModelAndView setting(HttpSession session, Principal principal) {	
		Member member = memberService.selectByMemberId(principal.getName());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", member);
		mv.setViewName("board/myPage/mySetting");
		return mv;
	}
	
	/**
	 * 내 정보 수정 
	 */
	@RequestMapping("/update")
	public String update(Member member, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session, Principal principal) throws Exception{
				
		String path = session.getServletContext().getRealPath("/save/myPage");	
		
		
		MultipartFile file = multipartHttpServletRequest.getFile("file");
		if(!file.isEmpty()) {
			File tempFile = new File(path+"/" + file.getOriginalFilename());
			String fileName = file.getOriginalFilename();
			
			if(tempFile.isFile()) {
	    		String saveFileName = "";
	    		String fileCutName = fileName.substring(0, fileName.lastIndexOf("."));
	    		String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
	    		
	    		boolean _exist = true;
	    		int index = 0;
	    		//동일한 파일명이 존재하지 않을때까지 반복한다.
	    		while(_exist) {
	    			index++;
	    			saveFileName = fileCutName + "(" + index + ")." +fileExt;
	    			
	    			_exist = new File(path+"/"+saveFileName).isFile();
	    			if(!_exist) fileName = saveFileName;
	    		}	    		
	    	}
			
			try {
			      file.transferTo(new File(path+"/" + fileName));
			}catch (Exception e) {
					e.printStackTrace();
			}
			member.setProfileImage(fileName);
			System.out.println("member.getProfileImage() : "+member.getProfileImage());
		}
		
		
		myPageService.update(member, path);
		
		return "redirect:/user/myPage/setting";
	}
	
	/**
	 * challengeNo에 해당하는 boardPage
	 */
	@RequestMapping("/challenge/{challengeNo}")
	public ModelAndView challenge(@PathVariable Long challengeNo, HttpSession session, Principal principal, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1,5, Direction.DESC, "boardNo" );
		Member member = memberService.selectByMemberId(principal.getName());
		ModelAndView mv = new ModelAndView();
		
		System.out.println("challengeNo : "+challengeNo);
		Page<Board> pageList = myPageService.findBoardByChallengeNo(challengeNo, pageable);
		mv.addObject("pageList", pageList);
		
		int blockCount=3;
		int temp = (nowPage-1)%blockCount;
		int startPage = nowPage -temp;
		
		mv.addObject("member", member);
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		
		mv.setViewName("board/myPage/myBoard");
		return mv;
	}
	
	/**
	 * 비밀번호 변경
	 */
	@RequestMapping(value="/changePwd", method=RequestMethod.POST)
	public String changePwd(HttpServletResponse response, MemberDto memberDto, String memberPwd, String newMemberPwd, Principal principal) throws Exception {
		
		Member member = memberService.selectByMemberId(principal.getName());
		
		boolean pwdCheck = memberService.checkPwd(response, memberPwd, member.getMemberPwd());
		System.out.println(pwdCheck);
		  
		if(pwdCheck) { 
			String memberId = principal.getName();
			memberService.changePwd(memberDto, newMemberPwd, memberId); 
		}
		
		return "redirect:/user/myPage/setting";
	}
}


