<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value='/interaction?method=addPlayHistory'/>" method="post">
	<table>
	<tr>
		<td>手机号码：</td><td><input type="text" name="mobile" value="13482369449"/></td>
	</tr>
	<tr>
		<td>平台编号：</td><td><input type="text" name="platform" value="0001"/></td>
	</tr>
	<tr>
		<td>用户ID：</td><td><input type="text" name="userId" value="15"/></td>
	</tr>
	<tr>
		<td>父节点ID：</td><td><input type="text" name="parentId" value="111"/></td>
	</tr>
	<tr>
		<td>内容ID：</td><td><input type="text" name="contId" value="111"/></td>
	</tr>
	<tr>
		<td>总时长：</td><td><input type="text" name="totalTime" value="111"/></td>
	</tr>
	<tr>
		<td>当播放时间：</td><td><input type="text" name="currTime" value="111"/></td>
	</tr>
	<tr>
		<td>播放类型：</td><td><input type="text" name="playType" value="1"/></td>
	</tr>
	<tr>
		<td>栏目ID：</td><td><input type="text" name="nodeId" value="13482369449"/></td>
	</tr>
	<tr>
		<td>华为ID：</td><td><input type="text" name="hwId" value="0"/></td>
	</tr>
	<tr>
		<td>节目标题ID：</td><td><input type="text" name="contNameuic-ser" value="0"/></td>
	</tr>
	<tr>
		<td>udId：</td><td><input type="text" name="udId" value="0"/></td>
	</tr>
	<tr>
		<td>limit：</td><td><input type="text" name="limit" value="100"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>