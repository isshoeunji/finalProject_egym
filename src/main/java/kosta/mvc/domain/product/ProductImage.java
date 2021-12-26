package kosta.mvc.domain.product;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class ProductImage {
    
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "product_image_no_seq")
	@SequenceGenerator(sequenceName = "product_image_no_seq", allocationSize = 1, name = "product_image_no_seq")
	private Long productImageNo;//상품번호
	
	@ManyToOne 
	@JoinColumn(name = "product_no")   //productQuestion테이블에 product_no라는 필드 추가되고 fk설정
	private Product product;
	
    private String productImageName;
    
    private Long productImageSize;
    
	@CreationTimestamp
	private LocalDateTime productImageDate;
	
	
	
	
}
