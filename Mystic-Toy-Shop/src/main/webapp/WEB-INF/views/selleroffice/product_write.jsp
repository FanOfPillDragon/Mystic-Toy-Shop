<%@ page import="lotte.com.toy.dto.CategoryDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-18
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%--products(product_name,product_info,product_img,product_cost,product_stock,product_sell_count,category_id,seller_id) --%>

<%
    List<CategoryDto> categories = (List<CategoryDto>)request.getAttribute("categories");
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>

    <style type="text/css">
        .temp{
            width: 900px;
            border: solid 1px;
            padding: 5px;

        }

        .box{
            border-bottom: solid 1px;
            margin-top: 10px;
        }


    </style>
</head>
<body>


<form action="writeAf.do" method="post">
    <div class="temp">
    <h2 style="text-align: center">판매 상품 등록</h2>
        <div class="box">
            <h3>카테고리</h3>
            <% for(CategoryDto dto : categories) {%>
                <p><%= dto.getCategory_name()%></p>
            <% } %>
        </div>

        <div class="box">
            <h3>상품명</h3>
            <div style="float: left">
                <p class="">* 상품명
            </div>
            <input type="text" name = "product_name" size="30" placeholder="상품명">
        </div>

        <div class="box">
            <h3>판매가</h3>
            <div style="float: left">
                * 판매가
            </div>
            <input type="text" name = "product_cost" size="20" placeholder="가격"><span>원</span>
        </div>









   </div>
</form>

</body>
</html>
