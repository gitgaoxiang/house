
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
预约：<br/>
<form action="/interaction-service-3.0.0/remind">
	<table>
	<tr>
		<td>userId：</td><td><input type="text" name="userId" value="1"/></td>
	</tr>
	<tr>
		<td>userName：</td><td><input type="text" name="userName" value="tsh"/></td>
	</tr>
	<tr>
		<td>nodeId：</td><td><input type="text" name="nodeId" value="1"/></td>
	</tr>
	<tr>
		<td>nodeName：</td><td><input type="text" name="nodeName" value="iphonenode"/></td>
	</tr>
	<tr>
		<td>contentName：</td><td><input type="text" name="contentName" value="iphone"/></td>
	</tr>
	<tr>
		<td>contId：</td><td><input type="text" name="contId" value="1"/></td>
	</tr>
	<tr>
		<td>startTime：</td><td><input type="text" name="startTime" value="201209211748"/></td>
	</tr>
	<tr>
		<td>返回类型：</td><td><input type="text" name="resultType" value="xml"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>