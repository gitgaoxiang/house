<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CommentInfo List Test</title>
</head>
<body>
评论列表-CommentInfo List Test
<br>

<form action="<c:url value='/interaction?method=commentUserList'/>" method="post">
<table>
<tr>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td>userId</td>
<td><input id="userId" name="userId" type="text" value="15" /></td>
</tr>

<tr>
<td>start</td>
<td><input id="start" name="start"  value="0" /></td>
</tr>
<tr>
<td>limit</td>
<td><input id="limit" name="limit"  value="1" /></td>
</tr>
</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>