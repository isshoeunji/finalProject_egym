package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "address_no_seq")
	@SequenceGenerator(sequenceName = "address_no_seq", allocationSize = 1, name = "address_no_seq")
	private Long addressNo;
	private String memberAddress;
	private String memberZip;
	private int checkBasic;
	
	//회원번호랑 다:1
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	private String receiver;
	private String phone;
	private String memberDetailAddress;
	
	
}
