package lotte.com.toy.service;

import lotte.com.toy.dto.ProdcutDto;

import java.util.List;

public interface ProductService {
    ProdcutDto findByProductId(int productId);
}
