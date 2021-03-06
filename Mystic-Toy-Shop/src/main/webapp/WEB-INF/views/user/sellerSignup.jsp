<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>sellerSignup</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        #container {
            height: 100vh;
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

        .inputSet {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

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

        .checkEmail{
            width: 420px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .checkEmail button{
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
        }

        .searchAddress{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .searchAddress button{
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
        }

        #submitBtn {
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

        .autoLogin input {
            width: 18px;
            height: 18px;
            background-color: #EF2A23;
            margin-right: 5px;
        }
    </style>
</head>
<body>

<div id="container">
    <form id="sellerSignup" action="<%=request.getContextPath() %>/addSeller.do" method="post">
        <div id="loginBox">
            <div class="title">?????? ????????????</div>
            <div class="inputSet login">
                <div>
                    <input type="text" id="seller_business_number" name="seller_business_number" placeholder="????????? ??????">
                </div>
                    <input type="text" id="seller_email" name="seller_email" placeholder="????????? ?????????">
                <div class="checkEmail">
                    <p id="idCheck" style="font-size: 12px; margin-left: 15px"></p>
                    <button type="button" id="idBtn">????????? ??????</button>
                </div>
                <div>
                    <input type="password" id="seller_password" name="seller_password"
                           placeholder="8?????? ?????? ??????+??????+???????????? ??????">
                </div>
                <p id="pwCheck" style="font-size: 12px; width: 420px; padding-left: 15px; display: none; justify-content: start"></p>
                <div>
                    <input type="text" id="seller_name" name="seller_name" placeholder="??????">
                </div>
                <div>
                    <input type="text" id="seller_phone" name="seller_phone" placeholder="????????? ??????">
                </div>
                <div>
                    <input type="text" id="seller_company_name" name="seller_company_name" placeholder="?????? ??????">
                </div>
                <div>
                    <input type="text" id="seller_company_number" name="seller_company_number" placeholder="?????? ????????????">
                </div>
                <div class="searchAddress">
                    <div>
                        <input id="seller_zipcode" name="seller_zipcode" type="text" readonly
                               placeholder="????????????"  onclick="findAddr()">
                    </div>
                    <div>
                        <input id="seller_address" name="seller_address" type="text" readonly
                               placeholder="?????? ??????"  onclick="findAddr()">
                    </div>
                    <input type="text" id="seller_detail_address" name="seller_detail_address"
                            placeholder="?????? ????????????">
                    <button type="button" onclick="findAddr()"> ?????? ??????</button>
                </div>
            </div>
            <div class="confirmWarp">
                <button type="button" id="submitBtn">????????????</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    let isSId = false;
    let isSPw = false;

    // id?????? ??????
    $(function () {
        $("#idBtn").click(function () {
            // ???????????? ???????????? ????????? ???
            if($("#seller_email").val().length == 0){
                $("#idCheck").css("color", "#ff0000");
                $("#idCheck").html('id??? ??????????????????');
                return;
            }
            $.ajax({
                type: "post",
                url: "sellerIdCheck.do",
                data: {"seller_id": $("#seller_email").val()},
                success: function (data) {
                    if (data.trim() == "YES") {
                        $("#idCheck").css("color", "#0000ff");
                        $("#idCheck").html('????????? ??? ?????? id?????????');
                        isSId = true;
                    } else {
                        $("#idCheck").css("color", "#ff0000");
                        $("#idCheck").html('?????? ?????? id?????????');
                        $("#seller_email").val("");
                        isSId = false;
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        });
    });

    // ???????????? ?????? ??????
    $(function () {
        $("#seller_password").change(function (e) {
            const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
            let isRightPw = regex.test(e.target.value);
            if (isRightPw) {
                $("#pwCheck").css("color", "#0000ff");
                $("#pwCheck").css("display", "inline-block");
                $("#pwCheck").html('????????? ??? ?????? pw ?????????.');
                isSPw = true;
            } else {
                $("#pwCheck").css("color", "#ff0000");
                $("#pwCheck").css("display", "inline-block");
                $("#pwCheck").html('???????????? ????????? ???????????? ????????????');
                $("#seller_password").val("");
                isSPw = false;
            }
        });
    });

    // ?????? ?????? ????????????
    function findAddr() {
        new daum.Postcode({
            oncomplete: function (data) {
                console.log(data);
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
                // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                let roadAddr = data.roadAddress; // ????????? ?????? ??????
                let jibunAddr = data.jibunAddress; // ?????? ?????? ??????
                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('seller_zipcode').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("seller_address").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("seller_address").value = jibunAddr;
                }
            }
        }).open();
    }

    // ????????????, ????????? ??????
    const sellerSignup = document.getElementById("sellerSignup");
    document.getElementById("submitBtn").addEventListener("click", function () {
        const seller_name = document.getElementById("seller_name");
        const seller_zipcode = document.getElementById("seller_zipcode");
        const seller_address = document.getElementById("seller_address");
        const seller_detail_address = document.getElementById("seller_detail_address");
        const seller_phone = document.getElementById("seller_phone");
        const seller_company_name = document.getElementById("seller_company_name");
        const seller_company_number = document.getElementById("seller_company_number");
        const seller_business_number = document.getElementById("seller_business_number");

        if (!isSId) {
            alert("???????????? ??????????????????");
        } else if (!isSPw) {
            alert("??????????????? ??????????????????");
        } else if (seller_name.value === '') {
            alert("????????? ??????????????????");
        } else if (seller_zipcode.value === '') {
            alert("??????????????? ??????????????????");
        } else if (seller_address.value === '') {
            alert("????????? ??????????????????");
        } else if (seller_phone.value === '') {
            alert("????????? ????????? ??????????????????");
        } else if (seller_company_name.value === '') {
            alert("???????????? ??????????????????");
        } else if (seller_company_number.value === '') {
            alert("?????? ??????????????? ??????????????????");
        } else if (seller_business_number.value === '') {
            alert("?????????????????? ??????????????????");
        }
        /*      ??????????????? ???????????????
                ??????????????? ???????????????*/
        else {
            seller_address.value = (seller_address.value + " " + seller_detail_address.value); // ?????? ?????????
            alert("??????????????? ?????????????????????.");
            sellerSignup.submit()   // ???????????? ??????
        }
    })
</script>
</body>
</html>
