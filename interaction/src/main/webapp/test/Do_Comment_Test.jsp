<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Do Comment Test</title>
</head>
<body>
评论-Do Comment Test
<br>

<form action="<c:url value='/interaction?method=comment'/>" method="post">
<table>
<tr>
<td>userId</td>
<td><input id="userId" name="userId" type="text" value="15" /></td>
</tr>

<tr>
<td>email</td>
<td><input id="email" name="email" type="text" value="" /></td>
</tr>


<tr>
<td>content</td>
<td><input id="content" name="content" type="text" value="好！赞！" /></td>
</tr>

<tr>
<td>contId</td>
<td><input id="contId" name="contId" type="text" value="1" /></td>
</tr>

<tr>
<td>cpId</td>
<td><input id="cpId" name="cpId" type="text" value="" /></td>
</tr>

<tr>
<td>clientType</td>
<td><input id="clientType" name="clientType" type="text" value="0001" /></td>
</tr>

<tr>
<td>type</td>
<td><input id="type" name="type"  value="doCommentInfo" /></td>
</tr>
</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>