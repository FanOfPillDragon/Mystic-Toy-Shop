<%@ page import="org.json.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-19
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JSONObject jsonObject = (JSONObject) request.getAttribute("seller_data");
    int onSaleProduct = jsonObject.getInt("onSaleProduct"); // 판매중
    int soldOutProduct = jsonObject.getInt("soldOutProduct"); // 품절
    int endSaleProduct = jsonObject.getInt("endSaleProduct"); // 판매종료
    int readyToShip = jsonObject.getInt("readyToShip"); // 배송준비
    int completedShip = jsonObject.getInt("completedShip"); // 배송완료
    int newOrder = jsonObject.getInt("newOrder"); // 신규주문
    int newReview = jsonObject.getInt("newReview"); // 신규리뷰
    int newQnA = jsonObject.getInt("newQnA"); // 신규 QnA
%>


<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .top-info {
            width: 980px;
            height: 300px;
            padding: 10px;
            border: 1px solid;
        }

        .top1 {
            width: 32%;
            height: 290px;
            border-right: solid 1px;
            float: left;
        }

        .top2 {
            width: 32%;
            height: 290px;
            border-right: solid 1px;
            float: left;
        }

        .top3 {
            width: 32%;
            height: 240px;
            float: left;
        }

        .card-wrap {
            display: flex;
        }

        .card1 {
            background-color: #eeeeee;
            width: 45%;
            height: 100px;
            border: solid 1px;
            border-radius: 2em;
            margin: 5px;
        }

    </style>
</head>
<body style="text-align: center">

<h3>운영현황</h3>
<div style="text-align: center">
    <div class="top-info">

        <div class="top1">
            <p style="text-align: left">판매현황</p>
            <div class="card-wrap">
                <div class="card1">
                    <span>판매중</span>
                    <br>
                    <span><%=onSaleProduct%></span>
                </div>
                <div class="card1">
                    <span>품절된 상품</span>
                    <br>
                    <span><%=soldOutProduct%></span>
                </div>
            </div>
            <div class="card1">
                <span>판매종료</span>
                <br>
                <span><%=endSaleProduct%></span>
            </div>
        </div>
        <div class="top2">
            <p style="text-align: left">배송현황</p>
            <div class="card-wrap">
                <div class="card1">
                    <span>배송준비</span>
                    <br>
                    <span><%=readyToShip%></span>
                </div>
                <div class="card1">
                    <span>배송완료</span>
                    <br>
                    <span><%=completedShip%></span>
                </div>
            </div>
            <div class="card1">
                <span>반품요청</span>
                <br>
                <span>0</span>
            </div>
        </div>
        <div class="top3">
            <p style="text-align: left">신규</p>
            <div class="card-wrap">
                <div class="card1">
                    <span>신규 주문</span>
                    <br>
                    <span><%=newOrder%></span>
                </div>
                <div class="card1">
                    <span>신규 리뷰</span>
                    <br>
                    <span><%=newReview%></span>
                </div>
            </div>
            <div class="card1">
                <span>신규 QnA</span>
                <br>
                <span><%=newReview%></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
