package lotte.com.toy.service;

import lotte.com.toy.dao.CategoryDao;
import lotte.com.toy.dao.ProductDao;
import lotte.com.toy.dto.ProdcutDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductDao productdao;

    @Override
    public ProdcutDto findByProductId(int productId) {
        return productdao.findByProductId(productId);
    }
}
