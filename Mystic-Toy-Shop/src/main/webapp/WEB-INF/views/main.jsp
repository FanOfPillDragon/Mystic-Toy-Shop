<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
</head>
<body>
<div class="container my-5 py-4">
    <div class="flexContainerCol">
        <c:forEach var="productResponseDto1" items="${productResponseDtoList1}">
            <div>
                <div>
                    <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                        <img class="productImgTag" src="${productResponseDto1.product_img}" alt="">
                    </a>
                </div>
                <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                    <div>
                        <div>
                            <div>
                                택배배송
                            </div>
                        </div>
                        <div>
                            <strong>${productResponseDto1.product_name}</strong>
                        </div>
                        <div>
                            <strong>${productResponseDto1.product_cost}"</strong>
                        </div>
                    </div>
                </a>
            </div>

        </c:forEach>
    </div>
    <div class="flexContainerCol">
        <c:forEach var="productResponseDto2" items="${productResponseDtoList2}">
            <div>
                <div>
                    <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                        <img class="productImgTag" src="${productResponseDto2.product_img}" alt="">
                    </a>
                </div>
                <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                    <div>
                        <div>
                            <div>
                                택배배송
                            </div>
                        </div>
                        <div>
                            <strong>${productResponseDto2.product_name}</strong>
                        </div>
                        <div>
                            <strong>${productResponseDto2.product_cost}"</strong>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>


    </div>
</body>
</html>