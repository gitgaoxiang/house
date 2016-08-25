<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/tags/tags.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">




<link rel="shortcut icon" href="<%=basePath%>favicon.ico">
<link href="<%=basePath%>css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">

<!-- Data Tables -->
<link
	href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
<link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">

					<div class="ibox-content">

						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>勾选框</th>
									<th>序号</th>
									<th>登陆账号名</th>
									<th>类别</th>
									<th>角色名称</th>
									<th>编辑</th>
								   <th>删除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="user" varStatus="status">
									<tr target="userId" rel="${user.userId }" align="center">
										<td><input name="pkUserinfos" value="${user.userId}"
											type="checkbox" /></td>
										<td>${ status.index + 1 +
											pager.numPerPage*(pager.pageNum-1)}</td>
										<td>${user.userName }</td>
										<td>${user.teamId }</td>
										<td>${user.roleName }</td>
   <td><a href="table_basic.html#"><i class="fa fa-pencil"></i></a>
      <td><a href="<%=basePath%>admin/user/deleteUser.do?userId=${user.userId}"><i class="fa fa-close"></i></a>
									</tr>
								</c:forEach>
							</tbody>

						</table>

					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
	<script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
	<script src="<%=basePath%>js/plugins/jeditable/jquery.jeditable.js"></script>
	<script src="<%=basePath%>js/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="<%=basePath%>js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".dataTables-example").dataTable();
							var oTable = $("#editable").dataTable();
							oTable
									.$("td")
									.editable(
											"http://www.zi-han.net/theme/example_ajax.php",
											{
												"callback" : function(sValue, y) {
													var aPos = oTable
															.fnGetPosition(this);
													oTable.fnUpdate(sValue,
															aPos[0], aPos[1])
												},
												"submitdata" : function(value,
														settings) {
													return {
														"row_id" : this.parentNode
																.getAttribute("id"),
														"column" : oTable
																.fnGetPosition(this)[2]
													}
												},
												"width" : "90%",
												"height" : "100%"
											})
						});
		
	</script>


</body>


</html>
