package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Address;

public interface AddressRepository extends JpaRepository<Address, Long> {

	@Query("select a from Address a inner join a.member m where m.memberId=?1")
	@Modifying
	List<Address> selectByMemberId(String memberId);

	@Query("select a from Address a where a.addressNo=?1")
	Address findByAddrNo(Long addressNo);
	
	@Query("select a from Address a inner join a.member m where m.memberId=?1 and a.checkBasic=1")
	Address findBasicAddr(String id);
}
