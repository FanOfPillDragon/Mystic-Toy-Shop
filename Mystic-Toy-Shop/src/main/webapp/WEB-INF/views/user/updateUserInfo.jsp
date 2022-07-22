<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-22
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>회원정보수정</h1>
<div>
    <c:choose>
        <c:when test="${sessionScope.userLogin.user_kakao_identifier eq 0}">
            <div>
                <form action="updateUserInfoAf.do" method="post">
                    이름 : <input type="text" name="userName" value="${sessionScope.userLogin.user_name}">
                    전화번호 : <input type="text" name="userPhone" value="${sessionScope.userLogin.user_phone}">
                    비밀번호 : <input id="user_password" type="password" name="userPassword" value="${sessionScope.userLogin.user_password}">
                    <p id="pwCheck" style="font-size: 12px; width: 420px; padding-left: 15px; display: none; justify-content: start"></p>
                    <input type="submit" value="변경하기">
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <div>
                <form action="updateUserInfoAf.do" method="post">
                    이름 : <input type="text" name="userName" value="${sessionScope.userLogin.user_name}">
                    전화번호 : <input type="text" name="userPhone" value="${sessionScope.userLogin.user_phone}">
                    <input type="submit" value="변경하기">
                </form>
            </div>
        </c:otherwise>
    </c:choose>
    <a href="deleteUserInfo.do">탈퇴하기</a>
</div>
<script>
    $(function () {
        $("#user_password").change(function (e) {
            const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
            let isRightPw = regex.test(e.target.value);
            if (isRightPw) {
                $("#pwCheck").css("color", "#0000ff");
                $("#pwCheck").css("display", "inline-block");
                $("#pwCheck").html('사용할 수 있는 pw 입니다.');
                isSPw = true;
            } else {
                $("#pwCheck").css("color", "#ff0000");
                $("#pwCheck").css("display", "inline-block");
                $("#pwCheck").html('비밀번호 양식이 일치하지 않습니다');
                $("#user_password").val("");
                isSPw = false;
            }
        });
    });
</script>
</body>
</html>
