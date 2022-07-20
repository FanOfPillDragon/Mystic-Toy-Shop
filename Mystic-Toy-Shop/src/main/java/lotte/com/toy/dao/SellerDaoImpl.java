package lotte.com.toy.dao;

import lotte.com.toy.dto.SellerDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDaoImpl implements SellerDao {

    @Autowired
    SqlSession session;
    String nameSpace = "Seller.";

    @Override
    public int findTotalCount(SellerDto seller) {
        return session.selectOne(nameSpace + "findTotalCount" , seller);
    }

    @Override
    public int findSoldOut(SellerDto seller) {
        return session.selectOne(nameSpace + "findSoldOut" , seller);
    }

    @Override
    public int findEndSale(SellerDto seller) {
        return session.selectOne(nameSpace + "findEndSale" , seller);
    }

    @Override
    public int findReadyShip(SellerDto seller) {
        return session.selectOne(nameSpace + "findReadyShip" , seller);
    }

    @Override
    public int findCompletedShip(SellerDto seller) {
        return session.selectOne(nameSpace + "findCompletedShip" , seller);
    }

    @Override
    public int newOrders(String today) {
        return session.selectOne(nameSpace + "newOrders" , today);
    }

    @Override
    public int newReviews(String today) {
        return session.selectOne(nameSpace + "newReviews" , today);
    }

    @Override
    public int newQnAs(String today) {
        return session.selectOne(nameSpace + "newQnAs" , today);
    }
}
