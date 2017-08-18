<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发件箱 - 智游客户关系管理系统</title>
<link rel="stylesheet" href="<c:url value="/lib/font-awesome/css/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
</head>
<body>
	<div class="box">
		<h3>草稿箱</h3>
		<div class="actions">
			<form id="searchForm" action="<c:url value="/trashMail" />" method="post">
				<span>搜索内容：</span>
				<input type="text" name="trashMailKeyword" value="${ trashMailKeyword }" placeholder="请输入搜索关键词">
				&nbsp;&nbsp;&nbsp;
				<span>搜索字段：</span>
				<select name="trashMailsearchField">
					<option value="m_theme" ${ trashMailsearchField=="m_theme"?"selected":"" }>主题</option>
					<option value="m_content" ${ trashMailsearchField=="m_content"?"selected":"" }>内容</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" class="btn btn-default" value="搜索">
			</form>
			<div>
				<a class="btn btn-primary" href="<c:url value="/writeMail" />">写邮件</a>
			</div>
		</div>
		<table class="list">
            <tr>
                <th>序号</th>
                <th>发件人</th>
                <th>收件人</th>
                <th>主题</th>
                <th>发送时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="mail" items="${ list }" varStatus="status">
            <tr>
                <td>${ status.count }</td>
                <td>${ mail.sendName }</td>
                <td>${ mail.receiveName }</td>
                <td>
	                <a title="查看详情" href="<c:url value="/detailMail?id=" />${mail.m_id}" >
	                	${ mail.m_theme }
	                </a>
                </td>
                <td>
                	<fmt:formatDate value="${mail.m_sendtime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
                <td>
                	<a class="fa fa-remove" title="删除" href="javascript:confirmDelete(${mail.m_id},${mail.m_sendid })"></a>
                </td>
            </tr>
            </c:forEach>
            <c:if test="${empty list}">
    		<tr>
    			<td colspan="5">
    				没有邮件..
    			</td>
    		</tr>
    		</c:if>
        </table>
       <%--  <%@ include file="/WEB-INF/page/page.jsp"  %> --%>
	</div>
	<script>
    	function confirmDelete(mailid,sendid){
    		if (confirm("确定要删除码？")) {
    			if(sendid == "${user.u_id}"){
    				location.href = '<c:url value="/deleteMail?status=m_sendstatus=4&id=" />' + mailid
    			}else{
    				location.href = '<c:url value="/deleteMail?status=m_receivestatus=4&id=" />' + mailid
    			}
    			
    		}
    	}
    </script>
</body>
</html>