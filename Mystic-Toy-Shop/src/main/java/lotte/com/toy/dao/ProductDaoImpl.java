package lotte.com.toy.dao;

import lotte.com.toy.dto.ProdcutDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao{

    @Autowired
    SqlSession session;

    String nameSpace = "Product.";


    @Override
    public ProdcutDto findByProductId(int productId) {
        return session.selectOne(nameSpace+"findByProductId",productId);
    }
}
