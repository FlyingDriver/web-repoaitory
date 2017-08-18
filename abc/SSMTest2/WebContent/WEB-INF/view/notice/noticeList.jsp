<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通知公告 - 智游客户关系管理系统</title>
<link rel="stylesheet" href="<c:url value="/lib/font-awesome/css/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<script type="text/javascript">
function confirmDelete(id){

	if(confirm("你确定删除么?")){
		//两种写法都可以
		 location.href = "${pageContext.request.contextPath}/deleteNotice?id="+id;
		//location.href = "<c:url value='/deleteNotice?id=' />"+id;
	}
}
</script>
</head>
<body>
	<div class="box">
		<h3>通知公告</h3>
		<div class="actions">
			<form id="searchForm" action="<c:url value="/noticeList" />" method="post">
				<span>搜索内容：</span>
				<input type="text" name="noticeKeyWord" value="${ noticeKeyWord }" placeholder="请输入搜索关键词">
				&nbsp;&nbsp;&nbsp;
				<span>搜索字段：</span>
				<select name="noticeSearchField">
					<option value="n_theme" ${ noticeSearchField=="n_theme"?"selected":"" }>主题</option>
					<option value="n_content" ${ noticeSearchField=="n_content"?"selected":"" }>内容</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" class="btn btn-default" value="搜索">
			</form>
		     <div>
				<a class="btn btn-primary" href="<c:url value="/addNotice" />">发布公告</a>
			</div>
		</div>
		<table class="list">
            <tr>
                <th>序号</th>
                <th>公告人</th>
                <th>公告主题</th>
                <th>通知范围</th>
                <th>公告内容</th>
                <th>公告时间</th>
                <th>截止时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="notice" items="${list }" varStatus="status">
            <tr>
                <td>${ status.count }</td>
                <td>${ notice.u_name }</td>
                <td>${ notice.n_theme }</td>
                <td>${ notice.n_departmentid==0?"全部":notice.d_name}</td>
                <td>
                	<a title="查看详情" href="<c:url value="/noticeInfo?id=${notice.n_id}" />" >
                	<c:choose> 
				     	<c:when test="${fn:length(notice.n_content) > 25}"> 
				      		${ fn:substring(notice.n_content, 0, 25) }...
				     	</c:when> 
				     	<c:otherwise> 
				      		${notice.n_content}
				     	</c:otherwise>
				    </c:choose>
                	</a>
                </td>
                <td>
                	<fmt:formatDate value="${notice.n_begintime}" type="both" pattern="MM-dd HH:mm"/>
                </td>
                <td>
                	<fmt:formatDate value="${notice.n_endtime}" type="both" pattern="MM-dd HH:mm"/>
                </td>
                <td>
                	<a class="fa fa-pencil" title="编辑" href="<c:url value="/updateNotice?id=" />${notice.n_id}"></a>
                	&nbsp;&nbsp;
                	<a class="fa fa-remove" title="删除" href="javascript:confirmDelete(${notice.n_id})"></a>
                </td>
            </tr>
            </c:forEach>
        </table>
       <%--  <%@ include file="/WEB-INF/page/page.jsp"  %> --%>
	</div>
</body>
</html>