package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;

import lotte.com.toy.dto.OrderGroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import java.util.List;


@Repository
public class OrderDaoImp implements OrderDao{

    @Autowired
    SqlSession session;

    String namespace = "Order.";

    @Override
    public List<OrderDetailDto> findAll(OrderGroupDto groupDto) {
        List<OrderDetailDto> orderlist = session.selectList(namespace+"findAll",groupDto);
        return orderlist;
    }

    @Override
    public OrderDetailDto find(int orderId) {
        return session.selectOne(namespace+"find",orderId);
    }

    @Override
    public List<OrderDetailDto> findDateOrderList(OrderDateDto date) {

        return session.selectList(namespace+"findDate",date);
    }

    @Override
    public List<Integer> findOrderGroupList() {
        return session.selectList(namespace+"findOrderGroupList");
    }

    @Override
    public List<Integer> findOrderGroupDateList(OrderDateDto date) {
        return session.selectList(namespace+"findOrderGroupDateList", date);
    }
}
