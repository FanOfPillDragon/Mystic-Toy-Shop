package lotte.com.toy.service;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;

import java.util.List;

public interface ProductService {
    ProductDto findByProductId(int productId);
    List<ProductResponseDto> getProductList();
    ProductResponseDto getProductByProductId(int productId);
    List<ProductResponseDto> getProductListByCategoryId(int categoryId);

    boolean product_write(ProductDto dto);

}
