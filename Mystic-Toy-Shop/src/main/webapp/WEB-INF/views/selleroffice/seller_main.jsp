<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style>
        #content-wrapper {
            background-color: #f8f9fc;
            width: 100%;
            overflow-x: hidden;
        }
        .shadow {
            box-shadow: 0 .1rem .5rem rgba(0,0,0,.10)!important;
        }
        #wrapper #content-wrapper #content {
            flex: 1 0 auto;
        }
        .border-left-primary {
            border-left: 0.25rem solid #4e73df!important;
        }

        .border-left-warning {
            border-left: 0.25rem solid #d1c4e9!important;
        }

        .border-left-mint {
            border-left: 0.25rem solid #6accbc!important;
        }
        .card-header {
            background-color : #0dacf00d;
        }
    </style>
</head>

<body style="text-align: center">
<div id="content">
    <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <%--<h1 class="h3 mb-0 text-gray-800">운영 현황</h1>--%>
        </div>
        <div class="row">

            <%--판매중--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                    📌 판매중
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=onSaleProduct%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--품절된 상품--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                    ❗ 품절된 상품
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=soldOutProduct%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--판매종료--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-primary text-uppercase mb-1">
                                    💡 판매종료
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=endSaleProduct%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <div class="row">
            <%--
                            <h3 class="h3 mb-0 font-weight-bold text-gray-800">배송현황 </h3>
            --%>

            <%--배송준비--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    🚚 배송준비
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=readyToShip%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--배송완료--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    👍 배송완료
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=completedShip%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--반품요청--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    ❓ 반품요청
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    0
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <%--리뷰현황--%>
        <div class="row">
            <%--
                            <h3 class="h3 mb-0 font-weight-bold text-gray-800">신규 </h3>
            --%>

            <%--신규주문--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-mint shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    🎉 신규주문
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=newOrder%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--신규리뷰--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-mint shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    💌 신규리뷰
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=newReview%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--신규QnA--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-mint shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-warning text-uppercase mb-1">
                                    📃 신규 QnA
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <%=newQnA%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-1">
                        <span>리뷰</span>
                    </div>
                    <div class="card-body">
                        <table style="width: 80%;">
                            <% for (ReviewDto dto : reviewList) {%>
                            <colgroup>
                                <col width="30%">
                                <col width="50%">
                                <col width="20%">
                            </colgroup>
                            <tr>
                                <td style="font-size: 11pt"><a
                                        href="reviewdetail.do?review_id=<%=dto.getReview_id()%>"><%=dto.getReview_title()%>
                                </a></td>
                                <td style="font-size: 11pt"><%=dto.getReview_content()%></td>
                                <td style="font-size: 11pt; text-align: right;"><%=DateUtil.toYYYYMMDD(dto.getReview_register_date())%>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-1">
                        <span>고객문의</span>
                    </div>
                    <div class="card-body">
                        <table style="width: 80%;">
                            <% for (QnADto dto : qnaList) {%>
                            <colgroup>
                                <col width="70%">
                                <col width="30%">
                            </colgroup>
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
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-1">
                        <span>카테고리 별 주간 상품 판매 금액</span>
                    </div>
                    <div class="card-body">
                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <%--<p class="highcharts-description">
                                카테고리 별 주간 상품 판매 금액 확인할 수 있습니다.
                            </p>--%>
                        </figure>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-1">
                        <span>금주 일간 판매량</span>
                    </div>
                    <div class="card-body">
                        <figure class="highcharts-figure">
                            <div id="container_quan"></div>

                        </figure>
                    </div>
                </div>
            </div>

        </div>

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
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '개'
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
            text: ''
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
