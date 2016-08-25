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
<form action="/interaction-service-3.0.0/chatList">
	<table>
	<tr>
		<td>contId：</td><td><input type="text" name="contId" value="1"/></td>
	</tr>
	<tr>
		<td>nodeId：</td><td><input type="text" name="nodeId" value="1"/></td>
	</tr>
	<tr>
		<td>isLive：</td><td><input type="text" name="isLive" value="true"/></td>
	</tr>
	<tr>
		<td>limit：</td><td><input type="text" name="limit" value="10"/></td>
	</tr>
	<tr>
		<td>createTime：</td><td><input type="text" name="date"/></td>
	</tr>
	<tr>
		<td>isGt：</td><td><input type="text" name="isGt" value="true"/></td>
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