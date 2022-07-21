<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="lotte.com.toy.dto.ReviewDto" %>
<%@ page import="lotte.com.toy.dto.QnADto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.util.DateUtil" %>
<%@ page import="lotte.com.toy.dto.OrderStatsDto" %><%--
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

    List<ReviewDto> reviewList = (List<ReviewDto>) request.getAttribute("reviewlist");
    List<QnADto> qnaList = (List<QnADto>) request.getAttribute("qnalist");



    List<OrderStatsDto> list = (List<OrderStatsDto>)request.getAttribute("catWeek");
    String json = "[";
    String category = "";
    String json2 = "[";
    for(OrderStatsDto dto : list){
        json += "{ name:'" + dto.getCategory_name() + "', y:" + dto.getTotal_price() + "}, ";
        category += "'" + dto.getCategory_name() + "',";
        json2 += "{ name:'" + dto.getCategory_name() + "', y:" + dto.getTotal_quantity() + "}, ";
    }
    json = json.substring(0, json.lastIndexOf(","));
    json += "]";
    category = category.substring(0, category.lastIndexOf(","));
    request.setAttribute("category",category);
    System.out.println(category);
    json2 = json2.substring(0, json2.lastIndexOf(","));
    json2 += "]";
    request.setAttribute("jsonData", json);
    request.setAttribute("jsonData2", json2);

    List<OrderStatsDto> weeklyList = (List<OrderStatsDto>)request.getAttribute("weeklyList");

    String json3 =  "[";

    for(OrderStatsDto dto : weeklyList){
        json3 += "{ name:'" + dto.getWeekday() + "', y:" + dto.getTotal_price() + "}, ";
    }

    json3 = json3.substring(0, json3.lastIndexOf(","));
    json3 += "]";
    request.setAttribute("jsonData3", json3);
%>

<html>
<head>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
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
            height: 280px;
            border-right: solid 1px;
            float: left;
        }

        .top2 {
            width: 32%;
            height: 280px;
            padding-left: 6px;
            border-right: solid 1px;
            float: left;
        }

        .top3 {
            width: 32%;
            height: 240px;
            padding-left: 6px;
            float: left;
        }

        .card-wrap {
            display: flex;
        }

        .card1 {
            background-color: #eeeeee;
            text-align: center;
            width: 45%;
            height: 100px;
            border: solid 1px;
            border-radius: 1.5em;
            margin: 5px;
        }

        .mid-info {
            width: 980px;
            height: 200px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .card2 {
            width: 480px;
            height: 200px;
            margin-right: 15px;
            border: solid 1px;
            float: left;
        }

        .card3 {
            width: 480px;
            height: 200px;
            border: solid 1px;
            float: left;
        }

        p.label {
            margin-left: 5px;
            text-align: left;
            font-weight: bold;
        }

        span.label {
            text-align: left;
            font-size: 10pt;
        }

        .num {
            margin-top: 10px;
            font-size: 20pt;
            font-weight: bold;
        }

        a {
            all: unset;
        }
        .chart-box{
            width: 480px;
            height: 425px;
            margin-right: 10px;
            border: solid 1px;
            float: left;
        }
    </style>
</head>
<body style="text-align: center">

<h3>운영현황</h3>
<div class="container" >
    <div class="top-info">
        <div class="top1">
            <p class="label">판매현황</p>
            <div class="card-wrap">
                <div class="card1">
                    <span class="label">판매중</span>
                    <br>
                    <div class="num">
                        <span><%=onSaleProduct%></span>
                    </div>
                </div>
                <div class="card1">
                    <span class="label">품절된 상품</span>
                    <br>
                    <div class="num">
                        <span><%=soldOutProduct%></span>
                    </div>
                </div>
            </div>
            <div class="card1">
                <span class="label">판매종료</span>
                <br>
                <div class="num">
                    <span><%=endSaleProduct%></span>
                </div>
            </div>
        </div>
        <div class="top2">
            <p class="label">배송현황</p>
            <div class="card-wrap">
                <div class="card1">
                    <span class="label">배송준비</span>
                    <br>
                    <div class="num">
                        <span><%=readyToShip%></span>
                    </div>
                </div>
                <div class="card1">
                    <span class="label">배송완료</span>
                    <br>
                    <div class="num">
                        <span><%=completedShip%></span>
                    </div>
                </div>
            </div>
            <div class="card1">
                <span class="label">반품요청</span>
                <br>
                <div class="num">
                    <span>0</span>
                </div>
            </div>
        </div>
        <div class="top3">
            <p class="label">신규</p>
            <div class="card-wrap">
                <div class="card1">
                    <span class="label">신규주문</span>
                    <br>
                    <div class="num">
                        <span><%=newOrder%></span>
                    </div>
                </div>
                <div class="card1">
                    <span class="label">신규리뷰</span>
                    <br>
                    <div class="num">
                        <span><%=newReview%></span>
                    </div>
                </div>
            </div>
            <div class="card1">
                <span class="label">신규QnA</span>
                <br>
                <div class="num">
                    <span><%=newQnA%></span>
                </div>
            </div>
        </div>
    </div>
    <div class="mid-info">
        <div class="card2">
            <p class="label">리뷰</p>
            <table width="100%">
                <% for (ReviewDto dto : reviewList) {%>
                <tr>
                    <td style="font-size: 11pt"><a
                            href="reviewdetail.do?review_id=<%=dto.getReview_id()%>"><%=dto.getReview_title()%>
                    </a></td>
                    <td style="font-size: 8pt; text-align: right; padding-right: 6px;"><%=DateUtil.toYYYYMMDD(dto.getReview_register_date())%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="card3">
            <p class="label">고객문의</p>
            <table width="100%">
                <col width="300">
                <col width="150">
                <% for (QnADto dto : qnaList) {%>
                <tr>
                    <td style="font-size: 11pt"><a
                            href="qnadetail.do?qna_id=<%=dto.getQna_id()%>"><%=dto.getQna_title()%>
                    </a></td>
                    <td style="font-size: 8pt; text-align: right; padding-right: 6px;"><%=DateUtil.toYYYYMMDD(dto.getQna_register_date())%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
    <%--차트 뿌리는 부분--%>
    <div class="chart-box">
        <figure class="highcharts-figure">
            <div id="container"></div>
            <p class="highcharts-description">
                카테고리 별 주간 상품 판매 금액 확인할 수 있습니다.
            </p>
        </figure>
    </div>
    <div class="chart-box">
        <figure class="highcharts-figure">
            <div id="container_quan"></div>
            <p class="highcharts-description">
                카테고리 별 주간 상품 판매량을 확인할 수 있습니다.
            </p>
        </figure>
    </div>
</div>

<script type="text/javascript">
    Highcharts.chart('container', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'column'
        },
        credits: {enabled: false},
        title: {
            text: '카테고리 별 주간 상품 판매 금액'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
/*        xAxis: {
            title:{
                text : '이거 x축'
            }
        },
        categories: [<%=request.getAttribute("category")%>],
        labels:{ //x축이 어떻게 보일것인지 설정
            style: {color:'red' //글자색}
            }
        },*/
        series: [{
            name: '주간 카테고리별 판매량',
            colorByPoint: true,
            data: <%=request.getAttribute("jsonData") %>
        }]
    });

    Highcharts.chart('container_quan', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'column'
        },
        credits: {enabled: false},
        title: {
            text: '일별 판매량'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            name: '주간 일별 판매량',
            colorByPoint: true,
            data: <%=request.getAttribute("jsonData3") %>
        }]
    });
</script>
</body>
</html>
