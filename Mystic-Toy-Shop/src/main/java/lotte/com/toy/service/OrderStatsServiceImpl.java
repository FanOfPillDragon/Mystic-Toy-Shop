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
    public List<OrderStatsDto> getOrderStatsListByDate(int sellerId, String inputDate) {

        HashMap<String, Object> sellerDate = new HashMap<String, Object>();
        sellerDate.put("seller_id", sellerId);
        sellerDate.put("order_date", inputDate);

        return orderStatsDao.getOrderStatsListByDate(sellerDate);
    }
}
