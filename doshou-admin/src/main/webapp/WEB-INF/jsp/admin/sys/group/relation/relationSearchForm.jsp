<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <c:if test="${group.type eq 'user'}">
        <dsform:label path="search.user.id_in">用户编号</dsform:label>
        <dsform:input path="search.user.id_in" cssClass="input-medium" placeholder="多个之间逗号分隔"/>
    </c:if>
    <c:if test="${group.type eq 'organization'}">
        <dsform:label path="search.organization.id_in">组织机构编号</dsform:label>
        <dsform:input path="search.organization.id_in" cssClass="input-medium" placeholder="多个之间逗号分隔"/>
    </c:if>

    &nbsp;&nbsp;
    <input type="submit" class="btn " value="查询"/>
</form>
