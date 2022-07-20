<%@ page import="lotte.com.toy.dto.CartProductDto" %>
<%@ page import="lotte.com.toy.dto.ProductDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    ProductDto product = (ProductDto)request.getAttribute("productDto");
    int productId = (Integer)request.getAttribute("productId");
    int quantity = (Integer) request.getAttribute("quantity");
    int totalPrice = 0;
    int orderCount = 1;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>주문/결제</h1>
<h2>상품 정보</h2>
<div class="container">
    <table border="1">
        <tr>
            <img alt="" src=<%=product.getProduct_img()%>>
            <p><%=product.getProduct_name()%></p>
            <p><%=quantity%></p>
            <p><%=product.getProduct_cost()%></p>
            <%
                totalPrice+=(product.getProduct_cost())*(quantity);
            %>
        </tr>
    </table>
</div>
<h2>배송 정보</h2>
<div>
    <form name="frm" action="singlepayment.do" method="post" onsubmit="return checkForm()">
        받는분 : <input type="text" name="orderName" id="orderName"><br>
        배송지 : <input type="text" name="orderAddress" id = "orderAddress"><br>
        전화번호 : <input type="text" name="orderPhone" id = "orderPhone"><br>
        배송 요청사항 : <input type="text" name="orderComment" id = "orderComment"><br>
        <input type="hidden" name="productId" value=<%=productId%>>
        <input type="hidden" name="quantity" value=<%=quantity%>>
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
