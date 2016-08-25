<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Album Test</title>
</head>
<body>
设置相册权限
<br>

<!-- 
<form action="http://192.168.0.249:8001/interaction-service-2.0.0/playTimes" method="post">
<form action="http://localhost:8080/playTimes" method="post">
<form action="http://192.168.1.249:8001/interaction-service-2.0.0/playTimes" method="get">
 -->
<form action="<c:url value='/interaction?method=setAlbumAuthority'/>" method="post">
<table>
<tr>
<td>albumId<font color="red">*</font></td>
<td><input id="albumId" name="albumId" type="text" value="5" /></td>
</tr>
<tr>
<td>authority:<font color="red">*</font>(权限值必须为：PUBLIC、PRIVATE、FRIENDONLY)</td>
<td><input id="authority" name="authority" type="text" value="PRIVATE" /></td>
</tr>
</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>


Set_Album_Authority_Test.jsp