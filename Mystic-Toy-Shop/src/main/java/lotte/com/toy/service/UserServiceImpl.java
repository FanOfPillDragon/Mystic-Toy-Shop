package lotte.com.toy.service;

import lotte.com.toy.dao.UserDao;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.SellerDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao dao;

    @Override
    public String getUserId(String user_id) {
        int count = dao.getUserId(user_id);
        return count>0?"NO":"YES";
    }

    @Override
    public boolean addUser(UserDto dto) {
        int n = dao.addUser(dto);
        return n>0?true:false;
    }

    @Override
    public UserDto userLogin(UserDto dto) {
        return dao.userLogin(dto);
    }

    @Override
    public String getSellerId(String seller_id) {
        int count = dao.getSellerId(seller_id);
        System.out.println(count + " :  getSellerId service");
        return count>0?"NO":"YES";
    }

    @Override
    public boolean addSeller(SellerDto dto) {
        int n = dao.addSeller(dto);
        return n>0?true:false;
    }

    @Override
    public SellerDto sellerLogin(SellerDto dto) {
        return dao.sellerLogin(dto);
    }
}
