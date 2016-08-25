<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
用户绑定：<br/>
<form action="/interaction-service-3.0.0/userBind">
	<table>
	<tr>
		<td>type：</td><td><input type="text" name="type" value="1"/></td>
	</tr>
	<tr>
		<td>name：</td><td><input type="text" name="name" value="1111111"/></td>
	</tr>
	<tr>
		<td>uid：</td><td><input type="text" name="uid" value="true"/></td>
	</tr>
	<tr>
		<td>userId：</td><td><input type="text" name="userId" value="42"/></td>
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