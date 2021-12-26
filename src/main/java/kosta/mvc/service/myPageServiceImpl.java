package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Board;
import kosta.mvc.domain.Challenge;
import kosta.mvc.domain.Grade;
import kosta.mvc.domain.Info;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reply;
import kosta.mvc.repository.BoardRepository;
import kosta.mvc.repository.ChallengeRepository;
import kosta.mvc.repository.GradeRepository;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.repository.ReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class myPageServiceImpl implements MypageService {

	private final BoardRepository boardRepository;
	private final MemberRepository memberRepository;
	private final ChallengeRepository challengeRepository;
	private final GradeRepository gradeRepository;
	private final ReplyRepository replyRepository;
	
	@Override
	public Member findByMemberNo(Long memberNo) {
		Member member =  memberRepository.findById(memberNo).orElse(null);
		return member;
	}

	@Override
	public Page<Board> findBoard(Long memberNo, Pageable pageable) {
		return boardRepository.findByMemberNo(memberNo, pageable);
				
	}

	@Override
	public Info findInfo(Long memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> findBoard(Long memberNo) {
		
		return boardRepository.findByChallengeNo(memberNo);
	}

	@Override
	public List<Challenge> findChallenge(Long memberNo) {
		return challengeRepository.findByMemberNo(memberNo);
	}

	@Override
	public Page<Board> findBoardByChallengeNo(Long challengeNo, Pageable pageable) {
		return boardRepository.findByChallengeNo(challengeNo, pageable);
	}

    /**
     * 마이페이지 - 개인정보 수정 
     */
	public void update(Member member, String path) {
		Member dbMember = memberRepository.selectByMemberId(member.getMemberId());
		System.out.println("dbMember : "+dbMember.getMemberId());
		System.out.println("dbMember : "+dbMember.getMemberName());
		dbMember.setMemberName(member.getMemberName());
		System.out.println("저장 후 : "+dbMember.getMemberName());
		dbMember.setMemberNickname(member.getMemberNickname());
		dbMember.setMemberEmail(member.getMemberEmail());
		dbMember.setMemberBirth(member.getMemberBirth());
		dbMember.setMemberMessage(member.getMemberMessage());
		if(member.getProfileImage()!=null) {
			dbMember.setProfileImage(member.getProfileImage());
		}
		
		memberRepository.save(dbMember);
		System.out.println("member.getProfileImage() : "+member.getProfileImage());
	}

	@Override
	public List<Grade> selectGradeList() {
		return gradeRepository.findAllGrade();
	}

	@Override
	public Page<Reply> findReply(Long memberNo, Pageable pageable) {
		return replyRepository.findByMemberNo(memberNo, pageable);
	}

}
