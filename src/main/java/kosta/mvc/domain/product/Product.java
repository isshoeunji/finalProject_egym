package kosta.mvc.domain.product;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import kosta.mvc.domain.Review;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Product {

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "product_no_seq")
	@SequenceGenerator(sequenceName = "product_no_seq", allocationSize = 1, name = "product_no_seq")
	private Long productNo;//상품번호
	private int cateCode;
    private String productName;
    
    @Lob
    private String productContent;
    
    private int price;
    private int stock;
    
	@CreationTimestamp
	private LocalDateTime productDate;
	
	private int readNum;
	
	@OneToMany(mappedBy = "product", cascade= CascadeType.ALL)
	private List<ProductQuestion> productQuestionList; 
	
	@OneToMany(mappedBy = "product", cascade= CascadeType.ALL)
	private List<ProductImage> productImageList; 
	
	@OneToMany(mappedBy = "product", cascade= CascadeType.ALL)
	private List<Review> productReviewList;
}
