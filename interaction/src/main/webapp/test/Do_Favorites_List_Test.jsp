<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Collect List Test</title>
</head>
<body>
收藏列表
<br>

<form action="<c:url value='/interaction?method=favoritesList'/>" method="post">

<table>
<tr>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td>userId</td>
<td><input id="userId" name="userId" type="text" value="23" /></td>
</tr>
<tr>
<td>mainNodeId</td>
<td><input id="mainNodeId" name="mainNodeId" type="text" value="" /></td>
</tr>

</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>