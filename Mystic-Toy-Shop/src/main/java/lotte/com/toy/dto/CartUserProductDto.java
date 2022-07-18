package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class CartUserProductDto {
    private int cart_id;
    private int cart_quantity;
    private int user_id;
    private int product_id;

    private String user_email;
    private int product_cost;
    private String product_name;

    @Override
    public String toString() {
        return "CartUserProductDto{" +
                "cart_id=" + cart_id +
                ", cart_quantity=" + cart_quantity +
                ", user_id=" + user_id +
                ", product_id=" + product_id +
                ", user_email='" + user_email + '\'' +
                ", product_cost=" + product_cost +
                ", product_name='" + product_name + '\'' +
                '}';
    }
}
