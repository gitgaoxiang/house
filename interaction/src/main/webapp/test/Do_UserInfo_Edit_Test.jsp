<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息修改</title>
</head>
<body>
<form action='<c:url value="/interaction?method=userSave" />' method="post">
	<table>
	<tr>
		<td>用户Id：</td><td><input type="text" name="userId" value="16"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>昵称 sname：</td><td><input type="text" name="sname" value="xxx"/></td>
	</tr>
	<tr>
		<td>性别 sex：</td><td><input type="text" name="sex" value="1"/></td>
	</tr>
	<tr>
		<td>星座 constellation：</td><td><input type="text" name="constellation" value="摩羯座"/></td>
	</tr>
	<tr>
		<td>职业 profession：</td><td><input type="text" name="profession" value="程序猿"/></td>
	</tr>
	<tr>
		<td>出生日期 birthday：</td><td><input type="text" name="birthday" value="1981-12-12"/></td>
	</tr>
	<tr>
		<td>所在地 area：</td><td><input type="text" name="area" value="合肥"/></td>
	</tr>
	<tr>
		<td>个性介绍 perDesc：</td><td><input type="text" name="perDesc" value="I m a 程序猿"/></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
</body>
</html>