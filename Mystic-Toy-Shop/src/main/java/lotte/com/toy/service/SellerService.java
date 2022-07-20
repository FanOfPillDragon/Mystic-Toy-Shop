package lotte.com.toy.service;

import lotte.com.toy.dto.SellerDto;

public interface SellerService {

    int findTotalCount(SellerDto seller);
    int findSoldOut(SellerDto seller);
    int findEndSale(SellerDto seller);
    int findReadyShip(SellerDto seller);
    int findCompletedShip(SellerDto seller);
    int newOrders(String today);
    int newReviews(String today);
    int newQnAs(String today);
}
