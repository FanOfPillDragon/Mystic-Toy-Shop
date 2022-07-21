<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.QnaListDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<QnaListDto> qnas = (List<QnaListDto>)request.getAttribute("qnas");
    System.out.println(qnas.get(0).toString());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:forEach var="qna" items="${qnas}">
        <c:set var="deleted" value="${qna.is_deleted}" />
        <c:set var="secret" value="${qna.is_secret}" />
        <h3><c:out value="${qna.qna_title}"/></h3>
        <p><c:out value="${qna.qna_content}"/></p>
        <p><c:out value="${qna.qna_register_date}"/></p>
        <!--<c:if test="${deleted eq '0'}">  삭제 체크 -->

        <!-- </c:if> -->
    </c:forEach>

</div>
</body>
</html>
