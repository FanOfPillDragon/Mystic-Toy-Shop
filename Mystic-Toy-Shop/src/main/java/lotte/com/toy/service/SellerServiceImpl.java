package lotte.com.toy.service;

import lotte.com.toy.dao.SellerDao;
import lotte.com.toy.dto.SellerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl implements SellerService {

    @Autowired
    SellerDao sellerdao;

    @Override
    public int findTotalCount(SellerDto seller) {
        return sellerdao.findTotalCount(seller);
    }

    @Override
    public int findSoldOut(SellerDto seller) {
        return sellerdao.findSoldOut(seller);
    }

    @Override
    public int findEndSale(SellerDto seller) {
        return sellerdao.findEndSale(seller);
    }

    @Override
    public int findReadyShip(SellerDto seller) {
        return sellerdao.findReadyShip(seller);
    }

    @Override
    public int findCompletedShip(SellerDto seller) {
        return sellerdao.findCompletedShip(seller);
    }
    @Override
    public int newOrders(String today) {
        return sellerdao.newOrders(today);
    }

    @Override
    public int newReviews(String today) {
        return sellerdao.newReviews(today);
    }

    @Override
    public int newQnAs(String today) {
        return sellerdao.newQnAs(today);
    }
}
