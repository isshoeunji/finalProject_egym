package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
public class Info {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "info_no_seq")
	@SequenceGenerator(sequenceName = "info_no_seq", allocationSize = 1, name = "info_no_seq")
	private int infoNo; 
	private int attendNo;
	private int contentNo;
	private int memberExp;
	private Integer attendCheck;

	@Builder
    public Info(int infoNo, int attendNo, int contentNo, int memberExp, int check) {
        this.infoNo = infoNo;
        this.attendNo = attendNo;
        this.contentNo = contentNo;
        this.memberExp = memberExp;
        this.attendCheck = attendCheck;
    }
	
	@OneToOne
	@JoinColumn(name = "member_no")
	private Member member; 
	
}
