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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    <div class="searchAddress">
        <div>
            <input id="user_zipcode" name="userZipcode" type="text" readonly
                   placeholder="우편번호" onclick="findAddr()">
        </div>
        <div>
            <input id="user_address" name="userAddress" type="text" readonly
                   placeholder="주소" onclick="findAddr()">
        </div>
        <input type="text" id="user_detail_address" name="user_detail_address"
               placeholder="상세주소">
        <button type="button" onclick="findAddr()"> 주소 검색</button>
    </div>
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

    function findAddr() {
        new daum.Postcode({
            oncomplete: function (data) {
                console.log(data);
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let roadAddr = data.roadAddress; // 도로명 주소 변수
                let jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_zipcode').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("user_address").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("user_address").value = jibunAddr;
                }
            }
        }).open();
    }

    const userSignup = document.getElementById("userSignup");
    document.getElementById("submitBtn").addEventListener("click", function () {
        const user_name = document.getElementById("user_name");
        const user_zipcode = document.getElementById("user_zipcode");
        let user_address = document.getElementById("user_address");
        const user_detail_address = document.getElementById("user_detail_address");
        const user_phone = document.getElementById("user_phone");

        if (!isSId) {
            alert("아이디를 확인해주세요");
        } else if (!isSPw) {
            alert("비밀번호를 확인해주세요");
        } else if (user_name.value === '') {
            alert("이름을 확인해주세요");
        } else if (user_zipcode.value === '') {
            alert("주소번호를 입력해주세요");
        } else if (user_address.value === '') {
            alert("주소를 입력해주세요");
        } else if (user_phone.value === '') {
            alert("핸드폰 번호를 입력해주세요");
        }
        /*      사업자번호 유효성체크
                핸드폰번호 유효성체크*/
        else {
            user_address.value = (user_address.value + " " + user_detail_address.value); // 주소 합치기
            alert("회원가입에 성공하였습니다.");
            userSignup.submit()   // 회원가입 성공
        }
    })
</script>
</body>
</html>
