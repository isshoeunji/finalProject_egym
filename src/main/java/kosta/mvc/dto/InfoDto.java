package kosta.mvc.dto;

import kosta.mvc.domain.Info;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class InfoDto {
	private int infoNo; 
	private int attendNo;
	private int contentNo;
	private int memberExp;

    public Info toEntity(){
        return Info.builder()
                .infoNo(infoNo)
                .attendNo(attendNo)
                .contentNo(contentNo)
                .memberExp(memberExp)
                .build();
    }

    @Builder
    public InfoDto(int infoNo, int attendNo, int contentNo, int memberExp) {
    	this.infoNo = infoNo;
        this.attendNo = attendNo;
        this.contentNo = contentNo;
        this.memberExp = memberExp;
    }
}
