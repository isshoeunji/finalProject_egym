package kosta.mvc.domain.order;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

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
public class UserRefund {
    
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_refund_no_seq")
	@SequenceGenerator(sequenceName = "user_refund_no_seq", allocationSize = 1, name = "user_refund_no_seq")
	private Long userRefundNo;  
	
	@OneToOne 
	@JoinColumn(name = "user_order_detail_no")   //userrefund테이블에 user_order_detail_no라는 필드 추가되고 fk설정
	private UserOrderDetail userOrderDetail;
	
	private String refundReason;
	private String refundStatus;
	
}
