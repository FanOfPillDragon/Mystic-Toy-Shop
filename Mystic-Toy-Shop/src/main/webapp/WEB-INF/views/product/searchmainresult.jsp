<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ProductResponseDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-21
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    List<ProductResponseDto> searchResultList = (List<ProductResponseDto>)request.getAttribute("searchResultList");
    String productName = (String)request.getAttribute("productName");
    int resultSize = searchResultList.size();
%>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">

    .srchTitleArea {
        position: relative;
        text-align: center;
        margin-bottom: 30px;
        margin-top: 14px;
    }
    .srchResultNull {
        border-bottom: 1px solid #eee;
        margin-top: 80px;
        padding-bottom: 80px;
        text-align: center;
        margin-left: 15px;
        margin-right: 15px;
    }
    .srchResultNull {
        padding-top: 70px;
        background: url("https://static.lotteon.com/p/search/assets/img/search/icon_no_result.svg") no-repeat center 0/60px 60px;
    }
    .categoryGrid[data-v-9506d5f4] {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
    }
    ol, ul {
        list-style: none;
    }
    body, html {
        line-height: 1;
        font-family: NotoSansKR,Malgun Gothic,arial,sans-serif;
        height: 100%;
        position: relative;
        letter-spacing: -.02em;
    }
    a, button, html, input, select, textarea {
        font-family: NotoSansKR,Malgun Gothic,arial,sans-serif;
        color: #333;
        padding: 0;
    }
    html {
        font-size: 100%;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
    }
    li {
        display: list-item;
        text-align: -webkit-match-parent;
    }
    img{
        width: 262px;
        height: 262px;
    }
    .productList .item4 .list-wrap>ul[data-v-7f5dc61d]{
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        margin: 0 -15px;
        flex-wrap: wrap;
    }
    a {
        text-decoration: none;
        color: #333;
    }
    .categoryGrid li[data-v-9506d5f4], [data-v-9506d5f4] .swiper-wrapper .swiper-slide{
        position: relative;
        -ms-flex-positive: 1;
        flex-grow: 1;
        width: 20%;
        padding: 10px;
        margin: -1px 0 0 -1px;
        text-align: center;

        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        border: 1px solid #ddd;
    }
    .categoryGrid li .categoryItem[data-v-9506d5f4]{
        display: block;
        padding: 14px 10px 13px;
        font-size: 14px;
        line-height: 1.5;
        letter-spacing: -.3px;
        cursor: pointer;
    }
    * {
        box-sizing: border-box;
    }
    ul {
        display: block;
        list-style-type: disc;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }
    div {
        display: block;
    }
    .productList .item .info[data-v-7f5dc61d] .flag{
        width: auto!important;
        display: inline-block;
        font-size: 11px;
        border: 1px solid #f04b45;
        line-height: 15px;
        vertical-align: top;
        padding: 0 4px;
        margin: 0 4px 5px 0;
        border-radius: 2px;
    }
    .productList .item .info .title[data-v-7f5dc61d]{
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        word-wrap: break-word;
        white-space: normal;
        widows: 2;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 14px;
        line-height: 21px;
    }
</style>
<body>
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
<section class="srchTitleArea">
    <h2 class="titMiddle">
        <strong>"<%=productName%>"</strong>
        <span>에 대한 검색결과</span>
    </h2>
</section>
<div class="container mt-5">
    <div>
        <c:set var="searchResultList" value="${searchResultList}"/>
        <c:choose>
            <c:when test="${empty searchResultList}">
                <section class="srchResultNull srchNullCharacter1 toysrus">
                    <p>
                        <em><%=productName%></em>
                        "의 검색결과가 없습니다."
                        <br>
                        "다른 검색어를 입력해 주세요."
                    </p>
                </section>
            </c:when>
            <c:otherwise>
                <div data-v-9506d5f4 class="productListContainer">
                    <div data-v-9506d5f4 class="productListDataWrap">
                        <div data-v-7f5dc61d data-v-9506d5f4 class="productList toysrus">
                            <div data-v-7f5dc61d class="scroll-wrap dataItem item4">
                                <div data-v-7f5dc61d class="list-wrap">
                                    <ul data-v-7f5dc61d>
                                        <c:forEach var="productResponseDto" items="${searchResultList}">
                                            <li data-v-7f5dc61d class="isCartBottom" data-ga="gtm">
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
                                            </li>

                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
