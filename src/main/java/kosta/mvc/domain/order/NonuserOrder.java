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
import org.springframework.data.jpa.repository.JpaRepository;

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
public class NonuserOrder extends Order{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nonuser_order_no_seq")
	@SequenceGenerator(sequenceName = "nonuser_order_no_seq", allocationSize = 1, name = "nonuser_order_no_seq")
	private Long nonuserOrderNo;  
	
	
	@CreationTimestamp
	private LocalDateTime orderDate;
	
	private String orderAddr;
	private String receiverName;
	private String receiverPhone;
	
	@OneToMany(mappedBy = "nonuserOrder", cascade= CascadeType.ALL)
	private List<NonuserOrderDetail> nonuserOrderDetailList; 
	
}
