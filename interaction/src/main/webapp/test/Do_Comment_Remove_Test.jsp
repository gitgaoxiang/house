<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
删除评论：
<form action="<c:url value='/interaction?method=commentRemove'/>" method="post">
	<table>
	<tr>
		<td>用户ID：</td><td><input type="text" name="userId" value="15"/></td>
	</tr>
	<tr>
		<td>评论ID集合：</td><td><input type="text" name="ids" value="1"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>