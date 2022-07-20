<%@ page import="lotte.com.toy.dto.OrderDetailDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    int totalPrice = 0;
%>
<%
    OrderDetailDto order = (OrderDetailDto) request.getAttribute("order");
%>
<html>
<head>
    <title>mypage</title>
    <link href="<%=request.getContextPath()%>/css/mypage.css"
          rel="stylesheet">
    <style>
        img {
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="contentWrap">
        <div class="membershipUserWrap">
            <div class="memberInner">
                <div class="profileWrap">
                    <button></button>
                    <div class="nicknameWrap">
                        <p class="infoWord">쇼핑하기 좋은 날이에요!</p>
                        <div class="nickName">손은성님!</div>
                    </div>
                </div>
                <div class="membershipList">
                    <ul>
                        <li>
                            <div>나의 주문내역</div>
                            <div class="contain">
                                <a>
                                    <strong>0</strong>
                                    <span>개</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                    <div class="benefit">
                        <div><strong>첫 구매 우대 -</strong> 적립 5%</div>
                        <div><strong>첫 구매 우대 -</strong> 20,000원 이상 무료배송</div>
                    </div>
                </div>

            </div>
            <div class="memberInfoBanner">
                <img src="<%=request.getContextPath() %>/images/myBanner.png" alt="">
            </div>
        </div>
        <div class="myLotteWrap">
            <div class="scrollArea">
                <ul>
                    <li>
                        <button type="button" style="color: black">주문 내역</button>
                    </li>
                    <li>
                        <button type="button">나의 리뷰</button>
                    </li>
                </ul>
            </div>

            <div class="bottomData">
                <h2>주문 상세</h2>
                <table>
                    <tr>
                        <h3><%=order.getProduct_name()%></h3>
                    </tr>
                    <tr>
                        <td>
                            <img alt="" src="<%=order.getProduct_img() %>">
                        </td>
                        <td rowspan="2">회사명</td>
                        <p id="shipStatus"></p>
                        <script type="text/javascript">
                            (function(ship) {
                                if(ship==0){
                                    $("#shipStatus").text("구매 미확정");
                                }
                                else{
                                    $("#shipStatus").text("구매 확정");
                                }
                            }(<%=order.getShip_status()%>));
                        </script>
                    </tr>
                    <tr>
                        <td></td>
                        <td><%=order.getOrder_total_price()%></td>
                    </tr>
                </table>
                <h2>배송정보</h2>
                <table>
                    <tr>
                        받는분&nbsp;&nbsp;&nbsp;<%=order.getUser_name()%>
                    </tr>
                    <tr>
                        휴대폰번호&nbsp;&nbsp;&nbsp;<%=order.getOrder_phone()%>
                    </tr>
                    <tr>
                        배송지&nbsp;&nbsp;&nbsp;<%=order.getOrder_address()%>
                    </tr>
                    <tr>
                        배송메시지&nbsp;&nbsp;&nbsp;<%=order.getOrder_comment()%>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
