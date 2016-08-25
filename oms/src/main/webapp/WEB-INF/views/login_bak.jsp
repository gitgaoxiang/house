<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/tags/tags.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.min.js "></script>
<html>
<head>
<meta charset="UTF-8">
<title>登录   9Zero oms</title>

<style type="text/css">sss
*{
	margin: 0;
	padding: 0;
}
body{
	font-family: "微软雅黑";
	font-size: 14px;
	background: url(static/image/login_center.jpg) fixed center center;
}
.logo_box{
	width: 280px;
	height: 490px;
	padding: 35px;
	color: #EEE;
	position: absolute;
	left: 50%;
	top:100px;
	margin-left: -175px;
}
.logo_box h3{
	text-align: center;
	height: 20px;
	font: 20px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei",sans-serif;
	color: #FFFFFF;
	height: 20px;
	line-height: 20px;
	padding:0 0 35px 0;
}
.forms{
	width: 280px;
	height: 485px;
}
.logon_inof{
	width: 100%;
	min-height: 450px;
	padding-top: 35px;
	position: relative;
}		
.input_outer{
	height: 46px;
	padding: 0 5px;
	margin-bottom: 20px;
	border-radius: 50px;
	position: relative;
	border: rgba(255,255,255,0.2) 2px solid !important;
}
.u_user{
	width: 25px;
	height: 25px;
	background: url(static/image/login_ico.png);
	background-position:  -125px 0;
	position: absolute;
	margin: 12px 13px;
}
.us_uer{
	width: 25px;
	height: 25px;
	background-image: url(static/image/login_ico.png);
	background-position: -125px -34px;
	position: absolute;
	margin: 12px 13px;
}
.l-login{
	position: absolute;
	z-index: 1;
	left: 50px;
	top: 0;
	height: 46px;
	font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
	line-height: 46px;
}
label{
	color: rgb(255, 255, 255);
	display: block;
}
.text{
	width: 220px;
	height: 46px;
	outline: none;
	display: inline-block;
	font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
	margin-left: 50px;
	border: none;
	background: none;
	line-height: 46px;
}
/*///*/
.mb2{
	margin-bottom: 20px
}
.mb2 a{
	text-decoration: none;
	outline: none;
}
.submit {
	padding: 15px;
	margin-top: 20px;
	display: block;
}
.act-but{
	height: 20px;
	line-height: 20px;
	text-align: center;
	font-size: 20px;
	border-radius: 50px;
	background: #0096e6;
}
/*////*/
.check{
	width: 280px;
	height: 22px;
}
.clearfix::before{
	content: "";
	display: table;
}
.clearfix::after{
	display: block;
	clear: both;
	content: "";
	visibility: hidden;
	height: 0;
}
.login-rm{
	float: left;
}
.login-fgetpwd {
	float: right;
}
.check{
	width: 18px;
	height: 18px;
	background: #fff;
	border: 1px solid #e5e6e7;
	margin: 0 5px 0 0;
	border-radius: 2px;
}
.check-ok{
	background-position: -128px -70px;
	width: 18px;
	height: 18px;
	display: inline-block;
	border: 1px solid #e5e6e7;
	margin: 0 5px 0 0;
	border-radius: 2px;
	vertical-align: middle
}
.checkbox{
	vertical-align: middle;
	margin: 0 5px 0 0;
}

/*=====*/
/*其他登录口*/
.logins{
width: 280px;
height: 27px;
line-height: 27px;
float:left;
padding-bottom: 30px;
}
.qq{
	width: 27px;
	height: 27px;
	float: left;
	display: inline-block;
	text-align: center;
	margin-left: 5px;
	margin-right: 18px;
}
.wx{
	width: 27px;
	height: 27px;
	text-align: center;
	line-height: 27px;
	display: inline-block;
	margin: 5px 18px auto 5px;
}
.wx img{
	width: 16px;
	height: 16px;
	float: left;
	line-height: 27px;
	text-align: center;
}
/*////*/
.sas{
	width: 280px;
	height: 18px;
	float: left;
	color: #FFFFFF;
	text-align: center;
	font-size: 16px;
	line-height: 16px;
	margin-bottom: 50px;
}
.sas a{
	width: 280px;
	height: 18px;
	color: #FFFFFF;
	text-align: center;
	line-height: 18px;
	text-decoration: none;
}
.blur {  
    color:  red;  
}  
</style>
</head>
<body>

<div class="logo_box">
	<h3>9Zero欢迎你</h3>

	<form action="#" name="f" method="post">
		<div class="input_outer">
			<span class="u_user"></span>
			<input id="userName"  class="text" onFocus=" if(this.value=='输入用户名登录'||this.value=='密码错误'||this.value=='用户名不存在') this.value=''" onBlur="if(this.value=='') this.value='输入用户名登录'" value="loan" style="color: #FFFFFF !important" type="text">
		</div>
		<div class="input_outer">
			<span class="us_uer"></span>
			<label class="l-login login_password" style="color: rgb(255, 255, 255);display: block;"></label>
			<input id="userPwd" class="text" onFocus="if(this.value=='') this.value=''" onBlur="if(this.value=='') this.value=''" value="" style="color: #FFFFFF !important; position:absolute; z-index:100;"  type="password">
		</div>
		<div class="mb2" onclick="javascript:login();"><a class="act-but submit" href="javascript:;" style="color: #FFFFFF">登录</a></div>
<!-- 		<input name="savesid" value="0" id="check-box" class="checkbox" type="checkbox"><span>记住用户名</span> -->
	</form>
	

	<!-- 
	<div>
	<tr>
	<td><a href="#" class="login-fgetpwd" style="color: #FFFFFF">忘记密码？</a></td>
	<td><a href="#">还没注册账号！</a></td>
	</tr>
	</div> -->
	<div class="sas">
		<a href="#" style="color: red;"></a>
	</div>
	
<!--     <div class="chknumber">  
           <label>验证码：          
           <input name="kaptcha" type="text" id="kaptcha" maxlength="4" class="chknumber_input" />               
           </label>  
            <img src="/oms/captcha-image.do" width="55" height="20" id="kaptchaImage"  style="margin-bottom: -3px"/>   
           <script type="text/javascript">      
            $(function(){           
                $('#kaptchaImage').click(function () {//生成验证码  
                 $(this).hide().attr('src', '${ctx}/captcha-image.do?' + Math.floor(Math.random()*100) ).fadeIn(); })      
                      });   
            
           </script>   
         </div>   -->
	
</div>

</body>
<script   type="text/javascript" >
 function login() {
 
      var userName = $('#userName').val();
      var userPwd = $('#userPwd').val();
   // debugger;
      if(userName.trim().length==0||userName.trim()=="输入用户名登录"){
        //$('#error').empty().html("请输入名户名！");
       
        $('#userName').focus();
       // $('#userName').addClass("blur"); //添加css样式 
        // $('#userName')。css("boreder","1px solid yellow");
        return;
      }
      if(userPwd.trim().length==0){
       
        $('#userPwd').focus();
        return;
      }
       $.ajax({
        url : '${ctx}/doLogin.do',
        method : 'POST',
        dataType: "json",
        data : {
          userName : $('#userName').val(),
          userPwd : $('#userPwd').val()
        },
        success : function(response) {
      //  alert(response.success);
       
       // alert(response.message);
          if (response.success) {
       
            if (response.isLoginSuccess) {
          
                window.location.href = "${ctx}/index.do";
              
            } else {
              if (response.message != null&&response.message != '') {
               // $('#loginingStatus').hide();
               debugger;
               $('#userName').val(response.message);
               // $('#userPwd').focus();
              }
            }
          }
        }
      });
     
    }
  </script>
</html>