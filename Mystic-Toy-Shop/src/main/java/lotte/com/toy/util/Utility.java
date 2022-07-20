package lotte.com.toy.util;

import lotte.com.toy.dto.CartUserProductDto;
import lotte.com.toy.dto.ProdcutDto;

import java.util.List;

public class Utility {

    public static int getTotalPrice(List<CartUserProductDto> cartUserProductDtoList) {
        int totalPrice = 0;

        for (CartUserProductDto cartUserProductDto : cartUserProductDtoList) {
            totalPrice += cartUserProductDto.getProduct_cost() * cartUserProductDto.getCart_quantity();
        }

        if (totalPrice != 0) {
            totalPrice += 2500;
        }

        return totalPrice;
    }

    public static int getTotalPriceByProduct(ProdcutDto productDto, int quantity) {
        return productDto.getProduct_cost() * quantity;
    }
}