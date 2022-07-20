package lotte.com.toy.dao;

import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.SellerDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SqlSession session;

    String ns = "Users.";

    @Override
    public int getUserId(String user_id) {
        int count = session.selectOne(ns + "getUserId", user_id);
        return count;
    }

    @Override
    public UserDto userLogin(UserDto dto) {
        return session.selectOne(ns+"userLogin", dto);
    }

    @Override
    public int addUser(UserDto dto) {
        System.out.println(dto.getUser_kakao_identifier() + "comen on!!");
        return session.insert(ns + "addUser", dto);
    }

    @Override
    public int getKakaoId(String user_kakao_identifier) {        System.out.println(user_kakao_identifier + " dao");
        int a = session.selectOne(ns + "getKakaoId", user_kakao_identifier);
        System.out.println(a + "dao");
        return a;

    }
    @Override
    public int getSellerId(String seller_id) {
        return session.selectOne(ns + "getSellerId", seller_id);
    }

    @Override
    public int addSeller(SellerDto dto) {
        return session.insert(ns + "addSeller", dto);
    }

    @Override
    public SellerDto sellerLogin(SellerDto dto) {
        return session.selectOne(ns + "sellerLogin", dto);
    }

}
