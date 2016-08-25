<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
用户名登陆：<br/>
<form action='<c:url value="/interaction?method=login" />' method="post">
	<table>
	<tr>
		<td>用户名：</td><td><input type="text" name="name" value="18855173460"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>密    码：</td><td><input type="password" name="password" value="123456"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td>平台编号：</td><td><input type="text" name="platform" value="0002"/><font color="red">*</font></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>
<!-- 手机号码登陆：<br/> -->
<%-- <form action='<c:url value="login" />' method="post"> --%>
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 		<td>手机号码：</td><td><input type="text" name="mobile" value="18855173460"/></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>密    码：</td><td><input type="text" name="password" value="123456"/></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>平台编号：</td><td><input type="text" name="platform" value="0001"/></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td></td><td><input type="submit" value="提交"/></td> -->
<!-- 	</tr> -->
<!-- 	</table> -->
<!-- </form> -->
</body>
</html>