package lotte.com.toy.dao;

import lotte.com.toy.dto.ProductDto;

public interface ProductDao {
    ProductDto findByProductId(int productId);
}
