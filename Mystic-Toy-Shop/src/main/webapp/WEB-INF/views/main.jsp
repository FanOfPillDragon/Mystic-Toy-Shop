<%@ page import="lotte.com.toy.dto.SellerDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Hello World!</h2>

${sellerLogin.auth_id}
<a href="/product_write.do">판매 상품 등록</a>
<a href="orderlist.do">order</a>
<a href="ordersheet.do">주문하기</a>
<a href="orderbyproduct.do?productId=1&quantity=1">단건주문</a>
<a href="/seller_main.do?seller_id=1">판매자 메인 페이지</a>
<a href="/seller_main.do?seller_id=1">판매 상품 등록</a>
<a href="/review.do?productId=1">리뷰등록</a>
<a href="findReviewList.do?productId=1">리뷰리스트</a>
</body>
</html>
