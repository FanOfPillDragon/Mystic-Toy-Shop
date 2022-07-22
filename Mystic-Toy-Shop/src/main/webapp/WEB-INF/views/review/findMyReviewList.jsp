<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ReviewListDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-22
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<ReviewListDto> myReviews = (List<ReviewListDto>)request.getAttribute("myReviews");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>나의리뷰정보</h1>
<div>

    <c:choose>
        <c:when test="${empty myReviews}">
            <strong>리뷰가 없어요!</strong>
        </c:when>
        <c:otherwise>
            <c:forEach var="review" items="${myReviews}">
                <h3><c:out value="${review.review_title}"/></h3>
                <img alt="" src=<c:out value="${review.product_img}"/>>
                <p>구매자 : <c:out value="${review.user_name}"/></p>
                <p>별점 : <c:out value="${review.review_rate}"/></p>
                <p>구매물품 : <c:out value="${review.product_name}"/></p>
                <p><c:out value="${review.review_content}"/></p>
                <p><c:out value="${review.review_register_date}"/></p>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
