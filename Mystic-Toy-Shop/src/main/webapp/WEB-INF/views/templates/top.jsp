<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ page isELIgnored="false" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>Mystic-Toy-Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="shortcut icon" href='/favicon.ico' type="image/x-icon">
    <link rel="icon" href='/favicon.ico' type="image/x-icon">
    <style type="text/css">
        :root {
            --actual-width: 1440px;
        }

        .headerWideArea {
            position: relative;
            margin-right: calc((var(--actual-width) - 100%) * -0.5);
            margin-left: calc((var(--actual-width) - 100%) * -0.5);
            color: #1352a2;
            margin: 0 auto;
        }

        .headerWrapper {
            margin: 0;
            padding: 0;
            border: 0;
            font: 100% inherit;
            vertical-align: baseline;
            widows: 1;
        }

        .headerFlexContainer {
            display: flex;
            flex-direction: column;
        }

        .headerFlexContainerCol {
            display: flex !important;
            justify-content: flex-end !important;
        }


        .headerInnerContent {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: end;
            -ms-flex-pack: end;
            justify-content: flex-end;
            position: relative;
            width: 100%;
            height: 34px;
            text-align: left;
        }

        .innerContent {
            max-width: 1140px;
            margin-right: auto;
            margin-left: auto;

        }

        .headerMainContent {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            width: 100%;
            text-align: left;
            align-items: center;
            padding: 15px 0 16px;
            height: 91px;
        }

        .headerLogoArea {
            line-height: 48px;
        }

        .searchAreaWrap {
            margin-left: 0;
            width: 670px;
            display: flex;
            justify-content: center;
        }

        .searchArea {
            width: 450px;
            height: 48px;
            padding: 8px 43px 8px 20px;
            border-radius: 25px;
            border-style: solid;
            border-width: 2px;
            border-color: inherit;
            position: relative;
        }

        .headerSearchId {

        }

        .searchBlind {
            overflow: hidden;
            display: inline-block;
            border: 0;
            margin: 0;
            width: 1px;
            height: 1px;
            clip: rect(1px, 1px, 1px, 1px);
            clip-path: inset(50%);
            position: absolute;
            top: 0 !important;
            left: 0 !important;
        }

        .searchArea input {
            padding: 0 28px 0 0;
            height: 28px;
            font-size: 16px;
            line-height: 28px;
            letter-spacing: -.3px;
            color: #333;
            background-color: transparent;
            border: none;
            border-radius: 0;
            background-image: none;
            overflow: hidden;
            width: 100%;
        }

        .btnSearchInner {
            top: 10px;
            right: 17px;
            opacity: 1;
            width: 28px;
            height: 28px;
            overflow: hidden;
            color: transparent;
            background: url(/resources/images/icon_search_mask.png) no-repeat 50% #1352a2;
            border: 1px solid #ffffff;
            background-size: 27px auto;
            position: absolute;
            padding: 0;

        }

        .buttonArea {
            width: 300px;
            margin: 7px -12px 0 0;
            font-size: 0;
            text-align: right;
        }

        .buttonArea ul {
            list-style: none;
            margin-bottom: 0;
        }

        .buttonArea li {
            position: relative;
            display: inline-block;
            width: 74px;
            font-size: 13px;
            line-height: 1.46;
            letter-spacing: -.3px;
            text-align: center;
            color: #333;
            vertical-align: top;
        }

        .buttonArea li a {
            display: block;
            width: 100%;
            padding-top: 37px;
            background-repeat: no-repeat;
            background-size: 36px 36px;
            background-position: center -1px;
            text-decoration: none;
            color: #333;
        }

        .logoArea {
            display: inline-block;
            width: auto;
            height: 60px;
            margin-right: 10px;
        }

        .nav-link {
            color: #000000;
            opacity: .55;
        }

        .nav-link:hover {
            color: #000000;
        }

        .cartBtn {
            background-image: url(/resources/images/icon_cart_black.svg);
        }

        .myPageBtn {
            background-image: url(/resources/images/icon_my_black.svg);
        }
    </style>
</head>
<body>
<!-- 상단 메뉴 -->
<!-- nav 상단 고정-->
<header class="headerWideArea">
    <div class="headerWrapper">
        <div class="headerInnerContent innerContent">
            <c:choose>
                <c:when test="${not empty sessionScope.userLogin}">
                    <a class="nav-link" href="<%=request.getContextPath()%>/mypage.do">${sessionScope.userLogin.user_name}님</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
                </c:when>
                <c:when test="${not empty sessionScope.sellerLogin}">
                    <a class="nav-link" href="<%=request.getContextPath()%>/mypage.do">${sessionScope.sellerLogin.seller_name}님</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link" href="<%=request.getContextPath()%>/login.do">로그인</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/signup.do">회원가입</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="headerMainContent innerContent">
            <div class="headerLogoArea"><a class="" href="<%=request.getContextPath()%>/main.do"><img class="logoArea" src="resources/images/logo6_trans.png" alt=""></a></div>
            <div class="searchAreaWrap">
                <div class="searchArea">
                    <label for="headerSearchId" class="searchBlind">검색어</label>
                    <input type="search" id="headerSearchId" placeholder="검색어를 입력하세요" autocomplete="off">
                    <button type="button" class="btnSearchInner" onclick="search()"><span class="searchBlind">검색</span></button>
                </div>
            </div>
            <div class="buttonArea">
                <ul>
                    <c:choose>
                        <c:when test="${not empty sessionScope.userLogin}">
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/orderlist.do">마이페이지</a></li>
                        </c:when>
                        <c:when test="${not empty sessionScope.sellerLogin}">
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/orderstats.do">판매자 센터</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/login.do">마이페이지</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a class="cartBtn" href="<%=request.getContextPath()%>/cart.do">장바구니</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
    function search(){
        location.href = 'searchResult.do?productName='+$('#headerSearchId').val();
    }
</script>
</body>
</html>