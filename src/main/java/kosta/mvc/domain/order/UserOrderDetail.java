package kosta.mvc.domain.order;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Review;
import kosta.mvc.domain.product.Product;
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
public class UserOrderDetail extends OrderDetail{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_order_detail_no_seq")
	@SequenceGenerator(sequenceName = "user_order_detail_no_seq", allocationSize = 1, name = "user_order_detail_no_seq")
	private Long userOrderDetailNo;  
	
	@ManyToOne 
	@JoinColumn(name = "user_order_no")   //userorderdetail테이블에 user_order_no라는 필드 추가되고 fk설정
	private UserOrder userOrder;
	
	@ManyToOne 
	@JoinColumn(name = "product_no")   //userorderdetail테이블에 product_no라는 필드 추가되고 fk설정
	private Product product;
	
	private int productCount;
	private int orderStatus;
	private String refundCheck;
	private int status; //1이면 배송전 주문취소, 2면 반품
	
	@OneToOne(mappedBy = "userOrderDetail", cascade= CascadeType.ALL)
	private Review review;
}
