<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <dsform:label path="search.id_in">编号</dsform:label>
    <dsform:input path="search.id_in" cssClass="input-small" placeholder="多个使用空格分隔"/>
    &nbsp;
    <dsform:label path="search.key_like">键</dsform:label>
    <dsform:input path="search.key_like" cssClass="input-small" placeholder="模糊查询"/>

    <input type="submit" class="btn " value="查询"/>
    <a class="btn btn-link btn-clear-search">清空</a>
</form>
