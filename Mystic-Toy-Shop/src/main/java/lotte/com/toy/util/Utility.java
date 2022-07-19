package lotte.com.toy.util;

import lotte.com.toy.dto.CartUserProductDto;

import java.util.List;

public class Utility {

    public static int getTotalPrice(List<CartUserProductDto> cartUserProductDtoList){
        int totalPrice = 0;

        for(CartUserProductDto cartUserProductDto : cartUserProductDtoList){
            totalPrice += cartUserProductDto.getProduct_cost();
        }

        return totalPrice;
    }
}
