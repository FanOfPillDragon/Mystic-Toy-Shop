package lotte.com.toy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao{

    @Autowired
    SqlSession session;

    String nameSpace = "categories.";

    
}
