package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Challenge {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "challenge_no_seq")
	@SequenceGenerator(sequenceName = "challenge_no_seq", allocationSize = 1, name = "challenge_no_seq")
	private Long challengeNo;	//챌린지 번호
	@CreationTimestamp
	private LocalDateTime challengeDate;	//챌린지 시작날짜
	private int challengeCnt;	//연속출석 수
	private int challengeState;	//진행상태(0:도전중, 1:실패, 2:도전성공)
	private int challengeCategory;	//챌린지 카테고리(1.아침밥, 2.유산소, 3.프랭크, 4.전신운동)
	
	@OneToMany(mappedBy = "challenge", cascade= CascadeType.REMOVE, orphanRemoval = true) // 1 : 다 / 지연로딩 : replyList가 필요할때만 꺼낸다.
	private List<Board> boards;	
	
	//회원이랑 ManyToOne
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	//필드 하나 더 추가 --> 이 필드는 매일 00:00에 
	//-->글을 썼는지 안 썼는지 확인 0으로 초기화되고 만약 1이면 -->challengeState ->0
	// 만약 1이면 challengeState -> 1로 수정되고
	//만약 글쓰면 1로 업데이트 되는
	private int dailyCheck;
	
	/**
	 * 글을 작성 -> dailyCheck : 1 
	 * 만약 1이면 challengeState -> 0
	 * 그리고 나서 dailyCheck 모두 0으로 초기화 
	 * 
	 * 그렇다면 완료된 챌린지는....? => 프로시져에서 처리 
	 */
	
	
}
