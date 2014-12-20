<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <dsform:label path="search.name_like">名称</dsform:label>
    <dsform:input path="search.name_like" cssClass="input-medium"/>
    &nbsp;&nbsp;
    <dsform:label path="search.status_eq">默认</dsform:label>
    <dsform:select path="search.defaultGroup_eq" cssClass="input-small">
        <dsform:option label="所有" value=""/>
        <dsform:options items="${booleanList}" itemLabel="info"/>
    </dsform:select>
    &nbsp;&nbsp;
    <dsform:label path="search.show_eq">有效</dsform:label>
    <dsform:select path="search.show_eq" cssClass="input-small">
        <dsform:option label="所有" value=""/>
        <dsform:options items="${booleanList}" itemLabel="info"/>
    </dsform:select>

    &nbsp;&nbsp;
    <input type="submit" class="btn " value="查询"/>
    <a class="btn btn-link btn-clear-search">清空</a>
</form>
