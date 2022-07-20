package lotte.com.toy.dao;

import lotte.com.toy.dto.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao{

    @Autowired
    SqlSession session;

    String nameSpace = "Product.";


    @Override
    public ProductDto findByProductId(int productId) {
        return session.selectOne(nameSpace+"findByProductId",productId);
    }
}
