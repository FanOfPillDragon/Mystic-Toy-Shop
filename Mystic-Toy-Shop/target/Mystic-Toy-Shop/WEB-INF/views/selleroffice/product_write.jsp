<%@ page import="lotte.com.toy.dto.CategoryDto" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-18
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%--products(product_name,product_info,product_img,product_cost,product_stock,product_sell_count,category_id,seller_id) --%>
<%
    List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
    System.out.println(request.getContextPath()) ;
%>
<html>
<head>
    <%-- Summernote import--%>
    <script src="resources/summernote/summernote-ko-KR.js"></script>
    <script src="resources/summernote/summernote-lite.js"></script>
    <link rel="stylesheet" href="resources/summernote/summernote-lite.css"/>
    <title>Title</title>
    <style type="text/css">
/*        body{
            background-color: #e2e2e2;
        }*/
        .temp{
            width: 80%;
            background-color: white;
            border : solid 0.5px;
            padding-left : 15px;
            padding-right : 15px;
            margin-bottom: 10px;
        }
        .th{
            border-bottom: solid 1px #e2e2e2;
            margin-bottom: 3px;
        }
    </style>
</head>
<body>
<form action="writeAf.do" method="post">
    <div class="temp" style="height:80px;">
        <h3 style="font-size: 17pt; float: left ;">상품등록 <span style="color: red; font-size: 8pt;">• 필수입력</span></h3>
    </div>
    <div class="temp">
        <div class="th">
            <p>카테고리</p>
        </div>
        <div>
            <button>t1</button>
            <button>t2</button>
            <button>t3</button>
            <button>t4</button>
        </div>
    </div>
    <div class="temp">
        <div class="th">
            <p>상품명</p>
        </div>
        <div>
            <input type="text" name="product_name" size="80" placeholder="상품명">
        </div>
    </div>
    <div class="temp">
        <div class="th">
            <p>판매가</h3>
        </div>
        <div>
            <input type="text" name="product_cost" size="20" placeholder="판매가">
        </div>
    </div>
    <div class="temp">
        <div class="th">
            <p>재고수량</p>
        </div>
        <div>
            <input type="text" size="20" placeholder="숫자만입력"><span>개</span>
        </div>
    </div>
    <div class="temp">
        <h3>이미지</h3>
    </div>
    <div class="temp">
        <div class="th">
            <p>상세설명</p>
        </div>
        <div class="container">
            <textarea class="summernote" name="editordata"></textarea>
        </div>
    </div>
</form>

<script>
    $('.summernote').summernote({
        height: 150,
        lang: "ko-KR",
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });
</script>
</body>
</html>
