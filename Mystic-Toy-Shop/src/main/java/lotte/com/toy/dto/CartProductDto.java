package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class CartProductDto {
    private String productImg;
    private String productName;
    private int productCost;
    private int productQuantity;

}
