<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userLogin</title>
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

        .saveId{
            display: flex;
            align-items: center;
        }

        .btnSignupWrap{
            display: flex;
            align-items: center;
        }

        #registerBtn{
            color: #999;
            background-color: transparent;
            font-size: 13px;
            border: none;
        }

        .kakaoLogin{
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
    <div id="loginBox">
        <div class="title">로그인</div>
        <div class="inputSet login">
            <div>
                <input type="text" placeholder="이메일 아이디"></div>
            <div>
                <input type="password" placeholder="8자리 이상 영문+숫자+특수문자 조합"></div>
        </div>
        <div class="confirmWarp">
            <button id="loginBtn" onclick="">로그인하기</button>
        </div>
        <div class="autoLogin">
            <div class="saveId">
                <input type="checkbox" checked="checked">아이디 저장
            </div>
            <div class="btnSignupWrap">
                <button id="registerBtn">회원가입</button>
            </div>
        </div>

        <div class="socialSignupWrap">
            <button class="kakaoLogin" onclick="">카카오로 시작하기</button>
        </div>
    </div>
</div>
<h1>userLogin</h1>
<form action="<%=request.getContextPath() %>/userLoginAf.do" method="post">
    <input type="submit" value="로그인">
</form>
</body>
</html>
