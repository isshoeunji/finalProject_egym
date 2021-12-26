package kosta.mvc.dto;

import java.util.List;

import kosta.mvc.domain.Cart;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartListDTO {
	
	private List<Cart> list;
	
}
