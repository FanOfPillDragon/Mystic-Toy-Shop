package lotte.com.toy.service;

import lotte.com.toy.dao.CartDao;
import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Override
    public List<CartDto> getCartList() {
        return cartDao.getCartList();
    }

    @Override
    public List<CartDto> getCartListByUserId(int userId) {
        return cartDao.getCartListByUserId(userId);
    }

    @Override
    public List<CartUserProductDto> getCartUserProductDtoByUserId(int userId) {
        return cartDao.getCartUserProductDtoByUserId(userId);
    }

    @Override
    public boolean insertCart(CartDto cartDto) {
        return cartDao.insertCart(cartDto) > 0;
    }

    @Override
    public boolean updateCart(CartDto cartDto) {
        return cartDao.updateCart(cartDto) > 0;
    }

    @Override
    public boolean deleteCartByCartId(CartDto cartDto) {
        return cartDao.deleteCartByCartId(cartDto) > 0;
    }
}
