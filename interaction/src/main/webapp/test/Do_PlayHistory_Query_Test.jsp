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

查询播放历史：<br/>
<form action="<c:url value='/interaction?method=queryHistory'/>" method="post">
	<table>
	<tr>
		<td>用户ID：</td><td><input type="text" name="userId" value="1"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>平台编号：</td><td><input type="text" name="platform" value="0001"/></td>
	</tr>
	<tr>
		<td>起始页：</td><td><input type="text" name="start" value="0"/></td>
	</tr>
	<tr>
		<td>返回结果数：</td><td><input type="text" name="limit" value="20"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>