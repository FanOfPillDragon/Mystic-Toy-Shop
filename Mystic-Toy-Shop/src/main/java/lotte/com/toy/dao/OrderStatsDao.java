package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderStatsDto;

import java.util.List;
import java.util.Map;

public interface OrderStatsDao {
    List<OrderStatsDto> getOrderStatsListByDate(Map<String, Object> sellerDate);
}
