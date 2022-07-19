package lotte.com.toy.dao;

import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.SellerDto;

public interface UserDao {
    int getUserId(String id);
    int addUser(UserDto dto);
    UserDto userLogin(UserDto dto);
    int getSellerId(String id);
    int addSeller(SellerDto dto);
    SellerDto sellerLogin(SellerDto dto);
}
