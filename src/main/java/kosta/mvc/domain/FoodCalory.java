package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
public class FoodCalory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "food_calory_no_seq")
	@SequenceGenerator(sequenceName = "food_calory_no_seq", allocationSize = 1, name = "food_calory_no_seq")
	private Long foodNo;	//음식번호
	
	private String foodName;
	
	private String regionManufac;
	
	private float foodQuantity;
	private String foodUnit;
	private float foodKcal;
	private float protein;
	private float fat;
	private float carbohydrate;
	private float sugars;
	private float na;
}
