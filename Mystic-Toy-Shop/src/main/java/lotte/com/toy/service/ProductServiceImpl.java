package lotte.com.toy.service;

import lotte.com.toy.dao.ProductDao;
import lotte.com.toy.dto.ProdcutDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productdao;

    @Override
    public boolean product_write(ProdcutDto dto) {
        return productdao.product_write(dto)>0?true:false;
    }
}
