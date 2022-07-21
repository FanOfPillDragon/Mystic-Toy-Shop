<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>


<style>

    footer {
        display: block;
        margin: 0;
        padding: 0;
        border: 0;
        font: inherit;
        vertical-align: baseline;
        widows: 1;
    }

    ol, ul {
        list-style: none;
    }

    ul {
        display: block;
        list-style-type: disc;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }

    .wideArea {
        position: relative;
        margin-right: calc((var(--actual-width) - 100%)*-0.5);
        margin-left: calc((var(--actual-width) - 100%)*-0.5);
    }

    #footer {
        background-color: #f8f8f8;
        text-align: center;
        font-size: 0;
    }

    #footer .footerTopMenu {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        position: relative;
        font-size: 0;
        text-align: left;
    }

    #footer .footerTopMenu>ul {
        display: inline-block;
        padding: 20px 0;
        overflow: hidden;
        list-style: none;
    }


    #footer .footerTopMenu>ul li {
        position: relative;
        float: left;
        padding-left: 19px;
        font-size: 13px;
        line-height: 1.64;
        letter-spacing: -.3px;
        color: #333;
    }

    .companyInfo {
        padding-bottom: 40px;
    }

    #footer .companyInfo {
        display: inline-block;
        width: 100%;
        padding-top: 30px;
        padding-bottom: 30px;
        font-size: 0;
        color: #757575;
        text-align: left;
    }

    #footer .companyInfo .logoArea.toysrus {
        padding-top: 0;
    }

    #footer .companyInfo .logoArea {
        float: left;
        width: 234px;
        padding-top: 4px;
    }

    #footer .companyInfo .logoArea img {
        width: auto;
        height: 36px;
        vertical-align: middle;
    }

    #footer .companyInfo .infoWrapper {
        float: left;
        width: calc(100% - 234px);
    }

    #footer .companyInfo .infoWrapper .company {
        float: left;
        width: 384px;
    }

    #footer .companyInfo .infoWrapper .company h3 {
        padding-bottom: 5px;
        font-size: 14px;
        font-weight: 700;
        line-height: 1.64;
        letter-spacing: -.3px;
        color: #333;
    }

    #footer .companyInfo .infoWrapper .company li {
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .company h4 {
        padding-top: 16px;
        padding-bottom: 4px;
        font-size: 12px;
        font-weight: 700;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .company p {
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: normal;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .customer {
        float: left;
        width: calc(100% - 384px);
    }

    #footer .companyInfo .infoWrapper .customer h3 {
        padding-top: 16px;
        padding-bottom: 4px;
        font-size: 12px;
        font-weight: 700;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine.withList {
        max-width: 100%;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine {
        max-width: 418px;
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine.withList {
        max-width: 100%;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine {
        max-width: 418px;
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine .faqListWrap {
        margin-top: 0;
        margin-left: 0;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine ul {
        display: inline-block;
        margin-top: -4px;
        margin-left: 8px;
        font-size: 0;
        vertical-align: bottom;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine ul li {
        display: inline-block;
        height: 22px;
        padding: 0 6px;
        margin-right: 4px;
        font-size: 11px;
        line-height: 22px;
        letter-spacing: -.1px;
        text-align: center;
        color: #757575;
        border-radius: 2px;
        border: 1px solid #ddd;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine ul li a {
        color: inherit;
    }

    #footer .companyInfo .infoWrapper .customer h3 {
        padding-top: 16px;
        padding-bottom: 4px;
        font-size: 12px;
        font-weight: 700;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine.withList {
        max-width: 100%;
    }

    #footer .companyInfo .infoWrapper .customer .stringLine {
        max-width: 418px;
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
    }


    #footer .companyInfo .infoWrapper .customer .stringLine.withList p {
        display: block;
    }

    #footer .footerInfo {
        padding: 20px 0;
        font-size: 12px;
        line-height: 1.58;
        letter-spacing: -.2px;
        color: #757575;
        text-align: center;
    }
</style>
<%--<footer class="container-fluid navbar-fixed-bottom mt-auto mx-0"
        style="text-align: center; background-color: #f8f8f8; height:100%;">
    <hr class="mx-0" style="margin-top: 0px;" />
    <div class="m-0 pb-1">@ 2022 All Rights Reserved By Mystic-Toy-Shop </div>

</footer>--%>

<footer id="footer" class="wideArea withSeller toysrus">
    <div style="padding-left: 30px;">
        <div class="footerTopMenu innerContent">
            <ul>
                <li>
                    <a href="http://toysrus.lottemart.com/intro/toysrusIntro.do" target="_blank" title="새창">토이저러스 소개</a>
                </li>
                <li>
                    <a href="/p/lotteplus/offlinestore/offLineStoreInfo?mall_no=9">지점안내</a>
                </li>
                <li>
                    <a href="/common/footerTerms">이용약관</a>
                </li>
                <li>
                    <a href="/p/common/footerElectronicFinance">전자금융거래약관</a>
                </li>
                <li class="bold">
                    <a href="/common/footerPinfop">개인정보처리방침</a>
                </li>
                <li>
                    <a href="/common/footerYth">청소년보호방침</a>
                </li>
                <li>
                    <a href="/p/member/lotteGroupStaff/reg">임직원등록</a>
                </li>
            </ul>
            <div class="familySite">
            </div>

        </div>
        <hr>
        <div class="companyInfo innerContent">
            <h2 class="logoArea toysrus">
                <img alt="ToysRus" border="0" height="78" hspace="0" src="https://contents.lotteon.com/ec/public/injectImage.20200228113625.1.png">
            </h2>
            <div class="infoWrapper">
                <div class="company">
                    <h3>롯데쇼핑 주식회사</h3>
                    <ul>
                        <li>대표이사 : 김사무엘상현, 정준호, 강성현</li>
                        <li>주소 : 서울특별시 송파구 올림픽로 300 롯데월드타워 26층</li>
                        <li>사업자등록번호 : 529-85-00774(롯데쇼핑(주) e커머스사업부)</li>
                        <li>통신판매업 신고 : 서울송파 제0158호
                            <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5298500774" target="_blank" title="새창">사업자 정보 확인</a>
                        </li>
                        <li>호스팅 서비스사업자 : 롯데쇼핑(주) e커머스사업부</li>
                    </ul>
                    <h4>롯데쇼핑 e커머스 사업부 에스크로</h4>
                    <p>고객님의 안전거래를 위해 현금 등으로 결제 시 결제금액 전액에 대해<br>
                        소비자 피해 방지 서비스를 이용합니다.</p>
                </div>
                <div class="customer">
                    <h3>고객센터 1899-7000(유료)</h3>
                    <div class="stringLine withList" style="margin-bottom: 5px;">
                        <div class="v-popover">
                            <div aria-describedby="popover_snw30g5r64" class="trigger" style="display: inline-block;">
                                <button class="tooltip-target" style="text-indent: 0px; text-decoration: underline; color: rgb(117, 117, 117);">분쟁처리절차</button>
                            </div>
                        </div>
                    </div>

                    <div class="stringLine withList">
                        <ul class="faqListWrap" style="padding-legt:0px;">
                            <li><a href="/p/customer/customerCenter/customerFaqFalg/LTON">FAQ 보기</a></li>
                            <li><a href="/p/customer/customerCenter/customerOneTone">1:1 문의하기</a></li>
                            <li><a href="/p/customer/customerCenter/customerMain">고객센터</a></li></ul>
                    </div>
                    <h3 style="padding-top: 0;">전자금융거래 분쟁 담당</h3>
                    <div class="stringLine withList">
                        <p>Tel : 1899-7000(유료)</p>
                        <p>E-mail : <a href="mailto:lotteon@lotte.net">lotteon@lotte.net</a></p>
                        <p><a href="/p/trustsafety/main" target="_blank">안전거래센터</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="footerInfo">
        <p>Copyright © LOTTESHOPPING Co., LTD. All rights reserved.</p>
    </div>

</footer>