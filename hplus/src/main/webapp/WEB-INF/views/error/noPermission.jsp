<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/tags/tags.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>
      ERROR PAGE
    </title>
    <meta charset="utf-8">
    <meta name="keywords" content="" />
	<meta name="description" content="" />
    <link href="http://fonts.useso.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/se7en/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/se7en/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/se7en/stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/se7en/stylesheets/style.css" media="all" rel="stylesheet" type="text/css"/>
    <%--<script src="${ctx}/static/se7en/javascripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/se7en/javascripts/jquery-ui-1.10.3.js" type="text/javascript"></script>
    <script src="${ctx}/static/se7en/javascripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/se7en/javascripts/modernizr.custom.js" type="text/javascript"></script>
    <script src="${ctx}/static/se7en/javascripts/main.js" type="text/javascript"></script>
    <script src="${ctx}/static/se7en/javascripts/application.js" type="text/javascript"></script>--%>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
  </head>
  <body class="fourofour">
    <!-- Login Screen -->
    <div class="fourofour-container">
      <h1>
       403
      </h1>
      <h2>
        sorry<br/>如此自信！<br/>你无权限访问此页面...
      </h2>

      <a class="btn btn-lg btn-default-outline" href="${ctx}/login"><i class="icon-home"></i>返回登录</a>
    </div>
    <!-- End Login Screen -->
    <%--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>--%>
  </body>
</html>