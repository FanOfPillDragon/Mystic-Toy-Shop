package lotte.com.toy.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrderStatsDto {
    int total_price;
    int total_quantity;
    int total_orders;

    String start_date;
    String end_date;
    String order_date;
    int weekday;

    String category_name;
}
