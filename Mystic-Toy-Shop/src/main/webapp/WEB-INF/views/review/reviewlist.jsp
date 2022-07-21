<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.CreateReviewDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %>
<%@ page import="lotte.com.toy.dto.ReviewListDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<ReviewListDto> reviews = (List<ReviewListDto>)request.getAttribute("reviews");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:forEach var="review" items="${reviews}">
        <c:set var="deleted" value="${review.is_deleted}" />
        <c:if test="${deleted eq '0'}"> <!-- 삭제 체크 -->
            <h3><c:out value="${review.review_title}"/></h3>
            <p>구매자 : <c:out value="${review.user_name}"/></p>
            <p>별점 : <c:out value="${review.review_rate}"/></p>
            <p>판매자 : <c:out value="${review.review_rate}"/></p>
            <p><c:out value="${review.review_content}"/></p>
            <p><c:out value="${review.review_register_date}"/></p>
        </c:if>
    </c:forEach>

</div>
</body>
</html>