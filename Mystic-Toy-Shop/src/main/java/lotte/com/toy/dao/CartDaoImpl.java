package lotte.com.toy.dao;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDaoImpl implements CartDao {

    @Autowired
    SqlSession session;

    String nameSpace = "Cart.";

    @Override
    public List<CartDto> getCartList() {
        return session.selectList(nameSpace + "getCartList");
    }

    @Override
    public List<CartDto> getCartListByUserId(int userId) {
        return session.selectList(nameSpace + "getCartListByUserId", userId);
    }

    @Override
    public List<CartUserProductDto> getCartUserProductDtoByUserId(int userId) {
        return session.selectList(nameSpace + "getCartUserProductDtoByUserId", userId);
    }

    @Override
    public int insertCart(CartDto cartDto) {
        return session.insert(nameSpace+"insertCart",cartDto);
    }

    @Override
    public int updateCart(CartDto cartDto) {
        return session.update(nameSpace+"updateCart",cartDto);
    }

    @Override
    public int deleteCartByCartId(CartDto cartDto) {
        return session.delete(nameSpace + "deleteCartByCartId", cartDto);
    }
}
