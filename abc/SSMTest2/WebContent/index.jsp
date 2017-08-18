<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录 - 客户关系管理系统</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="login">
		<img src="${pageContext.request.contextPath}/image/4.JPG" alt="github">
		<p>客户关系管理系统</p>
		<form action="${pageContext.request.contextPath}/Login.action"
			method="post">
			<div>
				<input type="text" id="username" name="name" placeholder="请输入用户名">
			</div>
			<div>
				<input type="password" id="password" name="pwd" placeholder="请输入密码">
			</div>
			<div>
				<c:if test="${result==false }">
					<a style="color: red;">帐号密码不匹配请重新输入！</a>
				</c:if>
			</div>
			<div>
				<input type="submit" value="登录">
			</div>
		</form>
	</div>
</body>
</html>