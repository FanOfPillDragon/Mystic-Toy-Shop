<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="lotte.com.toy.dto.CartDto" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>장바구니</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/cartdetail.css">
</head>
<body>
<div class="h3 d-flex justify-content-center my-5">장바구니</div>
<div class="container">

    <div class="flexTableContainer">

        <div class="cartTitle">일반 <span class="colorPrimary">(${fn:length(cartUserProductDtoList)})</span></div>
        <div class="flexContainer">
            <div class="cartBoxContainer">
                <c:forEach var="cupDto" items="${cartUserProductDtoList}">
                    <input type="hidden" id="" value="${cupDto.cart_id}"/>
                    <div class="cartBox p-3">
                        <div>
                            <div class="h4">${cupDto.product_name}</div>
                        </div>

                        <div>
                            <div class="spinnerBox">
                                <button class="btn minus disabled">-</button>
                                <div class="number"><input type="number" class="quantity" id="quantity" max="${cupDto.product_stock}" value="${cupDto.cart_quantity}">
                                    <label for="quantity" class="blind">${cupDto.cart_quantity}</label>
                                </div>
                                <button class="btn plus disabled">+</button>
                            </div>

                        </div>
                        <div>
                            <div>${cupDto.product_cost} 원</div>
                            <input type="button" class="btn deleteItem" id="deleteCart" onclick="deleteCart(${cupDto.cart_id})"></div>
                    </div>
                </c:forEach>
            </div>
            <div class="sideArea p-3">
                <div class="priceTitle">결제예정금액</div>
                <div class="priceList">

                    <dl>
                        <dt>상품금액</dt>
                        <dd>원</dd>
                    </dl>
                    <dl>
                        <dt>상품할인금액</dt>
                        <dd>원</dd>
                    </dl>
                    <dl>
                        <dt>배송비</dt>
                        <dd>원</dd>
                    </dl>
                </div>

                <dl class="totalPrice">
                    <dt>총 <span class="colorPrimary">${fn:length(cartUserProductDtoList)}</span> 건</dt>
                    <dd><strong class="price colorPrimary"></strong><span class="won colorPrimary">원</span></dd>
                </dl>

                <ul class="cartBtnSet">
                    <li><a class="btnOrder">주문하기</a></li>
                    <li><a class="btnGift">선물하기</a></li>
                </ul>

            </div>
        </div>

        <div class="cautionBox">
            <div class="h4 mb-3">유의사항</div>
            <div class="align-middle justify-content-between bgColor py-3 px-1">
                <ul class="m-1 p-0 ps-4">
                    <li>장바구니에 담긴 상품(옵션 단위)은 99개까지 보여지고, 최대 90일까지 보관됩니다.</li>
                    <li> 장바구니 계속 담아두기를 설정하시면 시간이 지나도 상품이 삭제되지 않습니다.</li>
                    <li>PC와 모바일은 서로 연동되지만 적용에 시간 차가 있을 수 있습니다.</li>
                    <li>상품의 판매상태(판매종료/상품정보변경/품절 등)는 별도 표기 됩니다.</li>
                    <li> 롯데백화점 구매 상품은 즉시할인이 적용된 금액 기준으로 배송비가 부과되며, 롯데마트/롯데슈퍼프레시 구매 상품은 즉시할인 및 추가할인이 적용된 가격 기준으로 부과됩니다.</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function deleteCart(cartId) {
        alert('상품을 삭제하시겠습니까?');
        $.ajax({
            url: '<%=request.getContextPath()%>/cartdelete.do?cartId=' + cartId,
            type: 'get',
            data: {},
            success: function (data) {
                console.log(data);
                location.reload();
            }
        });
    }

</script>
</body>
</html>
