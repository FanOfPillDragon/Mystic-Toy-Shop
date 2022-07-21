package lotte.com.toy.service;

import lotte.com.toy.dto.ProductResponseDto;
import lotte.com.toy.dto.QnADto;
import lotte.com.toy.dto.ReviewDto;
import lotte.com.toy.dto.SellerDto;

import java.util.List;

public interface SellerService {

    int findTotalCount(SellerDto seller);
    int findSoldOut(SellerDto seller);
    int findEndSale(SellerDto seller);
    int findReadyShip(SellerDto seller);
    int findCompletedShip(SellerDto seller);
    int newOrders(String today);
    int newReviews(String today);
    int newQnAs(String today);
    List<ReviewDto> findAllReviews(SellerDto seller);
    List<QnADto> findAllQnAs(SellerDto seller);
    List<ProductResponseDto> findAllSellerProductList(SellerDto seller);
}
