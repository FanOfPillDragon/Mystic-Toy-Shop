package lotte.com.toy.dao;

import lotte.com.toy.dto.UserUpdateName;
import lotte.com.toy.dto.UserUpdatePassword;
import lotte.com.toy.dto.UserUpdatePhone;

public interface MypageDao {
    int updateUserPassword(UserUpdatePassword password);
    int updateUserPhone(UserUpdatePhone phone);
    int updateUserName(UserUpdateName name);
    int deleteUser(int userId);
}
