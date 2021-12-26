package kosta.mvc.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long> {

	/**
	 * 마이페이지 - memberNo에 해당하는 replyPage
	 */
	@Query(value="select r from Reply r where r.member.memberNo=?1")
	Page<Reply> findByMemberNo(Long memberNo, Pageable pageable);

}
