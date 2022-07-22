<%@ page import="lotte.com.toy.dto.FileDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.service.FileService" %>
<%@ page import="lotte.com.toy.dto.OrderStatsDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lotte.com.toy.dto.WeeklyStatsDto" %>
<%@ page import="lotte.com.toy.util.DateUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: BTC-N02
  Date: 2022-07-20
  Time: 오전 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <title>Title</title>
    <style>
        .datacontainer {
            font-size : 14px;
        }
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 600px;
            max-width: 1000px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }

        .card .read-more:hover{
            transform:scale(1.08);
        }

        .searchoption {
            float: left;
            margin-left: 10px;
        }

        input[type="number"] {
            min-width: 50px;
        }

        .word-break-container{
            word-break: keep-all;
        }

        .card-height-size{
            height: 250px;
        }
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<body>
<div id="content" style="margin-top: 30px;">
    <div class="container-fluid word-break-container">
        <div class="row">
            <div class="col-xl-4 mb-2">
                <h5 style="text-align: left;margin-bottom: 0;">🛒 카테고리별 주문량 요약 </h5>
                <p style="text-align: left;">카테고리 별 주문 통계를 확인할 수 있습니다. </p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card mb-4 py-3 border-left-primary card-height-size">
                    <div class="card-body read-more">
                        <h5>오늘 가장 많이 팔린 카테고리</h5>
                        <c:choose>
                            <c:when test="${empty catToday}">
                                <span>오늘 주문량이 없습니다</span>
                                <br><br><br>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost" value="${catToday.total_price}"/>
                                <%
                                    int cost = (int) pageContext.getAttribute("cost");
                                    String product_cost = DateUtil.to000(cost);
                                    pageContext.setAttribute("catTodayTotalPrice", product_cost);
                                %>
                                <span class="text-primary" style="font-size:20px;"><strong>${catToday.category_name}</strong></span>
                                <br><br>
                                <span>주문수 : ${catToday.total_orders}</span><br>
                                <span>상품판매량 : ${catToday.total_quantity}</span><br>
                                <span>결제금액 : ${catTodayTotalPrice}원</span>
                            </c:otherwise>
                        </c:choose>

<%--                        <span style="font-size:20px;"><strong>${catToday.category_name}</strong></span>
                        <br>
                        <span>주문수 : ${catToday.total_orders}</span>
                        <span>상품판매량 : ${catToday.total_quantity}</span>
                        <span>결제금액 : ${catToday.total_price}</span>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card mb-4 py-3 border-left-primary card-height-size">
                    <div class="card-body read-more">
                        <h5>이번주 가장 많이 팔린 카테고리</h5>
                        <c:choose>
                            <c:when test="${empty catWeek}">
                                <span>이번주 주문량이 없습니다</span>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost2" value="${catWeek.total_price}"/>
                                <%
                                    int cost2 = (int) pageContext.getAttribute("cost2");
                                    String product_cost = DateUtil.to000(cost2);
                                    pageContext.setAttribute("catWeakTotalPrice", product_cost);
                                %>
                                <span class="text-primary" style="font-size:20px;"><strong>${catWeek.category_name}</strong></span>
                                <br><br>
                                <span>주문수 : ${catWeek.total_orders}</span><br>
                                <span>상품판매량 : ${catWeek.total_quantity}</span><br>
                                <span>결제금액 : ${catWeakTotalPrice}원</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card mb-4 py-3 border-left-primary card-height-size">
                    <div class="card-body read-more">
                        <h5>이번달 가장 많이 팔린 카테고리</h5>
                        <c:choose>
                            <c:when test="${empty catMonth}">
                                <span>이번달 주문량이 없습니다</span>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost2" value="${catMonth.total_price}"/>
                                <%
                                    int cost2 = (int) pageContext.getAttribute("cost2");
                                    String product_cost = DateUtil.to000(cost2);
                                    pageContext.setAttribute("catMonthTotalPrice", product_cost);
                                %>
                                <span class="text-primary" style="font-size:20px;"><strong>${catMonth.category_name}</strong></span>
                                <br><br>
                                <span>주문수 : ${catMonth.total_orders}</span><br>
                                <span>상품판매량 : ${catMonth.total_quantity}</span><br>
                                <span>결제금액 : ${catMonthTotalPrice}원</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <%------------------%>
        <div class="row">
            <div class="col-xl-4 mb-2 mt-3">
                <h5 style="text-align: left;margin-bottom: 0;">📊 판매량 분석 및 요약</h5>
                <p style="text-align: left;">금일, 금주, 금월 판매량 집계를 확인할 수 있습니다.</p>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-9 mb-4">
                <table id="mainstats" class="table table-striped table-hover">
                    <tr>
                        <td>금일 주문량</td>
                        <td>금일 판매상품량</td>
                        <td>금일 결제금액</td>
                    </tr>
                    <tr style="text-align: center;">
                        <c:choose>
                            <c:when test="${empty today}">
                                <td colspan="3">오늘 주문량이 없습니다</td>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost2" value="${today.total_price}"/>
                                <%
                                    int cost2 = (int) pageContext.getAttribute("cost2");
                                    String product_cost = DateUtil.to000(cost2);
                                    pageContext.setAttribute("todayTotalPrice", product_cost);
                                %>
                                <td><strong>${today.total_orders}</strong></td>
                                <td><strong>${today.total_quantity}</strong></td>
                                <td><strong>${todayTotalPrice}원</strong></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr >
                        <td>이번 주 총 주문량</td>
                        <td>이번 주 총 판매상품량</td>
                        <td>이번 주 총 결제금액</td>

                    </tr>
                    <tr style="text-align: center;">
                        <c:choose>
                            <c:when test="${empty week}">
                                <td colspan="3">금주 주문량이 없습니다</td>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost2" value="${week.total_price}"/>
                                <%
                                    int cost2 = (int) pageContext.getAttribute("cost2");
                                    String product_cost = DateUtil.to000(cost2);
                                    pageContext.setAttribute("weekTotalPrice", product_cost);
                                %>
                                <td><strong>${week.total_orders}</strong></td>
                                <td><strong>${week.total_quantity}</strong></td>
                                <td><strong>${weekTotalPrice}원</strong></td>
                            </c:otherwise>
                        </c:choose>

                    </tr>
                    <tr>
                        <td>이번 달 총 주문량</td>
                        <td>이번 달 총 판매상품량</td>
                        <td>이번 달 총 결제금액</td>
                    </tr>
                    <tr style="text-align: center;">
                        <c:choose>
                            <c:when test="${empty month}">
                                <td colspan="3">이번 달 주문량이 없습니다</td>
                            </c:when>
                            <c:otherwise>
                                <c:set var="cost2" value="${month.total_price}"/>
                                <%
                                    int cost2 = (int) pageContext.getAttribute("cost2");
                                    String product_cost = DateUtil.to000(cost2);
                                    pageContext.setAttribute("monthTotalPrice", product_cost);
                                %>
                                <td><strong>${month.total_orders}</strong></td>
                                <td><strong>${month.total_quantity}</strong></td>
                                <td><strong>${monthTotalPrice}원</strong></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
            </div>
        </div>

        <%------------------%>

        <div class="row">
            <div class="col-xl-4 mb-4 mt-3">
                <h5 style="text-align: left;margin-bottom: 0;">📈 카테고리별 주간 판매량</h5>
                <p style="text-align: left;">카테고리별 주간 판매량을 확인합니다.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-9 mb-1">
                <div class="datacontainer">
                    <div>
                        <figure class="highcharts-figure">
                            <div id="weekly_container"></div>
                            <p class="highcharts-description">
                            </p>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
        <%------------------%>
        <div class="row">
            <div class="col-xl-4 mb-1">
                <h5 style="text-align: left;margin-bottom: 0;">🏆 판매량 추이 그래프</h5>
                <p style="text-align: left;">판매 추이</p>
                <ul class="srchResultSortOptions">
                    <li class="searchoption"><div id="btnPrice" onclick="getChartPrice()" style="font-weight:bold; cursor: pointer;">판매금액</div></li>
                    <li class="searchoption"><div id="btnQuan"  onclick="getChartQuan()"  style="cursor: pointer;">판매량</div></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-9 mb-4">
                <div class="datacontainer">
                    <div>
                        <figure class="highcharts-figure">
                            <div id="weektotal_price"></div>
                            <div id="weektotal_quantity" style="display:none;"></div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <%

        List<OrderStatsDto> list = (List<OrderStatsDto>)request.getAttribute("catWeeks");
        List<WeeklyStatsDto> weeklyList = (List<WeeklyStatsDto>)request.getAttribute("weeklyStatsDtoList");


        String weeklyData = "[";

        for(WeeklyStatsDto weekday : weeklyList) {
            weeklyData += "{ name:'" + weekday.getCategory_name() + "', data: [";
            weeklyData += weekday.getSun_quantity() +", ";
            weeklyData += weekday.getMon_quantity() +", ";
            weeklyData += weekday.getTue_quantity() +", ";
            weeklyData += weekday.getWed_quantity() +", ";
            weeklyData += weekday.getThu_quantity() +", ";
            weeklyData += weekday.getFri_quantity() +", ";
            weeklyData += weekday.getSat_quantity() +"]}, ";
        }

        weeklyData = weeklyData.substring(0, weeklyData.lastIndexOf(","));
        weeklyData += "]";



        request.setAttribute("weeklyData", weeklyData);




    %>
<script type="text/javascript">

    function getChartPrice() {
        document.getElementById("weektotal_price").style.display = 'block';
        document.getElementById("weektotal_quantity").style.display = 'none';
        $('#btnPrice').css('font-weight', 'bold');
        $('#btnQuan').css('font-weight', '');

    }

    function getChartQuan() {
        document.getElementById("weektotal_price").style.display = 'none';
        document.getElementById("weektotal_quantity").style.display = 'block';
        $('#btnPrice').css('font-weight', '');
        $('#btnQuan').css('font-weight', 'bold');

    }

    Highcharts.chart('weekly_container', {
        chart: {
            type: 'line'
        },
        title: {
            text: '카테고리별 주간 판매 분석'
        },
        subtitle: {
            text: '카테고라고리고리고리고리고리'
        },
        xAxis: {
            categories: ['일', '월', '화', '수', '목', '금', '토']
        },
        yAxis: {
            title: {
                text: '판매 수량'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: <%=request.getAttribute("weeklyData") %>
    });


    Highcharts.chart('weektotal_price', {
        chart: {
            type: 'spline'
        },
        title: {
            text: '주간 판매 분석'
        },
        subtitle: {
            text: '총 판매 금액'
        },
        xAxis: {
            categories: ['일', '월', '화', '수', '목', '금', '토'],
            accessibility: {
                description: 'days of Week'
            }
        },
        yAxis: {
            title: {
                text: 'Sales Amount - Price'
            },
            labels: {
                formatter: function () {
                    return this.value + '원';
                }
            }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: '판매금액',
            marker: {
                symbol: 'square'
            },
            data: ${weelTotAmount}

        }]
    });


    Highcharts.chart('weektotal_quantity', {
        chart: {
            type: 'spline'
        },
        title: {
            text: '주간 판매 분석'
        },
        subtitle: {
            text: '총 판매량'
        },
        xAxis: {
            categories: ['일', '월', '화', '수', '목', '금', '토'],
            accessibility: {
                description: 'days of Week'
            }
        },
        yAxis: {
            title: {
                text: 'Sales Amount - Quantity'
            },
            labels: {
                formatter: function () {
                    return this.value + '개';
                }
            }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: '상품 판매량',
            marker: {
                symbol: 'square'
            },
            data: ${weelTotQuan}

        }]
    });
</script>

</div>
</body>
</html>
