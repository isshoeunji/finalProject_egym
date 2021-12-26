package kosta.mvc.service;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.product.Product;
import kosta.mvc.domain.product.ProductImage;
import kosta.mvc.repository.product.ProductImageRepository;
import kosta.mvc.repository.product.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service  //생성 id="productServiceImpl"
@RequiredArgsConstructor
@Transactional
public class ProductServiceImpl implements ProductService {

	private final ProductRepository productRepository;
	private final ProductImageRepository productImageRepository;
	
	@Override
	public void insert(Product product) {
		
		Product dbProduct = productRepository.save(product);
		
		for(ProductImage image : product.getProductImageList()) {
			image.getProduct().setProductNo(dbProduct.getProductNo());
			productImageRepository.save(image);
		}
	}
	
	@Override
	public void update(Product product, String path) {
        Product dbProduct = productRepository.findById(product.getProductNo()).orElse(null);
		
		if(dbProduct==null) throw new RuntimeException("글번호 오류로 수정될 수 없습니다.");
		
		
		
		//정보수정
		//dbBoard.setContent(board.getContent().replace("<", "&lt;"));

		dbProduct.setProductName(product.getProductName());
		dbProduct.setProductContent(product.getProductContent());
		dbProduct.setPrice(product.getPrice());
		dbProduct.setStock(product.getStock());
		
		//기존에 있던 image들 삭제
		for(ProductImage image : dbProduct.getProductImageList()) {
			productImageRepository.deleteById(image.getProductImageNo());
			new File(path+"/"+image.getProductImageName()).delete();
		}
		
		//새로운이미지 테이블에 등록
		for(ProductImage image : product.getProductImageList()) {
			image.getProduct().setProductNo(dbProduct.getProductNo());
			productImageRepository.save(image);
		}
		
		
		dbProduct.setProductImageList(product.getProductImageList());
		
	}

	@Override
	public Page<Product> selectByCateCode(int cateCode, Pageable pageable) {
		return productRepository.findByCateCodeAndStockGreaterThan(cateCode, 0 , pageable);
	}

	@Override
	public Product selectByNo(Long productNo, boolean state) {
		if (state) {
			if (productRepository.readnumUpdate(productNo) ==0) {
				throw new RuntimeException("번호 오류로 조회수 증가 실패");
			}
		}
		
		return productRepository.findById(productNo).orElse(null);
	}

	@Override
	public List<Product> selectByReadNum() {
		List<Product> list = productRepository.selectByReadNum();
		return list;
	}

	@Override
	public List<Product> selectByDate() {
		
		return productRepository.selectByDate();
	}

	

}
