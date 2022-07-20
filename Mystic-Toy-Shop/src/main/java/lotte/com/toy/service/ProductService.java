package lotte.com.toy.service;

import lotte.com.toy.dto.ProductDto;

public interface ProductService {
    ProductDto findByProductId(int productId);
}
