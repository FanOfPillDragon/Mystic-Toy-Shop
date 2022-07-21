<%@ page import="lotte.com.toy.dto.ProductResponseDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="lotte.com.toy.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-21
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ProductResponseDto> list = (List<ProductResponseDto>)request.getAttribute("mysalelist");

    /*
                p.product_id,
               product_name,
               product_img,
               product_cost,
               product_stock,
               product_sell_count,
               c.category_id,
               category_name
     */
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .mini{
            width: 50px;
            height: 70px;
            margin-right: 10px;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div>
        <strong>상품목록조회</strong>
        <hr>
        <table border="1">
            <tr>
                <col width="600"><col width="150"><col width="100"><col width="100"><col width="100">
                <th>상품명</th><th>카테고리</th><th>가격</th><th>현재 재고</th><th>판매량</th>
            </tr>
        <c:forEach var="productResponseDto" items="${mysalelist}">
                    <tr>
                        <td><img class="mini" src="${productResponseDto.product_img}"><a href="/productUpdate.do?productId=${productResponseDto.product_id}">${productResponseDto.product_name}</a></td>
                        <td>${productResponseDto.category_name}</td>
                        <td>${productResponseDto.product_cost}</td>
                        <td>${productResponseDto.product_stock}</td>
                        <td>${productResponseDto.product_sell_count}</td>
                    </tr>
        </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
