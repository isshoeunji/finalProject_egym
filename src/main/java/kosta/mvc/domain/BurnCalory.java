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
public class BurnCalory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "burn_calory_no_seq")
	@SequenceGenerator(sequenceName = "burn_calory_no_seq", allocationSize = 1, name = "burn_calory_no_seq")
	private Long burncaloryNo;
	
	private String exerciseKind;
	
	private String exerciseIntensity;
	
	private String exercise;
	private float metPoint;
	
}
