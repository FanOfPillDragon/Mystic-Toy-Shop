<%@ page import="lotte.com.toy.dto.ProductResponseDto" %>
<%@ page import="java.util.List" %><%--
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

    System.out.println(list.get(0).getProduct_name());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container mt-5">
    <div>
        <c:forEach var="productResponseDto" items="${mysalelist}">
            <div>
                <div>
                    <a href="/productDetail.do?productId=${productResponseDto.product_id}">${productResponseDto.product_name}</a>
                </div>
                <div>
                        ${productResponseDto.category_name}
                </div>
                <div>
                        ${productResponseDto.product_info}
                </div>
                <div>
                        ${productResponseDto.product_cost}
                </div>
            </div>

            <div>

                <div>
                        ${productResponseDto.seller_email}
                </div>
                <div>
                        ${productResponseDto.seller_company_name}
                </div>
                <div>
                        ${productResponseDto.seller_company_number}
                </div>
                <div>
                        ${productResponseDto.seller_address}
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
