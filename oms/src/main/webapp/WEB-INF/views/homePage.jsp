<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=8" /> -->
<!-- <meta http-equiv="pragma" content="no-cache"/> -->
<!-- <meta http-equiv="cache-control" content="no-cache"/> -->
<!-- <meta http-equiv="expires" content="0"/>     -->
<title>内容管理系统</title>

<link href="<%=basePath%>res/dwz/themes/default/style.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="<%=basePath%>res/dwz/themes/css/core.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="<%=basePath%>res/dwz/themes/css/print.css" rel="stylesheet"
	type="text/css" media="print" />
<link href="<%=basePath%>res/dwz/uploadify/css/uploadify.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="<%=basePath%>res/zTree/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" type="text/css" media="screen" />
<!--[if IE]>
<link href="<%=basePath%>res/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="<%=basePath%>res/dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->
<script src="<%=basePath%>res/echarts/js/echarts.js"></script>
<script src="<%=basePath%>res/bluemobi/scripts/common.js"
	type="text/javascript"></script>

<script src="<%=basePath%>res/dwz/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/jquery.cookie.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/jquery.bgiframe.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/xheditor/xheditor-1.2.1.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/xheditor/xheditor_lang/zh-cn.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/uploadify/scripts/jquery.uploadify.js"
	type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript"
	src="<%=basePath%>res/dwz/chart/raphael.js"></script>
<script type="text/javascript"
	src="<%=basePath%>res/dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="<%=basePath%>res/dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="<%=basePath%>res/dwz/chart/g.line.js"></script>
<script type="text/javascript" src="<%=basePath%>res/dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="<%=basePath%>res/dwz/chart/g.dot.js"></script>

<script src="<%=basePath%>res/bluemobi/scripts/common.js"
	type="text/javascript"></script>

<script src="<%=basePath%>res/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.util.date.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.validate.method.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.barDrag.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.accordion.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.switchEnv.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.alertMsg.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.contextmenu.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.navTab.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.resize.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.dialog.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.dialogDrag.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.sortDrag.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.cssTable.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.stable.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.taskBar.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.pagination.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.database.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.datepicker.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.effects.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.checkbox.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.history.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.combox.js"
	type="text/javascript"></script>
<script src="<%=basePath%>res/dwz/js/dwz.print.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换是下面dwz.regional.zh.js还需要引入)
<script src="<%=basePath%>res/dwz/bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="<%=basePath%>res/dwz/js/dwz.regional.zh.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/common/common.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>static/js/common/monitorPage.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=5482098780018a97976fbb4f52252595"></script>
<script type="text/javascript" src="<%=basePath%>static/lib/My97DatePicer/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>res/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>res/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
    // 聊天定时器ID全局变量
   /*  var basepath="${webroot}";
    var apipath="${apiRoot}"; */
    var map;
    var intervalId;
    var loginUserId = '${loginUser.userId}';
    
	 $(function() {
		var webroot = "<%=basePath%>";
		var config = webroot + "res/dwz/dwz.frag.zh.xml";
		DWZ.init(config, {
			
			loginUrl :  webroot+"simpleLogin.do",
			loginTitle : "登录", // 跳到登录页面
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="<%=basePath%>index.do" /><span>test</span></a>
				<ul class="nav">
					<li style="color: #FFF;"> <my:formatDate
							value="<%=new Date()%>" format="yyyy-MM-dd" locale="zh_CN" /></li>
					<li style="color: #FFF;">
						<%-- <c:if test="${loginUser.userLevel==3}">
							${loginUser.busiCompany }
						</c:if>
						<c:if test="${loginUser.userLevel!=3}">
							${loginUser.userAccount }
						</c:if> --%>
						${loginUser.userName }
					</li>
					<li style="color: #FFF;"><a href="admin/user/editPassword.do" target="dialog" rel="editPassword">更改密码</a></li>
					<li style="color: #FFF;"><a href="<%=basePath%>logout.do">退出</a></li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主页</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>菜单
						</h2>
					</div>
					<div class="accordionContent">
						<div id="menuTopBox">${menuTreeModel}</div>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">空主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent" layoutH="80"
							style="margin-right: 230px"></div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright ©2016 <a href="#" target="_blank">ninezero工作室</a>
		版权所有. V1.0.0
	</div>

</body>
</html>