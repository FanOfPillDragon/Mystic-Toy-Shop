<%@ page import="lotte.com.toy.dto.FileDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.service.FileService" %>
<%@ page import="lotte.com.toy.dto.OrderStatsDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lotte.com.toy.dto.WeeklyStatsDto" %>
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
            min-width: 320px;
            max-width: 600px;
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

        input[type="number"] {
            min-width: 50px;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-lg-4">
        <div class="card mb-4 py-3 border-left-primary">
            <div class="card-body">
                <h5>오늘 가장 많이 팔린 카테고리</h5>
                <span style="font-size:20px;"><strong>${catToday.category_name}</strong></span>
                <br>
                <span>주문수 : ${catToday.total_orders}</span>
                <span>상품판매량 : ${catToday.total_quantity}</span>
                <span>결제금액 : ${catToday.total_price}</span>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card mb-4 py-3 border-left-primary">
            <div class="card-body">
                <h5>이번주 가장 많이 팔린 카테고리</h5>
                <span style="font-size:20px;"><strong>${catWeek.category_name}</strong></span>
                <br>
                <span>주문수 : ${catWeek.total_orders}</span>
                <span>상품판매량 : ${catWeek.total_quantity}</span>
                <span>결제금액 : ${catWeek.total_price}</span>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6">
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
<%--<div>
        <c:forEach var="dto" items="${weeklyList}">
            <div><h5>
            <c:choose>
                <c:when test="${dto.weekday == '1'}">일</c:when>
                <c:when test="${dto.weekday == '2'}">월</c:when>
                <c:when test="${dto.weekday == '3'}">화</c:when>
                <c:when test="${dto.weekday == '4'}">수</c:when>
                <c:when test="${dto.weekday == '5'}">목</c:when>
                <c:when test="${dto.weekday == '6'}">금</c:when>
                <c:when test="${dto.weekday == '7'}">토</c:when>
            </c:choose>
            </h5>
            </div>
            <div>날짜 : ${dto.order_date}</div>
            <div>주문량 : ${dto.total_orders}</div>
            <div>판매상품량 : ${dto.total_quantity}</div>
            <div>결제금액 : ${dto.total_price}</div>

            <hr>
        </c:forEach>
</div>--%>

<div class="row">
    <div class="col-lg-8">
    <table class="table table-hover">
        <h5>주간 판매 분석</h5>
        <tr>
            <th>이번 주 총 주문량</th>
            <th>이번 주 총 판매상품량</th>
            <th>이번 주 총 결제금액</th>
        </tr>
        <tr style="text-align: center;">
            <td><strong>${week.total_orders}</strong></td>
            <td><strong>${week.total_quantity}</strong></td>
            <td><strong>${week.total_price}</strong></td>
        </tr>
    </table>
    </div>
</div>

    <div class="row">
        <div class="col-lg-4">
            <figure class="highcharts-figure">
                <div id="container"></div>
                <p class="highcharts-description">
                    카테고리 별 주간 상품 판매 금액 확인할 수 있습니다.
                </p>
            </figure>
        </div>

        <div class="col-lg-4">
            <div>
                <figure class="highcharts-figure">
                    <div id="container_quan"></div>
                    <p class="highcharts-description">
                        카테고리 별 주간 상품 판매량을 확인할 수 있습니다.
                    </p>
                </figure>
            </div>
        </div>
    </div>


    <%

        List<OrderStatsDto> list = (List<OrderStatsDto>)request.getAttribute("catWeeks");
        List<WeeklyStatsDto> weeklyList = (List<WeeklyStatsDto>)request.getAttribute("weeklyStatsDtoList");
        List<String> category_names = new ArrayList<String>();

        String categories = "[";

        String json = "[";
        String json2 = "[";
        String weeklyData = "[";

        for(OrderStatsDto dto : list){
            json += "{ name:'" + dto.getCategory_name() + "', y:" + dto.getTotal_price() + "}, ";

            json2 += "{ name:'" + dto.getCategory_name() + "', y:" + dto.getTotal_quantity() + "}, ";

            if (!category_names.contains(dto.getCategory_name())) {
                categories += "'" + dto.getCategory_name() + "', ";
            }
        }

        categories = categories.substring(0, categories.lastIndexOf(","));
        categories += "]";

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
        json = json.substring(0, json.lastIndexOf(","));
        json += "]";
        json2 = json2.substring(0, json2.lastIndexOf(","));
        json2 += "]";
        weeklyData = weeklyData.substring(0, weeklyData.lastIndexOf(","));
        weeklyData += "]";
        System.out.println("categories : " +categories);
        // 전자게임 / 인형놀이
        /*name: '역할놀이/인형/꾸미기',
                data: [1, 2, 1, 0, 0,0,1]*/


        request.setAttribute("jsonData", json);
        request.setAttribute("jsonData2", json2);
        request.setAttribute("weeklyData", weeklyData);
        request.setAttribute("categories", categories);




    %>
<script type="text/javascript">
    Highcharts.chart('container', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
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
        series: [{
            name: 'Brands',
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
        title: {
            text: '카테고리 별 주간 상품 판매량'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        xAxis: {
            categories: <%=request.getAttribute("categories") %>
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
            name: 'Brands',
            colorByPoint: true,
            data: <%=request.getAttribute("jsonData2") %>
        }]
    });


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
            categories: ['월', '화', '수', '목', '금', '토']
        },
        yAxis: {
            title: {
                text: '결제금액'
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
</script>

</div>
</body>
</html>
