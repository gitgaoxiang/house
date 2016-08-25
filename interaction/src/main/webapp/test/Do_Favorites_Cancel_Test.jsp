<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Collect Cancel Test</title>
</head>
<body>
取消收藏
<br>

<form action="<c:url value='/interaction?method=favoritesCancel'/>" method="post">
<table>
<tr>
<td>favoritesId</td>
<td><input id="favoritesId" name="favoritesId" type="text" value="4,5" /></td>
</tr>
	
</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>