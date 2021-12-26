package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Grade {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "level_no_seq")
	@SequenceGenerator(sequenceName = "level_no_seq", allocationSize = 1, name = "level_no_seq")
	private int levelNo;	//레벨 번호
	private String levelName;	//레벨 이름	
	private String levelImg;	//등급 이미지
	private int levelMin;	//레벨당 최소경험치
	private int levelMax;	//레벨당 최대경험치
		
}
