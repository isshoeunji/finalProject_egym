/**
 * 작성자 : 서은지
 * 날짜 : 2021.12.06
 * */
package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Reply;
import kosta.mvc.repository.ReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ReplyServiceImpl implements ReplyService {

	private final ReplyRepository replyRep;
	
	@Override
	public void insert(Reply reply) {
		replyRep.save(reply); //등록

	}

	@Override
	public void delete(Long replyNo) {
		replyRep.deleteById(replyNo); //삭제
	}

}
