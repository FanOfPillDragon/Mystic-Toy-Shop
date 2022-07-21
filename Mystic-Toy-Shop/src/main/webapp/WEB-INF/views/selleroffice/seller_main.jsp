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
<%!
    public String getSubstr(String str) {

        String rtnStr = "";
        if(str == null || str.equals("")) {
            rtnStr = "내용 없음";
        } else if (str.length() > 14) {
            rtnStr = str.substring(0,14) + "...";
        } else {
            rtnStr = str;
        }

        return rtnStr;
    }
%>
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

/*        .card:hover{
            box-shadow: 8px 8px 8px blue;
            transform:scale(1.08);
        }*/

    </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<body style="text-align: center">
<div id="content" style="margin-top: 30px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-4 mb-2">
                <h5 style="text-align: left;margin-bottom: 0;">🛒 판매 주문 게시판 당일 요약</h5>
                <p style="text-align: left;">오늘 꺼 분석을 볼수잇따 그래그래 그런 페이지에욤 하하</p>
            </div>
        </div>

        <div class="row">

                <div class="col-xl-2 col-md-2 mb-4">
                    <div class="card  h-100 py-2">
                        <div class="card-body" style="background-color: #4e73df21;">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-s font-weight-bold text-uppercase mb-1">
                                        판매<br>현황
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--판매중--%>
                <div class="col-xl-2 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body read-more"  data-toggle="tooltip" title="현재 판매중인 상품 수입니다.">
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
                        <div class="card-body read-more" data-toggle="tooltip" title="재고가 0인 상품 수입니다.">
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
                        <div class="card-body read-more" data-toggle="tooltip" title="판매를 종료한 상품 수입니다.">
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
        </div>
        <div class="row">
            <div class="col-xl-2 col-md-2 mb-4">
                <div class="card  h-100 py-2">
                    <div class="card-body" style="background-color: #d3c9ec52;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-uppercase mb-1">
                                    배송<br>현황
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <%--배송준비--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body read-more" data-toggle="tooltip" title="출고 되지 않은 주문수 입니다.">
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
                    <div class="card-body read-more" data-toggle="tooltip" title="출고 된 주문수 입니다.">
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
                    <div class="card-body read-more" data-toggle="tooltip" title="반품 요청 된 주문 수 입니다.">
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
            <div class="col-xl-2 col-md-2 mb-4">
                <div class="card  h-100 py-2">
                    <div class="card-body" style="background-color: #6accbc1c;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-uppercase mb-1">
                                    게시판<br>현황
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--신규주문--%>
            <div class="col-xl-2 col-md-6 mb-4">
                <div class="card border-left-mint shadow h-100 py-2">
                    <div class="card-body read-more" data-toggle="tooltip" title="금일 주문 수입니다.">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-success text-uppercase mb-1">
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
                    <div class="card-body read-more" data-toggle="tooltip" title="금일 등록 된 리뷰글 수입니다.">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-success text-uppercase mb-1">
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
                    <div class="card-body read-more" data-toggle="tooltip" title="금일 등록 된 문의 글 수 입니다.">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-s font-weight-bold text-success text-uppercase mb-1">
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
        <div class="col-xl-4 mb-2">
            <h5 style="text-align: left;margin-bottom: 0;"> 🗃️ 판매 주문 게시판 당일 요약</h5>
            <p style="text-align: left;">오늘 꺼 분석을 볼수잇따 그래그래 그런 페이지에욤 하하</p>
        </div>
    </div>
        <div class="row">
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-1">
                        <span>리뷰</span>
                    </div>
                    <div class="card-body">
                        <table class= "table table-hover" style="width: 100%;">
                            <%
                                int i = 0;
                                for (ReviewDto dto : reviewList) {
                                i++;
                            %>
                            <colgroup>
                                <col width="5%">
                                <col width="25%">
                                <col width="50%">
                                <col width="20%">
                            </colgroup>
                            <tr data-toggle="tooltip" title="<%=dto.getReview_content()%>">
                                <td style="color: rgb(119 152 184);font-weight:bold;"><%=i%></td>
                                <td style="font-size: 11pt"><a
                                        href="reviewdetail.do?review_id=<%=dto.getReview_id()%>"><%=dto.getReview_title()%>
                                </a></td>
                                <td style="font-size: 11pt;"><%=getSubstr(dto.getReview_content())%></td>
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
                        <table class="table table-hover" style="width: 100;">
                            <%
                                int k = 0;
                                for (QnADto dto : qnaList) {
                                k++;
                            %>
                            <colgroup>
                                <col width="5%">
                                <col width="25%">
                                <col width="50%">
                                <col width="20%">
                            </colgroup>
                            <tr data-toggle="tooltip" title="<%=dto.getQna_content()%>">
                                <td style="color: rgb(119 152 184);font-weight:bold;"><%=i%></td>
                                <td style="font-size: 11pt"><a
                                        href="qnadetail.do?qna_id=<%=dto.getQna_id()%>"><%=dto.getQna_title()%>
                                </a></td>
                                <td style="font-size: 11pt;"><%=getSubstr(dto.getQna_content())%></td>
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
        <div class="col-xl-4 mb-2">
            <h5 style="text-align: left;margin-bottom: 0;"> 📊 판매 내역 차트로 ㅂ여쥬는 </h5>
            <p style="text-align: left;">오늘 꺼 분석을 볼수잇따 그래그래 그런 페이지에욤 하하</p>
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
            type: 'pie'
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