package lotte.com.toy.service;

import lotte.com.toy.dao.CategoryDao;
import lotte.com.toy.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl {

    @Autowired
    ProductDao productdao;

}
