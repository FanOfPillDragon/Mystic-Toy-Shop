<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productId = (Integer)request.getAttribute("productId");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Q&A 작성</h1>
<div>
    <form action="/qnaAf.do">
        Q&A제목 : <input type="text" name="qnaTitle">
        Q&A내용 : <input type="text" name="qnaContent">
        <input type="hidden" name="productId" value="<%=productId%>">
        <input type="submit" value="작성하기">
    </form>
</div>
</body>
</html>
