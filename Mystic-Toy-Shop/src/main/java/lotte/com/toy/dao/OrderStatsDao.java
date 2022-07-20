package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderStatsDto;

import java.util.List;
import java.util.Map;

public interface OrderStatsDao {

    /**
     * [집계] 특정 날짜의 결제 금액, 주문상품수량, 주문량
     * @param sellerDate : 판매자 id, 날짜
     * @return
     */
    OrderStatsDto getOrderStatsByDate(Map<String, Object> sellerDate);

    /**
     * [집계] 일주일간의 결제 금액, 주문상품수량, 주문량
     * @param sellerId :판매자 id
     * @return
     */
    OrderStatsDto getOrderStatsWeek(int sellerId);

    /**
     * [집계] 한달간의 결제 금액, 주문상품수량, 주문량
     * @param sellerId :판매자 id
     * @return
     */
    OrderStatsDto getOrderStatsMonth(int sellerId);

    /**
     * [집계] 주간 요일 별 결제 금액, 주문상품수량, 주문량
     * @param sellerId
     * @return
     */
    List<OrderStatsDto> getOrderStatsListWeekly(int sellerId);

    /**
     * 카테고리별 결제 금액 / 상품수량 / 주문량 (특정 날짜)
     * @param sellerDate
     * @return
     */
    List<OrderStatsDto> getOrderStatsByCatsDate(Map<String, Object> sellerDate);

    /**
     * 카테고리별 이번 주 결제 금액 / 상품수량 / 주문량 (특정 날짜)
     * @param sellerId
     * @return
     */
    List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId);

    /**
     * 카테고리별 이번 달 결제 금액 / 상품수량 / 주문량 (특정 날짜)
     * @param sellerId
     * @return
     */
    List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId);
}
