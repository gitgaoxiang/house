<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='<c:url value="/interaction?method=register" />' method="post">
	<table>
	<tr>
		<td>用户名：</td><td><input type="text" name="name" value="zhangsan"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>昵称：</td><td><input type="text" name="sname" value="zhangsan"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>平台编号：</td><td><input type="text" name="platform" value="0002"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>手机号码：</td><td><input type="text" name="mobile" value="13482369449"/></td>
	</tr>
	<tr>
		<td>密码：</td><td><input type="text" name="password" value="123456789"/><font color="red">*</font></td>
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