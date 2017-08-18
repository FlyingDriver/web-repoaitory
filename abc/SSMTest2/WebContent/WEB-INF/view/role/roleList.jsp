<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色管理 - 智游客户关系管理系统</title>
<link rel="stylesheet" href="<c:url value="/lib/font-awesome/css/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
</head>
<body>
	<div class="box">
		<h3>角色管理</h3>
		<div class="actions">
			<form></form>
			<div>
				<a class="btn btn-primary" href="<c:url value="/addRole" />">添加角色</a>
			</div>
		</div>
		<table class="list">
            <tr>
                <th>序号</th>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="role" items="${ list }" varStatus="status">
            <tr>
                <td>${ status.count }</td>
                <td>${ role.r_name }</td>
                <td>${ role.r_desc }</td>
                <td>
                	<fmt:formatDate value="${role.r_updatetime}" type="both" pattern="MM-dd HH:mm"/>
                </td>
                <td>
                	<a class="fa fa-pencil" title="编辑" href="<c:url value="/updateRole?id=${role.r_id}" />"></a>
                	&nbsp;&nbsp;
                	<a class="fa fa-remove" title="删除" href="<c:url value="/deleteRole?id=${role.r_id}" />"></a>
                </td>
            </tr>
            </c:forEach>
        </table>
	</div>
</body>
</html>