<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@ include file="/WEB-INF/views/tags/tags.jsp" %>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js "></script>
<html lang="en">


<!-- Mirrored from www.zi-han.net/theme/hplus/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:49 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>ninezero- 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
 <!--    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
 -->
</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ 易速借贷 ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>ninezero后台登陆系统</strong></h4>
                    <ul class="m-b">
                        <li>&nbsp;</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 一、该系统用于易速借贷的审核、与信息查看</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 二、oms系统用于易速借贷app后台管理</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 三、快速、敏捷</li>
                        <li>&nbsp;</li>
                    </ul>
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="#">
                    <h4 class="no-margins">登录：</h4>
                   <!--  <p class="m-t-md">登录到oms系统</p> -->
					<!--                 <input type="text" class="form-control uname" placeholder="用户名" />
 -->
					<input id="userName" class="form-control uname"
						onFocus=" if(this.value=='输入用户名登录'||this.value=='密码错误'||this.value=='用户名不存在') this.value=''"
						onBlur="if(this.value=='') this.value='输入用户名登录'" value="test10"
						type="text">

					<!--    <input type="password" class="form-control pword m-b" placeholder="密码" /> -->
					<input id="userPwd" class="form-control pword m-b"
						onFocus="if(this.value=='1') this.value=''"
						onBlur="if(this.value=='') this.value='1'" value="1"
					type="password"> 
						<a href="#">忘记密码了？</a>
<!--                     <button  onclick="javascript:login();" class="btn btn-success btn-block">登录</button>
 -->                    <div class="mb2" onclick="javascript:login();"><a class="btn btn-success btn-block" href="javascript:;" style="color: #FFFFFF">登录</a></div>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2016 All Rights Reserved. ninezero工作室
            </div>
        </div>
    </div>
</body>
<script   type="text/javascript" >
 function login() {

      var userName = $('#userName').val();
      var userPwd = $('#userPwd').val();
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
        url : '<%=basePath%>doLogin.do',
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
          
                window.location.href = "<%=basePath%>index.do";
              
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
