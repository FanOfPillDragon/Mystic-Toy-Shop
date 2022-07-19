<%@ page import="lotte.com.toy.dto.FileDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.service.FileService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: haehu
  Date: 2022-07-19
  Time: 오전 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
    List<FileDto> fileList = (List<FileDto>)request.getAttribute("fileList");
    pageContext.setAttribute("fileList", fileList);

%>--%>

<html>
<head>
    <title>file</title>
</head>
<body>
<%--fileList : <%=pageContext.getAttribute("fileList")%>--%>
<div>
    <c:forEach var="dto" items="${fileList}">
        <div><c:out value="${dto.file_id}"/></div>
        <div>${dto.file_original_name}</div>
        <div>${dto.file_name}</div>
        <div>${dto.file_where_use}</div>
        <div>${dto.file_use_id}</div>
    </c:forEach>
</div>
<div>
    <c:forEach var="dto" items="${fileListByFileWhereUse}">
        <div><c:out value="${dto.file_id}"/></div>
        <div>${dto.file_original_name}</div>
        <div>${dto.file_name}</div>
        <div>${dto.file_where_use}</div>
        <div>${dto.file_use_id}</div>
    </c:forEach>
</div>
<%--<form action="getfile.do" name="fileForm" id="frm" method="post" enctype="multipart/form-data">
    <input type="text" name="file_where_use" value="1">
    <input type="text" name="file_use_id"    value="1">
    <button type="button">자료올리기</button>
</form>--%>
</body>
<script>
/*    $("button").click(function () {
        $("#frm").submit();
    });*/
</script>
</html>
