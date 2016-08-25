<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Album Test</title>
</head>
<body>
上传相册图片
<br>

<!-- 
<form action="http://192.168.0.249:8001/interaction-service-2.0.0/playTimes" method="post">
<form action="http://localhost:8080/playTimes" method="post">
<form action="http://192.168.1.249:8001/interaction-service-2.0.0/playTimes" method="get">
 -->
<form action="<c:url value='/interaction?method=uploadAlbumImage'/>" method="post">
<table>
<tr>
<td>userId<font color="red">*</font></td>
<td><input id="userId" name="userId" type="text" value="1158" /></td>
</tr>
<tr>
<td>albumId</td>
<td><input id="albumId" name="albumId" type="text" value="2" /></td>
</tr>
<tr>
<td>filePath<font color="red">*</font></td>
<td><input id="filePath" name="filePath" type="text" value="" /></td>
</tr>
<tr>
<td>fileSize</td>
<td><input id="fileSize" name="fileSize" type="text" value="" /></td>
</tr>

</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>