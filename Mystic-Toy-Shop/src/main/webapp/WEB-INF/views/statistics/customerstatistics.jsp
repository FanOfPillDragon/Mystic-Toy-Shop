<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.OrderStatsDto" %>
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
    .highcharts-figure,
    .highcharts-data-table table {
      min-width: 310px;
      max-width: 800px;
      margin: 1em auto;
    }

    #container {
      height: 400px;
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

<div class="datacontainer">

  <div>
      <h5>가장 리뷰가 많이 달린 상품</h5>
      <p><strong>${MostReviewedProduct.product_name}</strong></p>
      <p><strong>${MostReviewedProduct.review_cnt}</strong></p>
  </div>
  <hr>
  <div>
    <figure class="highcharts-figure">
      <div id="container"></div>
      <p class="highcharts-description">
       별점이 높은 상품들
      </p>
    </figure>
  </div>
  <hr>

  <%


    List<OrderStatsDto> list = (List<OrderStatsDto>)request.getAttribute("TopRatedProduct");
    String jsonTopRatedProduct = "[";
    for(OrderStatsDto dto : list){
      jsonTopRatedProduct += "{ name:'" + dto.getProduct_name() + "', y:" + dto.getReview_rate() + "}, ";
    }
    jsonTopRatedProduct = jsonTopRatedProduct.substring(0, jsonTopRatedProduct.lastIndexOf(","));
    jsonTopRatedProduct += "]";

    request.setAttribute("jsonData", jsonTopRatedProduct);

  %>
  <script type="text/javascript">
    Highcharts.chart('container', {
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
  </script>

</div>
</body>
</html>
