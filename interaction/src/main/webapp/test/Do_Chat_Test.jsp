<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
边看边聊：<br/>
<form action="/interaction-service-3.0.0/chat">
	<table>
	<tr>
		<td>username：</td><td><input type="text" name="userName" value="test"/></td>
	</tr>
	<tr>
		<td>contId：</td><td><input type="text" name="contId" value="1"/></td>
	</tr>
	<tr>
		<td>nodeId：</td><td><input type="text" name="nodeId" value="1"/></td>
	</tr>
	<tr>
		<td>client：</td><td><input type="text" name="client" value="iphone"/></td>
	</tr>
	<tr>
		<td>content：</td><td><input type="text" name="content" value="iphone"/></td>
	</tr>
	<tr>
		<td>isLive：</td><td><input type="text" name="isLive" value="true"/></td>
	</tr>
	<tr>
		<td>createTime：</td><td><input type="text" name="createTime" value="2012-08-28 10:20:05"/></td>
	</tr>
	<tr>
		<td>返回类型：</td><td><input type="text" name="resultType" value="json"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>