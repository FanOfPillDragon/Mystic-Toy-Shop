<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:getAsString name="title"/></title>
    <style>
        body{
            height: 100%;
        }
        #footer{
            /*  left: 0;
             bottom: 0;
             width: 100%; */
            position: fixed;
            bottom: 0;
            width: 100%;
            margin-top: auto;
            height:50px;
        }
        .body{
            min-height: 750px;
            height:80%;
        }
    </style>
</head>
<body>

<!-- 상단 메뉴 -->
<tiles:insertAttribute name="header"/>
<!-- 상단 메뉴 끝 -->

<!-- 내용 시작 -->
<div class="body"><tiles:insertAttribute name="body"/></div>
<!-- 내용 끝 -->

<!-- 하단 부분 -->
<div id="footer" class="sticky-footer"><tiles:insertAttribute name="footer"/></div>
<!-- 하단부 끝 -->
</body>
</html>