package kosta.mvc.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	
    Optional<Member> findByMemberId(String memberId);
    
    //중복체크 쿼리
    boolean existsByMemberId(String memberId);
    boolean existsByMemberNickname(String memberNickname);
    
    //아이디찾기 쿼리
    Member findByMemberNameAndMemberPhone(String memberName, String memberPhone);
    Member findByMemberNameAndMemberEmail(String memberName, String memberEmail);
    
    //비밀번호찾기 쿼리
    Member findByMemberIdAndMemberNameAndMemberPhone(String memberId, String memberName, String memberPhone);
    Member findByMemberIdAndMemberNameAndMemberEmail(String memberId, String memberName, String memberEmail);
    
    //비밀번호변경 쿼리
    @Modifying
    @Query("update Member m set m.memberPwd=?1 where m.memberId=?2")
    int updateMemberPwd(String memberPwd, String memberId);
    
    @Modifying
    @Query("update Member m set m.memberPwd=?1 where m.memberId=?2")
    int updateMemberPwd(String memberPwd);
  
    
    @Query("select m from Member m where m.memberId=?1")
    Member selectByMemberId(String memberId);
    
    @Query("select m from Member m where m.memberNo=?1")
    Member selectByMemberNo(Long memberNo);
}