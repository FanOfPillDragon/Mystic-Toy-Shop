<%@ page import="lotte.com.toy.dto.SellerDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/productList.css">
</head>
<body>
<div class="container">
    <div data-v-9506d5f4 class="categoryGridWrap">
        <ul data-v-9506d5f4 class="categoryGrid">
            <li data-v-9506d5f4 class="active">
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=1" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">전자게임</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=2" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">신생아/유아</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=3" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">역할놀이/인형/꾸미기</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=4" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">액션/조종/자동차</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=5" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">교육완구</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=6" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">연령별</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=7" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">TRU단독존</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=8" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">프라모델/피규어/BB탄</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=9" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">건전지</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=10" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">스낵</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=11" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">스포츠/야외완구</span>
                </a>
            </li>
            <li data-v-9506d5f4 class>
                <a data-v-9506d5f4 href="categoryResult.do?categoryId=12" class="categoryItem noMax">
                    <span data-v-9506d5f4 class="text maxtest">시즌/파티완구</span>
                </a>
            </li>
        </ul>

    </div>
    <div class="container mt-5">
        <div>
            <div data-v-9506d5f4 class="productListContainer">
                <div data-v-9506d5f4 class="productListDataWrap">
                    <div data-v-7f5dc61d data-v-9506d5f4 class="productList toysrus">
                        <div data-v-7f5dc61d class="scroll-wrap dataItem item4">
                            <div data-v-7f5dc61d class="list-wrap">
                                <ul data-v-7f5dc61d>
                                    <c:forEach var="productResponseDto" items="${productResponseDtoList}">
                                        <div data-v-7f5dc61d class="item">
                                            <div data-v-7f5dc61d class="thumb">
                                                <a data-v-7f5dc61d href="/productDetail.do?productId=${productResponseDto.product_id}" aria-hidden="true" tabindex="-1" class="block">
                                                    <img data-v-7f5dc61d alt lazy="loaded" class="lazyImg lazy" data-origin src="${productResponseDto.product_img}">
                                                </a>
                                            </div>
                                            <a data-v-7f5dc61d href="/productDetail.do?productId=${productResponseDto.product_id}" class="block">
                                                <div data-v-7f5dc61d class="info flag">
                                                    <ul data-v-7f5dc61d class="flagArea">
                                                        <li class="flag" style="border-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">
                                                            택배배송
                                                        </li>
                                                    </ul>
                                                    <div data-v-7f5dc61d class="title block-with-text">
                                                        <strong><c:out value="${productResponseDto.product_name}"/></strong>
                                                    </div>
                                                    <div data-v-7f5dc61d class="price">
                                                        <strong><c:out value="${productResponseDto.product_cost}"/></strong>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>

                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>