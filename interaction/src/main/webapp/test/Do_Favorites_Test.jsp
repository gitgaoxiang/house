<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Collect Test</title>
</head>
<body>
添加收藏
<br>

<form action="<c:url value='/interaction?method=favorites'/>" method="post">
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
	<td>contentId</td>
	<td><input id="contentId" name="contentId" type="text" value="" /></td>
	</tr>
	
	<tr>
	<td>nodeId</td>
	<td><input id="nodeId" name="nodeId" type="text" value="88001" /></td>
	</tr>
	
	<tr>
	<td>mainNodeId</td>
	<td><input id="mainNodeId" name="mainNodeId" type="text" value="8" /></td>
	</tr>
	
	<tr>
	<td>name</td>
	<td><input id="name" name="name" type="text" value="test" /></td>
	</tr>
	
	<tr>
	<td>clientType</td>
	<td><input id="clientType" name="clientType" type="text" value="0" /></td>
	</tr>
	
	<tr>
	<td>isLive</td>
	<td><input id="isLive" name="isLive" type="text" value="1" /></td>
	</tr>
</table>

<input type="submit" value="submit" />
<input type="reset" value="reset" />

</form>

</body>
</html>