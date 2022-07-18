<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="lotte.com.toy.dto.CartDto" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%
//    List<CartDto> cartList = (List<CartDto>)request.getAttribute("cartList");
//    pageContext.setAttribute("cartList",cartList);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
<c:forEach var="dto" items="${cartList}">
    <div><c:out value="${dto.cart_id}"/></div>
    <div>${dto.cart_quantity}</div>
    <div>${dto.user_id}</div>
    <div>${dto.product_id}</div>
</c:forEach>
</div>
<div>
<c:forEach var="cupDto" items="${cartUserProductDtoList}">
    <div><c:out value="${cupDto.cart_id}"/></div>
    <div>${cupDto.cart_quantity}</div>
    <div>${cupDto.user_email}</div>
    <div>${cupDto.product_name}</div>
    <div>${cupDto.product_cost}</div>
</c:forEach>
</div>
</body>
</html>
