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
public class BoardImage {
    
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_image_no_seq")
	@SequenceGenerator(sequenceName = "board_image_no_seq", allocationSize = 1, name = "board_image_no_seq")
	private Long boardImageNo; //게시판 이미지 번호
	
	@ManyToOne 
	@JoinColumn(name = "board_no")   //boardImage테이블에 board_no라는 필드 추가되고 fk설정
	private Board board;
	
    private String boardImageName;
    
    private Long boardImgaeSize;
    
	@CreationTimestamp
	private LocalDateTime boardImageDate;
}