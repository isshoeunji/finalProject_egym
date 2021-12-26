/**
 * 2021-11-26
 * 서은지
 * */
package kosta.mvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_no_seq")
	@SequenceGenerator(sequenceName = "board_no_seq", allocationSize = 1, name = "board_no_seq")
	@Column(name = "BOARD_NO")
	private Long boardNo; //게시물 번호
	
	/**
	 * 1. 일기(운동/식단) | 2.  질문 및 답변  | 3. 자유 | 4. 지역 | 5. 30일 챌린지 | 6. 운동 |
	 * 7. 다이어트꿀팁 - 칼럼 | 8.다이어트꿀팁 - 운동 | 9. 다이어트꿀팁  - 식단 | 10. 다이어트꿀팁 - 성공후기
	 * */
	private int boardKind; 
	
	private String boardTitle; //제목
	
	@Lob
	private String boardContent; // 글내용
	
	
	private String password;
	
	@CreationTimestamp
	private LocalDate boardRegdate; //등록일
	
	@UpdateTimestamp
	private LocalDateTime boardUpdate; //55수정일
	
	private int boardReadnum; //조회수
	private int boardState; // 0 :공개 / 1 :비공개 / 2 :삭제
	private int boardRecommend; //추천수 
	
	//은지 thumbnail 컬럼 sqldeveloper에서 추가_2021.12.06
	private String thumbnail;
	
	//회원번호 다 : 1
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	//챌린지번호 다 : 1
	@ManyToOne
	@JoinColumn(name = "challenge_no")
	private Challenge challenge;
		
	private String memberNickname; //회원 닉네임 다 : 1
	
	//은지 member_id sqldeveloper에서 추가_2021.12.07
	private String memberId;
	
	@ManyToOne
	@JoinColumn(name = "tagrel_no")
	private Tag tag;
	
	@OneToMany(mappedBy = "board", cascade= CascadeType.ALL)
	private List<BoardImage> boardImageList; 
	
	//은지_2021.12.06
	@OneToMany(mappedBy = "board", cascade = CascadeType.ALL)
	private List<Reply> replyList;
}
