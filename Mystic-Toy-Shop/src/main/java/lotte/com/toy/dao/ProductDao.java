package lotte.com.toy.dao;

import lotte.com.toy.dto.ProdcutDto;

import java.util.List;

public interface ProductDao {
    ProdcutDto findByProductId(int productId);
}
