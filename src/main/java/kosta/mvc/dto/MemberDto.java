package kosta.mvc.dto;

import java.time.LocalDateTime;

import kosta.mvc.domain.Member;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberDto {
	private Long memberNo; //회원번호
	private String memberId; //회원아이디
	private String memberPwd;
	private String memberName;
	private String memberNickname;
	private int memberGender;
	private String memberEmail;
	private String memberBirth;
	private String memberPhone;
	private String profileImage;
	
	private LocalDateTime memberJoindate;
    private LocalDateTime memberModifiedDate;

    public Member toEntity(){
        return Member.builder()
                .memberNo(memberNo)
                .memberId(memberId)
                .memberPwd(memberPwd)
                .memberName(memberName)
                .memberNickname(memberNickname)
                .memberGender(memberGender)
                .memberEmail(memberEmail)
                .memberBirth(memberBirth)
                .memberPhone(memberPhone)
                .build();
    }

    @Builder
    public MemberDto(Long memberNo, String memberId, String memberPwd, String memberName,
    		String memberNickname, int memberGender, String memberEmail, String memberBirth, String memberPhoneNumber) {
    	this.memberNo = memberNo;
        this.memberId = memberId;
        this.memberPwd = memberPwd;
        this.memberName = memberName;
        this.memberNickname = memberNickname;
        this.memberGender = memberGender;
        this.memberEmail = memberEmail;
        this.memberBirth = memberBirth;
        this.memberPhone = memberPhone;
    }
}
