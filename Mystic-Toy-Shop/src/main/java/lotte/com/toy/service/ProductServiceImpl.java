package lotte.com.toy.service;

import lotte.com.toy.dao.ProductDao;
import lotte.com.toy.dto.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductDao productdao;

    @Override
    public ProductDto findByProductId(int productId) {
        return productdao.findByProductId(productId);
    }
}
