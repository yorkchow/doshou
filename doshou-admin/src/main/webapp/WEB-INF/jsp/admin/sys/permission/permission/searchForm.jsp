<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <dsform:label path="search.name_like">权限名称</dsform:label>
    <dsform:input path="search.name_like" cssClass="input-medium" placeholder="模糊查询"/>
    <dsform:label path="search.permission_like">权限标识</dsform:label>
    <dsform:input path="search.permission_like" cssClass="input-small" placeholder="模糊查询"/>

    &nbsp;&nbsp;
    <input type="submit" class="btn " value="查询"/>
    <a class="btn btn-link btn-clear-search">清空</a>
</form>
