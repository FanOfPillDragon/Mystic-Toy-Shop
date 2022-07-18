package lotte.com.toy.service;

import lotte.com.toy.dto.CartDto;

import java.util.List;

public interface CartService {
    List<CartDto> getCartList();
    List<CartDto> getCartListByUserId(int userId);

    boolean insertCart(CartDto cartDto);
    boolean updateCart(CartDto cartDto);
    boolean deleteCartByCartId(CartDto cartDto);
}
