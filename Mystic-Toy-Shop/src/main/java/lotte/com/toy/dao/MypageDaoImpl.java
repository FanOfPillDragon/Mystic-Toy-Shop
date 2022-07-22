package lotte.com.toy.dao;

import lotte.com.toy.dto.UserUpdateName;
import lotte.com.toy.dto.UserUpdatePassword;
import lotte.com.toy.dto.UserUpdatePhone;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{

    @Autowired
    SqlSession session;

    String namespace = "Users.";

    @Override
    public int updateUserPassword(UserUpdatePassword password) {
        return session.update(namespace+"updateUserPassword",password);
    }

    @Override
    public int updateUserPhone(UserUpdatePhone phone) {
        return session.update(namespace+"updateUserPhone",phone);
    }

    @Override
    public int updateUserName(UserUpdateName name) {
        return session.update(namespace+"updateUserName",name);
    }

    @Override
    public int deleteUser(int userId) {
        return session.delete(namespace+"deleteUser",userId);
    }
}
