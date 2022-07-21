<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.OrderStatsDto" %>
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
    .highcharts-figure,
    .highcharts-data-table table {
      min-width: 310px;
      max-width: 800px;
      margin: 1em auto;
    }

    #container {
      height: 400px;
    }

    .shadow {
      box-shadow: 0 .1rem .5rem rgba(0,0,0,.10)!important;
    }
    #wrapper #content-wrapper #content {
      flex: 1 0 auto;
    }
    ul {
      padding-inline-start: 0px;
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
    .table>:not(:first-child) {
      border-top: 0px solid currentColor;
    }

    .card .read-more:hover{
      transform:scale(1.08);
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
    .card-header {
      background-color : #0dacf00d;
    }
    input[type="number"] {
      min-width: 50px;
    }

    td {
      text-align: center;
      vertical-align: middle;
    }
  </style>
</head>
<body style="text-align: center">
<div id="content" style="padding-top: 10px;padding-left: 10px;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-6 mb-4">
        <div class="card shadow mb-4">
          <div class="card-header py-1">
            <span>별점 높은 상품 TOP 5</span>
          </div>
          <div class="card-body">
            <table class= "table table-hover" style="width: 100%;">
              <colgroup>
                <col width="40%">
                <col width="30%">
                <col width="30%">

              </colgroup>
              <tr>
                <th>상품명</th>
                <th>별점</th>
                <th>이미지</th>
              </tr>
              <c:forEach var="dto" items="${TopRatedProduct}">

                <tr>
                  <td><a
                          href="/productDetail.do?product_id=${dto.product_id}">${dto.product_name}
                  </a>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${dto.review_rate > 0 && dto.review_rate <=1}">💖 (${dto.review_rate}) </c:when>
                      <c:when test="${dto.review_rate > 1 && dto.review_rate <=2}">💖💖 (${dto.review_rate})</c:when>
                      <c:when test="${dto.review_rate > 2 && dto.review_rate <=3}">💖💖💖 (${dto.review_rate})</c:when>
                      <c:when test="${dto.review_rate > 3 && dto.review_rate <=4}">💖💖💖💖 (${dto.review_rate})</c:when>
                      <c:when test="${dto.review_rate > 4 && dto.review_rate <=5}">💖💖💖💖💖 (${dto.review_rate})</c:when>
                    </c:choose>
                  </td>
                  <td>
                    <img src="${dto.product_img}" style="width:100px">
                  </td>

                </tr>
              </c:forEach>

            </table>
          </div>
        </div>
      </div>
    </div>

    <%--    <div>
            <h5>가장 리뷰가 많이 달린 상품</h5>
            <p><strong>${MostReviewedProduct.product_name}</strong></p>
          <p style="width: 100px;"><img class="logoArea" src="${MostReviewedProduct.product_img}" alt=""></p>
          <p><strong>${MostReviewedProduct.review_cnt}</strong></p>
        </div>--%>

  </div>
</div>
    <div class="row">
      <div class="col-lg-6 mb-4">
        <div class="card shadow mb-4">
          <div class="card-header py-1">
            <span>별점이 높은 상품들</span>
          </div>
          <div class="card-body">
            <figure class="highcharts-figure">
              <div id="container"></div>

            </figure>
          </div>
        </div>
      </div>
</div>



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


</body>
</html>
