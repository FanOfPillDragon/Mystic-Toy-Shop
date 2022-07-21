package lotte.com.toy.service;

import lotte.com.toy.dao.OrderStatsDao;
import lotte.com.toy.dto.OrderStatsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderStatsServiceImpl implements OrderStatsService {

    @Autowired
    OrderStatsDao orderStatsDao;

    @Override
    public OrderStatsDto getOrderStatsByDate(int sellerId, String inputDate) {

        HashMap<String, Object> sellerDate = new HashMap<String, Object>();
        sellerDate.put("seller_id", sellerId);
        sellerDate.put("order_date", inputDate);

        return orderStatsDao.getOrderStatsByDate(sellerDate);
    }

    @Override
    public OrderStatsDto getOrderStatsWeek(int sellerId) {
        return orderStatsDao.getOrderStatsWeek(sellerId);
    }

    @Override
    public OrderStatsDto getOrderStatsMonth(int sellerId) {
        return orderStatsDao.getOrderStatsMonth(sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsListWeekly(int sellerId) {
        return orderStatsDao.getOrderStatsListWeekly(sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsDate(int sellerId, String inputDate) {

        HashMap<String, Object> sellerDate = new HashMap<String, Object>();
        sellerDate.put("seller_id", sellerId);
        sellerDate.put("order_date", inputDate);

        return orderStatsDao.getOrderStatsByCatsDate(sellerDate);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId) {
        return orderStatsDao.getOrderStatsByCatsWeek(sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId) {
        return orderStatsDao.getOrderStatsByCatsMonth(sellerId);
    }
}
