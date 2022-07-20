package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderStatsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderStatsDaoImpl implements OrderStatsDao{

    SqlSession session;

    String nameSpace = "OrderStats.";

    @Override
    public List<OrderStatsDto> getOrderStatsListByDate(Map<String, Object> sellerDate) {
        return session.selectList(nameSpace + "getOrderStatsByDate");
    }
}
