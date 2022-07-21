package lotte.com.toy.dao;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;

import java.util.List;

public interface ProductDao {
    ProductDto findByProductId(int productId);
    List<ProductResponseDto> getProductList();
    ProductResponseDto getProductByProductId(int productId);
    List<ProductResponseDto> getProductListByCategoryId(int categoryId);
    int product_write(ProductDto dto);
    List<ProductResponseDto> getProductListForMain();
}
