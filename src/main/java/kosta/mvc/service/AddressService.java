package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Address;
import kosta.mvc.repository.AddressRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AddressService {
	
	private final AddressRepository addressRepository;
	
    public List<Address> selectAddrById(String memberId){
    	return addressRepository.selectByMemberId(memberId);
    }
    
    public void insertAddr(Address addr){
    	addressRepository.save(addr);
    	
    }
    
    public void deleteAddr(Long addressNo) {
    	addressRepository.deleteById(addressNo);
    }

    public Address findByAddrNo(Long addressNo) {
    	return addressRepository.findByAddrNo(addressNo);
    }
    
    public Address findBasicAddr(String id) {
    	return addressRepository.findBasicAddr(id);
    }
}
