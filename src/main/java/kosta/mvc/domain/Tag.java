/**
 * 2021-11-26
 * 서은지
 * */
package kosta.mvc.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tag_no_seq")
    @SequenceGenerator(sequenceName = "tag_no_seq" , allocationSize = 1 , name = "tag_no_seq")
	private Long tagrelNo; //태그 번호
	
	private String tegContent; //태그 내용
	
	//하나의 지역 태그에는 여러개의 게시물
	@OneToMany(mappedBy = "tag", cascade = CascadeType.ALL)
	private List<Board> boardList;

}
