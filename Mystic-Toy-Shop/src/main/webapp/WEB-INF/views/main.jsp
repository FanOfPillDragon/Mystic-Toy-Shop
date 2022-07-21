<%@ page import="lotte.com.toy.dto.SellerDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container mt-5">
    <div>
        <c:forEach var="productResponseDto" items="${mainList}">
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
