<%@ page import="lotte.com.toy.dto.FileDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.service.FileService" %>
<%--
  Created by IntelliJ IDEA.
  User: haehu
  Date: 2022-07-19
  Time: 오전 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<FileDto> fileList = (List<FileDto>)request.getAttribute("fileList");
    pageContext.setAttribute("fileList", fileList);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
fileList : <%=pageContext.getAttribute("fileList")%>
</body>
</html>
