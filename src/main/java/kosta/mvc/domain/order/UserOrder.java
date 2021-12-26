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

import org.hibernate.annotations.CreationTimestamp;

import kosta.mvc.domain.Member;
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
public class UserOrder extends Order{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_order_no_seq")
	@SequenceGenerator(sequenceName = "user_order_no_seq", allocationSize = 1, name = "user_order_no_seq")
	private Long userOrderNo;  
	
	@ManyToOne 
	@JoinColumn(name = "member_no")   //productQuestion테이블에 member_no라는 필드 추가되고 fk설정
	private Member member;
	
	@CreationTimestamp
	private LocalDateTime orderDate;
	
	private String orderAddr;
	private String receiverName;
	private String receiverPhone;
	
	@OneToMany(mappedBy = "userOrder", cascade= CascadeType.ALL)
	private List<UserOrderDetail> userOrderDetailList; 
	
}
