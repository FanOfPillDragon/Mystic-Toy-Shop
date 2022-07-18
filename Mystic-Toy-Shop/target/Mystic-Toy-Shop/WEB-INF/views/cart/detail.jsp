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
<c:forEach var="dto" items="${cartList}">
    <div><c:out value="${dto.cart_id}"/></div>
    <div>${dto.cart_quantity}</div>
    <div>${dto.user_id}</div>
    <div>${dto.product_id}</div>
</c:forEach>
</body>
</html>
