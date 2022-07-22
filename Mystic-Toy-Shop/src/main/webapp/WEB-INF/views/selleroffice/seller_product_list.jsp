<%@ page import="lotte.com.toy.dto.ProductResponseDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-21
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ProductResponseDto> list = (List<ProductResponseDto>) request.getAttribute("mysalelist");

    /*
                p.product_id,
               product_name,
               product_img,
               product_cost,
               product_stock,
               product_sell_count,
               c.category_id,
               category_name
     */
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .mini {
            width: 70px;
            height: auto;
            max-height: 70px;
            padding: 5px;
        }

        .stockbtn {
            background-color: transparent;
            width: 80px;
            height: 30px;
            text-align: center;
            border: solid 1px #3A4CA8;
            color: #3A4CA8;
            font-size: 14px
        }
    </style>
</head>
<body>
<div class="container mt-5 px-5 mx-2">
    <div>
        <div style="display: flex">
        </div>
        <div style="display: flex; flex-direction: row-reverse; justify-content: space-between;">
            <button class="btn btn-secondary" type="button" onclick="delbtn()">상품삭제</button>
            <strong>상품목록조회</strong>
        </div>
        <hr>
        <table class="table-primary table-hover" style="text-align: center">
            <tr>
                <col width="30">
                <col width="50">
                <col width="600">
                <col width="150">
                <col width="100">
                <col width="100">
                <col width="100">
                <th> </th>
                <th>이미지</th>
                <th style="text-align: center">상품명</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>현재 재고</th>
                <th>판매량</th>
            </tr>
            <c:forEach var="productResponseDto" items="${mysalelist}">
                <c:set var="cost" value="${productResponseDto.product_cost}"/>
                <%
                    int cost = (int) pageContext.getAttribute("cost");
                    String product_cost = DateUtil.to000(cost);
                    pageContext.setAttribute("product_cost", product_cost);
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="check[]" value="${productResponseDto.product_id}" class="chkselect" onclick="Chk()">
                    </td>
                    <td >
                        <img class="mini" src="${productResponseDto.product_img}">
                    </td>
                    <td><a href="/productUpdate.do?product_id=${productResponseDto.product_id}">${productResponseDto.product_name}</a>
                    </td>
                    <td>${productResponseDto.category_name}</td>
                    <td>${product_cost} 원</td>
                    <td>
                        <c:set var="stock" value="${productResponseDto.product_stock}"/>
                        <c:choose>
                            <c:when test="${stock > 0}">
                                <button type="button" id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">${productResponseDto.product_stock}</button>
                            </c:when>
                            <c:when test="${stock == 0}">
                                <button style="border-color: #d62516; color: #d62516; text-decoration-line: line-through;"
                                        type="button" id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">품절
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button style="color: #d62516; text-decoration-line: line-through;" type="button"
                                        id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">판매종료
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${productResponseDto.product_sell_count}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<script>
    var result = Array();
    function Chk() {
        var cnt = 0;
        var chkbox = $(".chkselect");
        for(i=0;i<chkbox.length;i++) {
            if(chkbox[i].checked == true) {
                result[cnt] = chkbox[i].value;
                cnt++;
            }
        }
        $('#result').val(result);
        console.log(result);
    }

    function delbtn(){
        let real = confirm("정말 삭제하시겠습니까?");

        if(real){
            var objDellist = {
                "productIdList" : result
            };
            $.ajax({
                url: '<%=request.getContextPath()%>/productDelete.do',
                dataType: "json",
                type: "POST",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data: objDellist,
                success: function (data) {
                    alert("정상적으로 삭제되었습니다.")
                    location.reload();
                },error: function (data){
                   console.log(data);
                }
            });
        }

    }

    function stockUpdate(product_id) {
        var stock_count = prompt("재고 수정 (숫자만 입력) 0 = 품절 , -1 = 판매종료")
        $.ajax({
            url: '<%=request.getContextPath()%>/stockUpdate.do?product_id=' + product_id + "&product_stock=" + stock_count,
            type: 'get',
            data: {},
            success: function (data) {
                alert("정상처리 되었습니다.")
                location.reload();
            }
        });
    }
</script>

</body>
</html>
