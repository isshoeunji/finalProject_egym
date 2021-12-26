package kosta.mvc.domain.product;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mvc.domain.Member;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductQuestion {
    
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "product_question_no_seq")
	@SequenceGenerator(sequenceName = "product_question_no_seq", allocationSize = 1, name = "product_question_no_seq")
	private Long productQuestionNo;
	
	@ManyToOne 
	@JoinColumn(name = "product_no")   //productQuestion테이블에 product_no라는 필드 추가되고 fk설정
	private Product product;

	@ManyToOne 
	@JoinColumn(name = "member_no")   //productQuestion테이블에 member_no라는 필드 추가되고 fk설정
	private Member member;
		
	private String productQuestionTitle;
    private String productQuestionContent;
    
	@CreationTimestamp
	private LocalDateTime product_question_date;
	
}
