<%--
  Created by IntelliJ IDEA.
  User: BTC-N15
  Date: 2022-07-18
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userLogin</title>
</head>
<body>
<h1>userLogin</h1>
<form action="<%=request.getContextPath() %>/userLoginAf.do" method="post">
    이메일 : <input type="text" name="user_email"> <br>
    비밀번호 : <input type="password" name="user_password"> <br>
    <input type="submit" value="로그인">
</form>
</body>
</html>
