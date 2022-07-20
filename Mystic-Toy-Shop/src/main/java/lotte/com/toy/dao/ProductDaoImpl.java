package lotte.com.toy.dao;

import lotte.com.toy.dto.ProdcutDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    SqlSession session;

    String nameSpace = "product.";

    @Override
    public int product_write(ProdcutDto dto) {
        return session.insert(nameSpace + "product_write", dto);
    }
}
