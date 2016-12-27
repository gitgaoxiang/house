<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="/WEB-INF/views/tags/tags.jsp"%>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.min.js "></script>
<html lang="en">


<!-- Mirrored from www.zi-han.net/theme/hplus/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:49 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>ninezero</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<link href="css/login.min.css" rel="stylesheet">
<style>
input,img{vertical-align:middle;}
/* 
dl{clear:left;}
dt,dd{float:left;} */

</style>



</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>[ oms ]</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						欢迎使用 <strong>ninezero后台登陆系统</strong>
					</h4>
					<ul class="m-b">
						<li>&nbsp;</li>
						<li>一、该系统用于易速借贷的审核、与信息查看</li>
						<li>二、oms系统用于易速借贷app后台管理</li>
						<li>三、快速、敏捷</li>
						<li>&nbsp;</li>
					</ul>
					<strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
				</div>
			</div>
			<div class="col-sm-5">
				<form method="post" action="#">
					<h4 class="no-margins">登录：</h4>

							<input id="userName" class="form-control uname"
								onFocus=" if(this.value=='输入用户名登录'||this.value=='密码错误'||this.value=='用户名不存在'||this.value=='验证码不正确') this.value=''"
								onBlur="if(this.value=='') this.value='输入用户名登录'" value=""
								type="text"/>
							<input id="userPwd" class="form-control pword m-b"
								type="password"/>
					
					         <div style="float:left;margin-top:-15px">
							<input style="width:140px; " type="text" id="captcha" class="form-control text"/>
							</div>
							<div style="margin-left:10px;float:left;">
							<img id="captchaImage"  src="" />
							</div>
							<div style="clear:both;"></div>
					
							<div class="mb2" onclick="javascript:login();">
								<a class="btn btn-success btn-block" style="color: #FFFFFF">登录</a>
							</div>
					
				</form>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">
				&copy; 2016 All Rights Reserved. <a href="http://www.ninezero.cc/"
					target="_blank" style="color: #CD4555;">ninezero</a>工作室
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function login() {

    var userName = $('#userName').val();
    var userPwd = $('#userPwd').val();
    var captcha =$('#captcha').val();
    if(userName.trim().length==0||userName.trim()=="输入用户名登录"){
      $('#userName').focus();
      $('#userName').val("请输入用户名！");
      return;
    }
    if(userPwd.trim().length==0){
     
      $('#userPwd').focus();
      return;
    }
     $.ajax({
      url : '<%=basePath%>doLogin.do',
      method : 'POST',
      dataType: "json",
      data : {
        userName : $('#userName').val(),
        userPwd : $('#userPwd').val(),
        captcha : $('#captcha').val()
      },
      success : function(response) {
        if (response.success) {
          if (response.isLoginSuccess) {
        
              window.location.href = "<%=basePath%>index.do";

							} else {
								if (response.message != null
										&& response.message != '') {

									$('#userName').val(response.message);
								}
							}
						}
					}
				});

	}

	// 更换验证码
	$('#captchaImage').click(
			function() {
				$('#captchaImage').attr("src",
						"captcha.do?timestamp=" + (new Date()).valueOf());
			});

	document.getElementById('captchaImage').click();
</script>

</html>
