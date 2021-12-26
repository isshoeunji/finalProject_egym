package kosta.mvc.domain.order;

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

import kosta.mvc.domain.product.Product;
import kosta.mvc.domain.product.ProductQuestion;
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
public class NonuserOrderDetail extends OrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nonuser_order_detail_no_seq")
	@SequenceGenerator(sequenceName = "nonuser_order_detail_no_seq", allocationSize = 1, name = "nonuser_order_detail_no_seq")
	private Long nonuserOrderDetailNo;  
	
	@ManyToOne 
	@JoinColumn(name = "nonuser_order_no")   //nonuser_order_detail테이블에 nonuser_order_no라는 필드 추가되고 fk설정
	private NonuserOrder nonuserOrder;
	
	@ManyToOne 
	@JoinColumn(name = "product_no")   //nonuser_order_detail테이블에 product_no라는 필드 추가되고 fk설정
	private Product product;
	
	private int productCount;
	private int orderStatus; //배송상태
	private String refundCheck; //환불 가능인지 체크
	private int status; //1이면 배송전 주문취소, 2면 반품
	

	
}
