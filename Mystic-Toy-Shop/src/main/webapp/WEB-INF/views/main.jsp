<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
</head>
<body>
<div class="container my-5 py-4 minWidthContainer">
    <div class="bannerContainer">

    </div>
    <div class="btnArea flexContainerRow alignCenterContainer">
        <button class="btn btnBorder" type="button" onclick="location.href='<%= request.getContextPath()%>/productList.do'">상품 더보기</button>
    </div>
    <div class="flexContainerRow alignCenterContainer">
        <c:forEach var="productResponseDto1" items="${productResponseDtoList1}">
            <div class="productBoxOneArea">
                <div class="productImgArea flexContainerRow alignCenterContainer">
                    <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                        <img class="productImgTag" src="${productResponseDto1.product_img}" alt="">
                    </a>
                </div>
                <div>
                    <div class="mb-2">
                        <span class="deliveryInfo">택배배송</span>
                    </div>
                    <div>
                        <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                            <span>${productResponseDto1.product_name}</span>
                        </a>
                    </div>
                    <div>
                        <strong>${productResponseDto1.product_cost}</strong>원
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
    <div class="flexContainerRow alignCenterContainer">
        <c:forEach var="productResponseDto2" items="${productResponseDtoList2}">
            <div class="productBoxOneArea">
                <div class="productImgArea flexContainerRow alignCenterContainer">
                    <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                        <img class="productImgTag" src="${productResponseDto2.product_img}" alt="No Image">
                    </a>
                </div>

                <div>
                    <div class="mb-2">
                        <span class="deliveryInfo">택배배송</span>
                    </div>
                    <div>
                        <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                            <span>${productResponseDto2.product_name}</span>
                        </a>
                    </div>
                    <div>
                        <strong>${productResponseDto2.product_cost}</strong>원
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>

</div>
</body>
</html>