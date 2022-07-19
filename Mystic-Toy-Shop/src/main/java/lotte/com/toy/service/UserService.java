package lotte.com.toy.service;

import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.SellerDto;

public interface UserService {
    String getUserId(String user_id);
    boolean addUser(UserDto dto);
    UserDto userLogin(UserDto dto);
    String getSellerId(String seller_id);
    boolean addSeller(SellerDto dto);
    SellerDto sellerLogin(SellerDto dto);
}