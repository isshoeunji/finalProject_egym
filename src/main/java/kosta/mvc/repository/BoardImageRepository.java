package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.BoardImage;

public interface BoardImageRepository extends JpaRepository<BoardImage, Long> {

}
