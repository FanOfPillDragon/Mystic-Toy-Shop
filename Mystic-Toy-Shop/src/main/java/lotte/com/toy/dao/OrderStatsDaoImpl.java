package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderStatsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderStatsDaoImpl implements OrderStatsDao{
    @Autowired
    SqlSession session;

    String nameSpace = "OrderStats.";

    @Override
    public OrderStatsDto getOrderStatsByDate(Map<String, Object> sellerDate) {
        return session.selectOne(nameSpace + "getOrderStatsByDate", sellerDate);
    }

    @Override
    public OrderStatsDto getOrderStatsWeek(int sellerId) {
        return session.selectOne(nameSpace + "getOrderStatsWeek", sellerId);
    }

    @Override
    public OrderStatsDto getOrderStatsMonth(int sellerId) {
        return session.selectOne(nameSpace + "getOrderStatsMonth", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsListWeekly(int sellerId) {
        return session.selectList(nameSpace+"getOrderStatsListWeekly", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsDate(Map<String, Object> sellerDate) {
        return session.selectList(nameSpace + "getOrderStatsByCatsDate", sellerDate);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId) {
        return session.selectList(nameSpace + "getOrderStatsByCatsWeek", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId) {
        return session.selectList(nameSpace + "getOrderStatsByCatsMonth", sellerId);
    }
}
