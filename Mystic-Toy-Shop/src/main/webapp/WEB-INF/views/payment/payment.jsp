<%@ page import="lotte.com.toy.dto.CartDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ProdcutDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-19
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<CartDto> orderCartList = (List<CartDto>)request.getAttribute("orderCartList");
    List<ProdcutDto> orderProductList = (List<ProdcutDto>) request.getAttribute("orderProductList");
    int totalPrice = 0;
    int orderCount = 0;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>주문/결제</h1>
<h2>상품 정보</h2>
<c:forEach var="product" items="${orderProductList}" varStatus="status">
    <table border="1">
        <tr>
            <img alt="" src=<c:out value="${product.product_img}"/>>
            <p><c:out value="${product.product_name}"/></p>
            <p><c:out value="${product[status.index]}"/></p>
            <p><c:out value="${product.product_cost}"/></p>
            <c:set var="price" value="${product.product_cost}" />
            <c:set var="quantity" value="${}" />
            <%
                totalPrice+=((Integer)pageContext.getAttribute("price"))*((Integer)pageContext.getAttribute("quantity"));
                orderCount++;
            %>
        </tr>
    </table>
</c:forEach>
<h2>배송 정보</h2>
<div>
    <form action="payment.do">
        받는분 : <input type="text" name="orderName"><br>
        배송지 : <input type="text" name="orderAddress"><br>
        전화번호 : <input type="text" name="orderPhone"><br>
        <h3>총 결제금액</h3>
        <table>
            <tr>
                상품금액 : <%=totalPrice%><br>
                총 <%=orderCount%> 건<br>
            </tr>
        </table>
        <input type="submit" value="주문하기">
    </form>
</div>
</body>
</html>
