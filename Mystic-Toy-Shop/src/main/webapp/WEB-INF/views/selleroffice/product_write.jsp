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

<%
    List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
    request.setCharacterEncoding("utf-8");
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
        .temp {
            width: 80%;
            background-color: white;
            border: solid 0.5px;
            padding-left: 15px;
            padding-right: 15px;
            margin-bottom: 10px;
            padding-bottom: 5px;
        }

        .category_radio {
        }

        .input-box{
            margin-bottom: 5px;
        }
        .writeReviewDetailPhoto .picUploadList li .picUploadBtn {
            padding-top: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="../writeAf.do" id="frm" method="post" enctype="multipart/form-data">
        <div class="temp" style="height:80px;">
            <h3 style="font-size: 17pt; float: left ;">상품등록 <span style="color: red; font-size: 8pt;">• 필수입력</span></h3>
        </div>
        <div class="temp">
            <p>카테고리</p>
            <hr>
            <div class="input-box">
                <% for (CategoryDto c : categories) {%>
                <input class="category_radio" type="radio" name="category_id" id="category<%=c.getCategory_id()%>"
                       value="<%=c.getCategory_id()%>"> <label><%=c.getCategory_name()%>
            </label>
                <% }%>
            </div>
        </div>
        <div class="temp">
            <p>상품명</p>
            <hr>
            <div class="input-box">
                <input type="text" name="product_name" size="80" placeholder="상품명">
            </div>
        </div>
        <div class="temp">
            <p>판매가</p>
            <hr>
            <div class="input-box">
                <input type="text" name="product_cost" size="20" placeholder="판매가"><span>원</span>
            </div>
        </div>
        <div class="temp">
            <p>재고수량</p>
            <hr>
            <div class="input-box">
                <input type="text" size="20" name="product_stock" placeholder="숫자만입력"><span>개</span>
            </div>
        </div>
        <div class="writeReviewDetailPhoto">
            <div class="picUploadBtn picture">
                    <input type="file" multiple="multiple" name="fileload" accept="image/*" class="btnFile">
                    <br>
                    <br>
                    <input type = "hidden" id="file_where_use" name="file_where_use" value="1">
                    <input type = "hidden" id="file_use_id" name="file_use_id" value="1">
                    <i ><img  src="//static.lotteon.com/p/product/plugin/assets/img/btn_icon_upload_camera_new.svg" alt=""></i>
                    <span >사진첨부</span>
                    <button type="button" id="btnsubmit">자료올리기</button>
            </div>
        </div>
        <div class="temp">
            <p>상세설명</p>
            <hr>
                <textarea class="summernote" name="product_info"></textarea>
        </div>

        <button type="button" id="btnsubmit2">자료올리기</button>
    </form>
</div>

<script>
    $('.summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: false,
        lang: "ko-KR",
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload: function (files) {
                /*                uploadSummernoteImageFile(files[0],this);*/
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                        this);
                }
            },
            onPaste: function (e) {
                var clipboardData = e.originalEvent.clipboardData;
                if (clipboardData && clipboardData.items && clipboardData.items.length) {
                    var item = clipboardData.items[0];
                    if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                        e.preventDefault();
                    }
                }
            }
        }
    });

    function uploadSummernoteImageFile(file, editor) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "<%=request.getContextPath()%>/uploadSummernoteImageFile.do",
            contentType: false,
            processData: false,
            enctype: 'multipart/form-data',
            success: function (data) {
                //항상 업로드된 파일의 url이 있어야 한다.
                console.log(data["url"]);
                $(editor).summernote('insertImage', data["url"]);
            },
            error: function (data) {
                console.log(data);
            }
        });
    }

    $("#btnsubmit2").click(function () {
        if(document.getElementsByName("fileload").length<1 || document.getElementsByName("fileload")[0].value == '') {
            alert("파일을 업로드 해주세요");
            document.getElementById("btnsubmit").focus();
            return;
        }
        $("#frm").submit();
    });
</script>
</body>
</html>
