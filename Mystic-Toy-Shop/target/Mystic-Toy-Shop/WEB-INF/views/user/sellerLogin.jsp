<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sellerLogin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>sellerLogin</h1>
<form action="<%=request.getContextPath() %>/sellerLoginAf.do" method="post">
    이메일 : <input type="text" name="seller_email"> <br>
    비밀번호 : <input type="password" name="seller_password"> <br>
    <input type="submit" value="로그인">
</form>

</body>
</html>
`