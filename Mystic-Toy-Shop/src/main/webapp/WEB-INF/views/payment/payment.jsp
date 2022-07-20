<%@ page import="lotte.com.toy.dto.CartDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ProductDto" %>
<%@ page import="lotte.com.toy.dto.CartProductDto" %><%--
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
    List<CartProductDto> cartProductList = (List<CartProductDto>)request.getAttribute("orderCartList");
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
<c:forEach var="product" items="${cartProductList}" varStatus="status">
    <table border="1">
        <tr>
            <img alt="" src=<c:out value="${product.productImg}"/>>
            <p><c:out value="${product.productName}"/></p>
            <p><c:out value="${product.productQuantity}"/></p>
            <p><c:out value="${product.productCost}"/></p>
            <c:set var="price" value="${product.productCost}" />
            <c:set var="quantity" value="${product.productQuantity}" />
            <%
                totalPrice+=((Integer)pageContext.getAttribute("price"))*((Integer)pageContext.getAttribute("quantity"));
                orderCount++;
            %>
        </tr>
    </table>
</c:forEach>
<h2>배송 정보</h2>
<div>
    <form name="frm" action="payment.do" method="post" onsubmit="return checkForm()">
        받는분 : <input type="text" name="orderName" id="orderName"><br>
        배송지 : <input type="text" name="orderAddress" id = "orderAddress"><br>
        전화번호 : <input type="text" name="orderPhone" id = "orderPhone"><br>
        배송 요청사항 : <input type="text" name="orderComment" id = "orderComment"><br>
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
<script type="text/javascript">
    function checkForm(){
        if(frm.orderName.value==""||frm.orderAddress.value==""||frm.orderPhone.value==""||frm.orderComment.value==""){
            alert("입력해");
            return false;
        }
    }
</script>
</body>
</html>