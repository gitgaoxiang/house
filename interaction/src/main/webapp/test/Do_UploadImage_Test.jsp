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
上传图像：<br/>
<form action="<c:url value='/interaction?method=uploadImage'/>" method="post">
	<table>
	<tr>
		<td>用户名：</td><td><input type="text" name="loginName" value="tony_hychen@126.com"/></td>
	</tr>
	<tr>
		<td>文件路径：</td><td><input type="text" name="filePath" value="/temp/temp1234.jpg"/></td>
	</tr>
	<tr>
		<td>返回类型：</td><td><input type="text" name="resultType" value="json"/></td>
	</tr>
	
		<td></td><td><input type="submit" value="提交"/></td>
	</tr>
	</table>
</form>

</body>
</html>