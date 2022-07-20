package lotte.com.toy.dao;

import lotte.com.toy.dto.SellerDto;
import org.apache.ibatis.annotations.Param;

public interface SellerDao {

    int findTotalCount(SellerDto seller);
    int findSoldOut(SellerDto seller);
    int findEndSale(SellerDto seller);
    int findReadyShip(SellerDto seller);
    int findCompletedShip(SellerDto seller);
    int newOrders(String today);
    int newReviews(String today);
    int newQnAs(String today);
}
