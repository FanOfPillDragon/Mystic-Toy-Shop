<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 로그인</title>
    <style>
        #container {
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #loginBox {
            width: 500px;
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .title {
            width: 420px;
            text-align: left;
            font-size: 36px;
            margin-bottom: 20px;
        }

        .inputSet input {
            padding-left: 20px;
            margin-bottom: 10px;
            width: 420px;
            height: 50px;
            border: none;
            border-radius: 10px;
            color: #333;
            background-color: #f5f5f5;
        }

        input:focus {
            outline: none;
        }

        .confirmWarp {
            margin-bottom: 10px;
        }

        #loginBtn {
            width: 420px;
            height: 52px;
            color: white;
            background-color: #EF2A23;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 17px;
            border: none;
            border-radius: 10px;
        }

        .autoLogin {
            width: 420px;
            display: flex;
            justify-content: space-between;
            margin-bottom: 78px;
        }

        .autoLogin input {
            width: 18px;
            height: 18px;
            background-color: #EF2A23;
            margin-right: 5px;
        }

        .saveId {
            display: flex;
            align-items: center;
        }

        .btnSignupWrap {
            display: flex;
            align-items: center;
        }

        #registerBtn {
            color: #999;
            background-color: transparent;
            font-size: 13px;
            border: none;
        }

        .kakaoLogin {
            width: 420px;
            height: 52px;
            background-color: #FEE500;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div id="container">
    <form id="sellerLogin" action="<%=request.getContextPath() %>/sellerLoginAf.do" method="post">
        <div id="loginBox">
            <div class="title">관리자 로그인</div>
            <div class="inputSet login">
                <div>
                    <input type="text" id="seller_email" name="seller_email" placeholder="이메일 아이디"></div>
                <div>
                    <input type="password" id="seller_password" name="seller_password" placeholder="8자리 이상 영문+숫자+특수문자 조합"></div>
            </div>
            <div class="confirmWarp">
                <button id="loginBtn" type="button">로그인하기</button>
            </div>
            <div class="autoLogin">
                <div class="saveId">
                    <input type="checkbox" checked="checked">아이디 저장
                </div>
                <div class="btnSignupWrap">
                    <button id="registerBtn" onclick="location.href='sellerSignup.do'">회원가입</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script !src="">
    // 로그인 유효성 체크
    const sellerLogin = document.getElementById("sellerLogin");
    document.getElementById("loginBtn").addEventListener("click", function () {
        const seller_email = document.getElementById("seller_email");
        const seller_password = document.getElementById("seller_password");

        if (seller_email.value === '') {
            alert("아이디를 입력해주세요");
        } else if (seller_password.value === '') {
            alert("비밀번호를 입력해주세요");
        }
        else {
            sellerLogin.submit()   // 로그인 성공
        }
    })
</script>
</body>
</html>
