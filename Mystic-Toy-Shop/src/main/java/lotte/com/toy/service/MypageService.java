package lotte.com.toy.service;

import lotte.com.toy.dto.UserUpdateName;
import lotte.com.toy.dto.UserUpdatePassword;
import lotte.com.toy.dto.UserUpdatePhone;

public interface MypageService {
    boolean updateUserPassword(UserUpdatePassword password);
    boolean updateUserPhone(UserUpdatePhone phone);
    boolean updateUserName(UserUpdateName name);
    boolean deleteUser(int userId);
}
