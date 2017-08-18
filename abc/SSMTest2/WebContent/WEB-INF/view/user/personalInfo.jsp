<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/lib/font-awesome/css/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
</head>
<body>
<table class="list">
            <tr>
                <th>ID</th>
                <th>头像</th>
                <th>用户名</th>
                <th>部门</th>
                <th>角色</th>
                <th>手机号</th>
                <th>邮箱</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
         <%--    <c:forEach var="user" items="${list }" varStatus="status"> --%>
            <tr>
                <td>${user.uId }</td>
                <td><img alt="四娃烧烤店" src="/pic/${user.uPicname}" width="100px"></td>
                <td>
	                <a title="查看详情" href="<c:url value="/userInfo?id=${user.uId }" />" >${user.uName }</a>
                </td>
             <%--    <td>${user.departmentName }</td> --%>
                <%-- <td>${user.roleName }</td> --%>
                <td>${user.uPhone }</td>
                <td>${user.uMail }</td>
                <td>
                	<fmt:formatDate value="${user.uUpdatetime }" type="both" pattern="MM-dd HH:mm"/>
                </td>
                <td>
                	<a class="fa fa-pencil" title="编辑"   href="<c:url value="/updateUser.action?id=${user.uId }"/>"></a>
                	&nbsp;&nbsp;
                	<a class="fa fa-remove" title="删除" href="<c:url value="/deleteUser.action?id=${user.uId }"/>"></a>
                </td>
            </tr>
         <%--    </c:forEach> --%>
        </table>
</body>
</html>