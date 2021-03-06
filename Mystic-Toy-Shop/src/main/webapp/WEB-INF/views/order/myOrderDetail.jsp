<%@ page import="lotte.com.toy.dto.OrderDetailDto" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="lotte.com.toy.util.DateUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<%
    OrderDetailDto order = (OrderDetailDto) request.getAttribute("order");
    int totalCount = (Integer) request.getAttribute("totalcount");
%>
<html>
<head>
    <title>mypage</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage.css"
          rel="stylesheet">
    <style>
        .detailDateWrapper {
            padding: 30px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .detailDateWrapper div {
            font-weight: bold;
            font-size: 18px;
        }

        .detailDateWrapper button {
            background-color: transparent;
            color: #b9b9b9;
            font-size: 16px;
            border: solid 1px #b9b9b9;
            border-radius: 5px;
            font-family: noto sans;
        }

        .detailContentWrapper {
            padding: 20px;
        }

        .detailContent {
            border: solid 1px #b9b9b9;
            border-radius: 5px;
        }

        .detailContent .contentTitle {
            height: 50px;
            border-bottom: solid 1px #b9b9b9;
            display: flex;
            align-items: center;
        }

        .detailContent .content {

            border-bottom: solid 1px #b9b9b9;
        }

        .detailContent .contentBottom {
            height: 50px;

        }

        .companyName {
            padding-left: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        .postText {
            color: #3A4CA8;
            margin-left: 10px;
            padding: 0 5px;
            border: solid 1px #3A4CA8;
            border-radius: 5px;
            font-size: 13px;
        }

        .detailOrderWrapper {
            margin-top: 30px;
            height: 200px;
        }

        .content {
            padding: 40px 20px;
            display: flex;
        }

        .contentLeft {
            width: 70%;
            display: flex;
            align-items: center;
        }

        .contentLeft img {
            border-radius: 5px;
            width: 85px;
            height: 100px;
            object-fit: cover;
        }

        .productDetail {
            padding-left: 20px;
        }

        .contentRight {
            width: 30%;
            height: 100px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border-left: solid 1px #b9b9b9;
        }

        .contentRight p:first-child {
            font: 20px bold;
            color: #1352a2;
        }

        .contentRight p {
            margin: 0;
        }

        .contentBottom {
            background-color: #1352a2;
        }

        .detailOrderWrapper {
            margin-bottom: 50px;
        }

        .detailOrderWrapper h3 {
            padding-bottom: 20px;
            margin-bottom: 0;
            border-bottom: solid 1px #b9b9b9;
        }

        .detailOrderWrapper table {
            margin-top: 20px;
        }

        tr {
            height: 40px;
        }

    </style>
    <script src="https://kit.fontawesome.com/079869d0a6.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">

    <div class="contentWrap">
        <div class="membershipUserWrap">
            <div class="memberInner">
                <div class="profileWrap">
                    <button>
                        <i class="fa-solid fa-user"></i>
                    </button>
                    <div class="nicknameWrap">
                        <p class="infoWord">???????????? ?????? ????????????!</p>
                        <div class="nickName">${sessionScope.userLogin.user_name}???!</div>
                    </div>
                </div>
                <div class="membershipList">
                    <ul>
                        <li>
                            <div>?????? ????????????</div>
                            <div class="contain">
                                <a>
                                    <strong><%=totalCount%></strong>
                                    <span>???</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                    <div class="benefit">
                        <div><strong>?????? ?????? ?????? -</strong> ?????? 5%</div>
                        <div><strong>?????? ?????? ?????? -</strong> 20,000??? ?????? ????????????</div>
                    </div>
                </div>

            </div>
            <div class="memberInfoBanner">
                <img src="<%=request.getContextPath() %>/resources/images/myBanner.png" alt="">
            </div>
        </div>
        <div class="myLotteWrap">
            <div class="scrollArea">
                <ul>
                    <li>
                        <div style="color: black">?????? ??????</div>
                    </li>
                </ul>
            </div>

            <div class="bottomData">
                <div class="detailDateWrapper">
                    <c:set var="date" value="${order.getOrder_date()}"/>
                    <%
                        Timestamp date = (Timestamp) pageContext.getAttribute("date");
                        String register_date = DateUtil.toYYYYMMDD(date);
                        pageContext.setAttribute("register_date", register_date);
                    %>
                    <div>${register_date}
                    </div>
                    <button type="button" onclick="history.back()">?????? ??????</button>
                </div>
                <div class="detailContentWrapper">
                    <div class="detailContent">
                        <div class="contentTitle">
                            <div class="companyName">
                                <%=order.getSeller_company_name()%>
                            </div>
                            <div class="postText">
                                ????????????
                            </div>

                        </div>
                        <div class="content">
                            <div class="contentLeft">
                                <img alt="" src="<%=order.getProduct_img() %>">
                                <div class="productDetail">
                                    <div>
                                        <div><strong><%=order.getSeller_company_name()%>
                                        </strong>
                                        </div>
                                        <div><%=order.getProduct_name()%>
                                        </div>
                                        <div>
                                            <strong><%=order.getOrder_total_price()%>
                                            </strong>???&nbsp; ?????? <%=order.getOrder_quantity()%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="contentRight">
                                <p id="shipStatus"></p>
                                <p id="shipStatusText"></p>
                            </div>
                        </div>
                        <div class="contentBottom"></div>
                    </div>
                </div>
                <div class="detailOrderWrapper">
                    <h3>????????????</h3>
                    <table>
                        <colgroup>
                            <col width="40%">
                            <col width="60%">
                        </colgroup>
                        <tr>
                            <td>
                                ?????????
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;
                                <%=order.getUser_name()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ???????????????
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;
                                <%=order.getOrder_phone()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ?????????
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;
                                <%=order.getOrder_address()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ???????????????
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;
                                <%=order.getOrder_comment()%>
                            </td>
                        </tr>
                    </table>
                </div>

                <script type="text/javascript">
                    (function (ship) {
                        if (ship == 0) {
                            $("#shipStatus").text("?????????");
                            $("#shipStatusText").text("????????? ??????????????????!");
                        } else {
                            $("#shipStatus").text("????????????");
                            $("#shipStatusText").text("????????? ?????????????????????!");
                        }
                    }(<%=order.getShip_status()%>));
                </script>


            </div>
        </div>
    </div>
</div>
</body>
</html>
