package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_no_seq")
	@SequenceGenerator(sequenceName = "reply_no_seq", allocationSize = 1, name = "reply_no_seq")
	private Long replyNo;
	private String replyContent;
	@CreationTimestamp
	private LocalDateTime replyRegdate;
	private int replyState;
	private int replyDepth;
	private int bundleId;
	private int bundleOrder;
	private int replySecret;
	
	//게시물이랑 다:1
	@ManyToOne
	@JoinColumn(name = "board_no")
	private Board board;
	
	//회원번호랑 다:1
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	//은지 sqldeveloper에서 memberNickname 컬럼 추가_2021.12.07
	private String memberNickname;
	
	//은지 sqldeveloper에서 member_id 컬럼 추가_2021.12.08
	private String memberId;
}
