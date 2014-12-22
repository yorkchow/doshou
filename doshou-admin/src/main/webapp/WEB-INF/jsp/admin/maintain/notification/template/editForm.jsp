<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader/>
<div class="panel">

    <ul class="nav nav-tabs">
        <shiro:hasPermission name="maintain:notificationTemplate:create">
        <c:if test="${op eq '新增'}">
            <li ${op eq '新增' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/notification/template/create?backURL=<doshou:backURL/>">
                    <i class="icon-file-alt"></i>
                    新增
                </a>
            </li>
        </c:if>
        </shiro:hasPermission>


        <c:if test="${not empty m.id}">
            <li ${op eq '查看' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/notification/template/${m.id}?backURL=<doshou:backURL/>">
                    <i class="icon-eye-open"></i>
                    查看
                </a>
            </li>
            <shiro:hasPermission name="maintain:notificationTemplate:update">
            <li ${op eq '修改' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/notification/template/${m.id}/update?backURL=<doshou:backURL/>">
                    <i class="icon-edit"></i>
                    修改
                </a>
            </li>
            </shiro:hasPermission>

            <shiro:hasPermission name="maintain:notificationTemplate:delete">
            <li ${op eq '删除' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/notification/template/${m.id}/delete?backURL=<doshou:backURL/>">
                    <i class="icon-trash"></i>
                    删除
                </a>
            </li>
            </shiro:hasPermission>
        </c:if>
        <li>
            <a href="<doshou:backURL/>" class="btn btn-link">
                <i class="icon-reply"></i>
                返回
            </a>
        </li>
    </ul>

    <form:form id="editForm" method="post" commandName="m" cssClass="form-horizontal">

            <doshou:showGlobalError commandName="m"/>

            <form:hidden path="id"/>
            <form:hidden path="deleted"/>

            <div class="control-group">
                <form:label path="system" cssClass="control-label">所属系统</form:label>
                <div class="controls">
                    <form:select path="system" items="${notificationSystems}"></form:select>
                </div>
            </div>

            <div class="control-group">
                <form:label path="name" cssClass="control-label">模板名称</form:label>
                <div class="controls">
                    <form:input path="name" cssClass="validate[required,custom[name],ajax[ajaxNameCall]]" placeholder="不超过100个字符"/>
                </div>
            </div>

            <div class="control-group">
                <form:label path="template" cssClass="control-label">模板内容</form:label>
                <div class="controls">
                    <form:textarea path="template" cssClass="validate[required]"/>
                </div>
            </div>

            <c:if test="${op eq '新增'}">
                <c:set var="icon" value="icon-file-alt"/>
            </c:if>
            <c:if test="${op eq '修改'}">
                <c:set var="icon" value="icon-edit"/>
            </c:if>
            <c:if test="${op eq '删除'}">
                <c:set var="icon" value="icon-trash"/>
            </c:if>

            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-primary">
                        <i class="${icon}"></i>
                            ${op}
                    </button>
                    <a href="<doshou:backURL/>" class="btn">
                        <i class="icon-reply"></i>
                        返回
                    </a>
                </div>
            </div>


    </form:form>
</div>
<doshou:contentFooter/>
<script type="text/javascript">
    $(function () {
        <c:choose>
            <c:when test="${op eq '删除'}">
                //删除时不验证 并把表单readonly
                $.app.readonlyForm($("#editForm"), false);
            </c:when>
            <c:when test="${op eq '查看'}">
                $.app.readonlyForm($("#editForm"), true);
            </c:when>
            <c:otherwise>
                $.validationEngineLanguage.allRules.ajaxNameCall= {
                    "url": "${ctx}/admin/maintain/notification/template/validate",
                    extraDataDynamic : ['#id'],
                    "alertTextLoad": "* 正在验证，请稍等。。。"
                };
                $.validationEngineLanguage.allRules.name={
                    "regex": /^\w{1,100}$/,
                    "alertText": "* 必填，且不超过100个字符"
                };
                var validationEngine = $("#editForm").validationEngine();
                <doshou:showFieldError commandName="m"/>
            </c:otherwise>
        </c:choose>
    });
</script>