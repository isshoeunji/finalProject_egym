package kosta.mvc.repository.product;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.product.Product;
import kosta.mvc.domain.product.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {

}
