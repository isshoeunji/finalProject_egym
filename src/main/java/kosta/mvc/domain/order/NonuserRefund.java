package kosta.mvc.domain.order;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class NonuserRefund {
    
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nonuser_refund_no_seq")
	@SequenceGenerator(sequenceName = "nonuser_refund_no_seq", allocationSize = 1, name = "nonuser_refund_no_seq")
	private Long nonuserRefundNo;  
	
	@OneToOne 
	@JoinColumn(name = "nonuser_order_detail_no")   //userrefund테이블에 user_order_detail_no라는 필드 추가되고 fk설정
	private NonuserOrderDetail nonuserOrderDetail;
	
	private String refundReason;
	private String refundStatus;
	
}
