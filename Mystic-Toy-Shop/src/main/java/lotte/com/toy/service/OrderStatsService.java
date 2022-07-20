package lotte.com.toy.service;

import lotte.com.toy.dto.OrderStatsDto;

import java.util.List;
import java.util.Map;

public interface OrderStatsService {


    /**
     * [집계] 특정 날짜의 결제 금액, 주문상품수량, 주문량
     * @param sellerId
     * @param inputDate
     * @return
     */
    List<OrderStatsDto> getOrderStatsListByDate(int sellerId, String inputDate);

}
