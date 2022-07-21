<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
    <%--<link  href="/resources/css/sb-admin-2.css" rel="stylesheet">--%>
    <style>
        ol, ul {
            list-style: none;
        }
        ul {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            /*padding-inline-start: 10px;*/
            list-style: none;
        }

        li {
            /*//text-align: -webkit-match-parent;*/
            list-style: none;
        }
        .pageTitle {
            font-size: 20px;
            line-height: 1.39;
            letter-spacing: -1.1px;
            margin-bottom: 0;
            padding: 10px 0 20px;
            text-align: center;
        }
        .lnbTitle {
            font-size: 17px;
            line-height: 25px;
            letter-spacing: -.04em;
            color: #333;
            font-weight: 700;
        }
        .borderLine {
            border-top: 1px solid #eee;
            padding-top: 14px;
            padding-bottom: 14px;
            list-style: none;
        }
        li > a {
            font-size: 14px;
        }
    </style>
    <meta charset="UTF-8">
    <title>사이드 메뉴</title>
</head>
<body>
<div class="lnbWrap">
    <h2 class="pageTitle">판매자센터</h2>

    <ul>
        <li class="borderLine">
            <div class="lnbTitle">상품관리</div>
            <ul>
                <li><a href="<%=request.getContextPath()%>/product_write.do">상품 등록</a></li>
                <li><a href="#"  class="no-underline">상품 목록 조회</a></li>
            </ul>
        </li>
        <li class="borderLine">
            <div>
                <div class="lnbTitle">주문관리</div>
                <ul>
                    <li><a href="#"  class="no-underline">주문 목록 조회</a></li>
                    <li><a href="#"  class="no-underline">배송 관리</a></li>
                </ul>
            </div>
        </li>
        <li class="borderLine">
            <div>
                <div class="lnbTitle">통계</div>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/orderstats.do"> 판매 분석 </a></li>
                    <li><a href="<%=request.getContextPath()%>/userstats.do"> 고객 현황 </a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>

<%--
<h1>
    <a href="${contextPath}/member/listMembers.do"  class="no-underline">회원관리</a><br>
    <a href="${contextPath}/board/listArticles.do"  class="no-underline">게시판관리</a><br>
    <a href="#"  class="no-underline">상품관리</a><br>
</h1>
 --%>
</body>
</html>
