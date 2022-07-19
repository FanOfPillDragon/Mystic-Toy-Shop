<%@ page import="lotte.com.toy.dto.SellerDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%  session.removeAttribute("userLogin"); %>
<%  session.removeAttribute("sellerLogin"); %>
<c:if test="${userLogin} == null && ${sellerLogin} == null">
    <script>
    alert("로그인 해 주십시오");
    location.href = "./login.do";
    </script>
</c:if>

<script !src="">
    if(${userLogin}){
        alert("asda");
    }
    alert(${userLogin});
    console.log(12312);
</script>

<c:if test="!${userLogin}">
    <script !src="">
    </script>
</c:if>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Hello World!</h2>
${sellerLogin.auth_id}
<a href="/product_write.do">판매 상품 등록</a>
</body>
</html>
