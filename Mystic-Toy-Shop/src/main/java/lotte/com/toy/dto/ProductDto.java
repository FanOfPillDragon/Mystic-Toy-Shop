package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class ProductDto {

    private int product_id;
    private String product_name;
    private String product_info;
    private String product_img;
    private int product_cost;
    private int product_stock;
    private int product_sell_count;
    private int category_id;
    private int seller_id;

}
