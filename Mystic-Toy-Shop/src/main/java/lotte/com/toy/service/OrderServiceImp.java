package lotte.com.toy.service;

import lotte.com.toy.dao.OrderDao;
import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;

import lotte.com.toy.dto.OrderGroupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImp implements OrderService{

    @Autowired
    OrderDao orderDao;

    @Override
    public List<OrderDetailDto> orderFindAll(OrderGroupDto groupDto) {
        return orderDao.findAll(groupDto);
    }

    @Override
    public OrderDetailDto orderFind(int orderId) {
        return orderDao.find(orderId);
    }

    @Override
    public List<OrderDetailDto> findDateOrderList(OrderDateDto date) {
        return orderDao.findDateOrderList(date);
    }

    @Override
    public List<Integer> findOrderGroupList() {
        return orderDao.findOrderGroupList();
    }

    @Override
    public List<Integer> findOrderGroupDateList(OrderDateDto date) {
        return orderDao.findOrderGroupDateList(date);
    }


}
