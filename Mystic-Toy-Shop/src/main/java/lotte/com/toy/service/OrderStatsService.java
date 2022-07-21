package lotte.com.toy.service;

import lotte.com.toy.dto.OrderStatsDto;

import java.util.List;
import java.util.Map;

public interface OrderStatsService {

    OrderStatsDto getOrderStatsByDate(int sellerId, String inputDate);

    OrderStatsDto getOrderStatsWeek(int sellerId);

    OrderStatsDto getOrderStatsMonth(int sellerId);

    List<OrderStatsDto> getOrderStatsListWeekly(int sellerId);

    List<OrderStatsDto> getOrderStatsByCatsDate(int sellerId, String inputDate);

    List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId);

    List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId);




}
