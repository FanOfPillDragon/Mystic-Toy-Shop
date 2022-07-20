<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int productId = (Integer)request.getAttribute("productId");
  System.out.println(productId);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>리뷰 작성</h1>
<div>
  <form action="/reviewAf.do">
    리뷰제목 : <input type="text" name="reviewTitle">
    리뷰내용 : <input type="text" name="reviewContent">
    평점 : <input type="text" name="reviewRate">
    <input type="hidden" name="productId" value="<%=productId%>">
    <input type="submit" value="작성하기">
  </form>
</div>
</body>
</html>
