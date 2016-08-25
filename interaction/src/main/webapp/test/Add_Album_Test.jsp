<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Album Test</title>
</head>
<body>
添加相册-Add Album Test
<br>

<!-- 
<form action="http://192.168.0.249:8001/interaction-service-2.0.0/playTimes" method="post">
<form action="http://localhost:8080/playTimes" method="post">
<form action="http://192.168.1.249:8001/interaction-service-2.0.0/playTimes" method="get">
 -->
<form action="<c:url value='/user/addAblum.do'/>" method="post">
<table>
<tr>
<td>userId<font color="red">*</font></td>
<td><input id="userId" name="userId" type="text" value="1158" /></td>
</tr>

<tr>
<td>name</td>
<td><input id="name" name="name" type="text" value="寡人的相册" /></td>
</tr>


<tr>
<td>description</td>
<td><input id="description" name="description" type="text" value="点点滴滴，永恒记忆" /></td>
</tr>

<tr>
<td>authority:(权限值必须为：PUBLIC、PRIVATE、FRIENDONLY)</td>
<td><input id="authority" name="authority" type="text" value="PRIVATE" /></td>
</tr>

</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>