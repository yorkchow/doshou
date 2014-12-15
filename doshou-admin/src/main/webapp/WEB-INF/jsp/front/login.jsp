<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>
<doshou:contentHeader title="用户登录" index="true"/>

<div class="container">
    <div class="login">
        <div class="title">用户登录</div>
        <div class="form">

            <div style="margin-right: 30px;">
                <doshou:showMessage></doshou:showMessage>
            </div>

            <form id="loginForm" method="post" class="form-horizontal">
                <doshou:backURL hiddenInput="true"/>
                <div class="control-group">
                    <label for="username">用户名、邮箱或手机号</label>
                    <div class="input-prepend">
                        <span class="add-on icon-user"></span>
                        <input type="text" id="username" name="username" value="${param.username}"
                               class="input-xlarge validate[required]" placeholder="请输入用户名、邮箱或手机号">
                    </div>
                </div>
                <div class="control-group">
                    <label for="password">密码</label>
                    <div class="input-prepend">
                        <span class="add-on icon-key"></span>
                        <input type="password" id="password" name="password"
                               class="input-xlarge validate[required]" placeholder="请输入密码">
                    </div>
                </div>
                <%-- jcaptchaEbabled 在JCaptchaValidateFilter设置 --%>
                <c:if test="${jcaptchaEbabled}">
                    <div class="control-group">
                        <label for="jcaptchaCode">验证码</label>
                        <div class="input-prepend">
                            <span class="add-on icon-circle-blank"></span>
                            <input type="text" id="jcaptchaCode" name="jcaptchaCode"
                                   class="input-medium validate[required,ajax[ajaxJcaptchaCall]]" placeholder="请输入验证码">
                        </div>
                        <img class="jcaptcha-btn jcaptcha-img" style="margin-left: 10px;" src="${ctx}/jcaptcha.jpg" title="点击更换验证码">
                        <a class="jcaptcha-btn btn btn-link">换一张</a>
                    </div>
                </c:if>

                <div class="control-group">
                    <label class="checkbox remember"><input type="checkbox" name="rememberMe" value="true">下次自动登录</label>
                    <input id="submitForm" type="submit" class="btn btn-login pull-left" value="登录">
                </div>

            </form>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p><a href="http://www.doshou.me" target="_blank">剁手么</a></p>
    </div>
</footer>
<doshou:contentFooter/>
<script type="text/javascript">
    $(function() {
        $("#username").focus();
        $(".jcaptcha-btn").click(function() {
            var img = $(".jcaptcha-img");
            var imageSrc = img.attr("src");
            if(imageSrc.indexOf("?") > 0) {
                imageSrc = imageSrc.substr(0, imageSrc.indexOf("?"));
            }
            imageSrc = imageSrc + "?" + new Date().getTime();
            img.attr("src", imageSrc);
        });
        $.validationEngineLanguage.allRules.ajaxJcaptchaCall={
            "url": "${ctx}/jcaptcha-validate",
            "alertTextLoad": "* 正在验证，请稍等。。。"
        };
        $("#loginForm").validationEngine({scroll:false});
    });
</script>
