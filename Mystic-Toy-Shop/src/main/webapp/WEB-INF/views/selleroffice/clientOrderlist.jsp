<%@ page import="lotte.com.toy.dto.ClientOrderDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="lotte.com.toy.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-21
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ClientOrderDto> cod = (List<ClientOrderDto> )request.getAttribute("codlist");
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .mini{
            width: 50px;
            height: 70px;
            margin-right: 10px;
            padding: 5px;
        }
    </style>
</head>
<body>
<div>
    <%if(cod.size() > 0) {%>
    <table border="1">
        <tr>
            <col width="100"><col width="600><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
        <th style="padding-left: 6px">주문번호</th><th style="text-align: center">상품명</th><th>판매단가</th><th>수량</th><th>소계금액</th><th>고객이름</th><th>고객번호</th>
        </tr>
        <% for(int i = 0; i<cod.size(); i++) { %>
        <% ClientOrderDto c = cod.get(i) ;%>
        <tr>
            <td style="padding-left: 6px"><%=DateUtil.toYYYYMMDD(c.getOrder_date())%>
                <span style="font-size: 8pt; color: #868e96"><%=DateUtil.toOrderNumber(c.getOrder_date())%></span> </td>
            <td style="text-align: center"><a href="<%=request.getContextPath()%>/productDetail.do?productId=<%=c.getProduct_id()%>"><img class="mini" src="<%=c.getProduct_img()%>"></a><%=c.getProduct_name()%></td>
            <td><%=DateUtil.to000(c.getProduct_cost())%> 원</td><td><%=c.getOrder_quantity()%> 개</td><td><%=DateUtil.to000(c.getOrder_total_price())%> 원</td><td><%=c.getUser_name()%> 님</td>
            <td><%=c.getUser_phone()%></td>
        </tr>
    <%}%>
    </table>

    <%}else {%>
        <h2>주문 정보가 없습니다.</h2>
    <%}%>
</div>

</body>
</html>
