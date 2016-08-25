<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<script type="text/javascript">
function dialogAjaxDone(json){

	var obj = new Function("return" + json)();

if (obj.statusCode == 200) {
      window.location.href="<%=request.getContextPath()%>/index.do";
}
if (obj.statusCode == 300) {

	document.getElementById("ts_name").innerHTML =obj.message;
	 // $('#userName').val(obj.message);
}
if (obj.statusCode == 400) {

	document.getElementById("ts_pwd").innerHTML =obj.message;
	 // $('#userName').val(obj.message);
}

}
</script>
<div class="pageContent">
	
	<form method="post" action="<%=basePath%>toSimplelogin.do" class="pageForm" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>用户名：</label>
				<input  type="text" id ="username" name="username"  size="32" class="required"/>
			   <label style="color: red;"id="ts_name"></label>
			</div>
			<div class="unit">
				<label>密码：</label>
				<input  type="password" name="passwd" onpaste="return false" size="32" class="required"/>
				<label style="color: red;"id="ts_pwd"></label>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">登录</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>

