<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>


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
        margin-right: calc((var(--actual-width) - 100%) * -0.5);
        margin-left: calc((var(--actual-width) - 100%) * -0.5);
    }

    #footer {
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
        align-items: center;
        position: relative;
        font-size: 0;
        text-align: left;
        border-bottom: solid 1px #d7d7d7;
        width: 100%;
    }

    #footer .footerTopMenu > ul {
        display: inline-block;
        padding: 20px 0;
        overflow: hidden;
        list-style: none;
    }


    #footer .footerTopMenu > ul li {
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
        height: 65px;
        vertical-align: middle;
    }

    #footer .companyInfo .infoWrapper {
        float: left;
        width: calc(100% - 234px);
        display: flex;
        justify-content: space-between;
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
        width: calc(100% - 500px);
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


    #footer a {
        color: #757575;
        text-decoration: none;
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

    .footerWrapper {
        padding-top: 30px;
        background-color: #f8f8f8;
    }

    .innerContent {
        max-width: 1140px;
        margin-right: auto;
        margin-left: auto;
    }

    button{
        border: none;
    }
</style>

<div class="footerWrapper">
    <div>
        <div class="companyInfo innerContent">
            <h2 class="logoArea toysrus">
                <img alt="ToysRus" border="0" height="78" hspace="0"
                     src="<%=request.getContextPath()%>/resources/images/logo6_trans.png">
            </h2>
            <div class="infoWrapper">
                <div class="company">
                    <h3>????????? ????????????</h3>
                    <ul>
                        <li>???????????? : ?????????, ?????????, ?????????, ?????????, ?????????, ?????????</li>
                        <li>?????? : ??????????????? ????????? ???????????? 300 ?????????????????? 26???</li>
                        <li>????????????????????? : 529-85-00774(?????????(???) e??????????????????)</li>
                        <li>??????????????? ?????? : ???????????? ???0158???
                            <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5298500774" target="_blank"
                               title="??????">????????? ?????? ??????</a>
                        </li>
                        <li>????????? ?????????????????? : ?????????(???) e??????????????????</li>
                    </ul>
                    <h4>????????? e????????? ????????? ????????????</h4>
                    <p>???????????? ??????????????? ?????? ?????? ????????? ?????? ??? ???????????? ????????? ??????<br>
                        ????????? ?????? ?????? ???????????? ???????????????.</p>
                </div>
                <div class="customer">
                    <h3>???????????? 1999-7231(??????)</h3>
                    <div class="stringLine withList" style="margin-bottom: 5px;">
                        <div class="v-popover">
                            <div aria-describedby="popover_snw30g5r64" class="trigger"
                                 style="display: inline-block;">
                                <button class="tooltip-target"
                                        style="text-indent: 0px; text-decoration: underline; color: rgb(117, 117, 117);">
                                    ??????????????????
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="stringLine withList">
                        <ul class="faqListWrap" style="padding-legt:0px;">
                            <li><a href="/p/customer/customerCenter/customerFaqFalg/LTON">FAQ ??????</a></li>
                            <li><a href="/p/customer/customerCenter/customerOneTone">1:1 ????????????</a></li>
                            <li><a href="/p/customer/customerCenter/customerMain">????????????</a></li>
                        </ul>
                    </div>
                    <h3 style="padding-top: 0;">?????????????????? ?????? ??????</h3>
                    <div class="stringLine withList">
                        <p>Tel : 1899-7000(??????)</p>
                        <p>E-mail : <a href="mailto:hazel@hazel.net">hazel@hazel.net</a></p>
                        <p><a href="/p/trustsafety/main" target="_blank">??????????????????</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="footerInfo">
        <p>Copyright ?? HAZELSHOPPING Co., LTD. All rights reserved.</p>
    </div>
</div>