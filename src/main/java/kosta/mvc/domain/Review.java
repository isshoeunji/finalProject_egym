package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mvc.domain.order.UserOrderDetail;
import kosta.mvc.domain.product.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_no_seq")
	@SequenceGenerator(sequenceName = "review_no_seq", allocationSize = 1, name = "review_no_seq")
	private Long reviewNo; //리뷰번호
	
	private String reviewName; //리뷰제목
	private String reviewContent; //리뷰내용
	
	@CreationTimestamp
	private LocalDateTime reviewDate; //리뷰작성날짜
	
	@ManyToOne
	@JoinColumn(name="member_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="product_no")
	private Product product;

	@OneToOne
	@JoinColumn(name = "user_order_detail_no") //review 테이블에 user_order_detail_no를 fk로 설정
	private UserOrderDetail userOrderDetail;
	
	private int rating; //별점
	private String reviewImage; //이미지
}
