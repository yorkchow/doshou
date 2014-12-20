<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <input type="hidden" name="search.type_eq" value="${type}">

    <dsform:label path="search.id_in">编号</dsform:label>
    <dsform:input path="search.id_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    &nbsp;
    <c:if test="${type eq 'user'}">
        <dsform:label path="search.userId_in">用户编号</dsform:label>
        <dsform:input path="search.userId_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    </c:if>
    <c:if test="${type eq 'user_group'}">
        <dsform:label path="search.groupId_in">用户组编号</dsform:label>
        <dsform:input path="search.groupId_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    </c:if>
    <c:if test="${type eq 'organization_job'}">
        <dsform:label path="search.organizationId_in">组织机构编号</dsform:label>
        <dsform:input path="search.organizationId_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
        &nbsp;
        <dsform:label path="search.jobId_in">工作职务编号</dsform:label>
        <dsform:input path="search.jobId_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    </c:if>
    <c:if test="${type eq 'organization_group'}">
        <dsform:label path="search.groupId_in">组织机构组编号</dsform:label>
        <dsform:input path="search.groupId_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    </c:if>

    <input type="submit" class="btn " value="查询"/>
    <a class="btn btn-link btn-clear-search">清空</a>
</form>
