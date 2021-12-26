package kosta.mvc.service;

import kosta.mvc.domain.Reply;

public interface ReplyService {
	/**
	 * 등록하기
	 * */
	void insert(Reply reply);
	
	/**
	 * 삭제하기
	 * */
	void delete(Long replyNo);
}
