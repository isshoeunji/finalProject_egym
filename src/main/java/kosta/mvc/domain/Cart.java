package kosta.mvc.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import kosta.mvc.domain.product.Product;
import kosta.mvc.domain.product.ProductImage;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cart_no_seq")
	@SequenceGenerator(sequenceName = "cart_no_seq", allocationSize = 1, name = "cart_no_seq")
	private Long cartNo; //장바구니번호
	
	private String cartValue;//비회원 식별값
	private int cartCount;//상품 수량
	
	@ManyToOne
	@JoinColumn(name="product_no")
	private Product product; //상품정보 -상품번호
	
		
	@ManyToOne
	@JoinColumn(name="member_no") 
	private Member member; //회원정보 -회원번호

}
