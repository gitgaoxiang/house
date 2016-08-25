<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<script type="text/javascript">

function navTabAjaxDone(json){
  //  DWZ.ajaxDone(json);
 var obj = new Function("return" + json)();   
    alertMsg.info(obj.message);
  navTabPageBreak({}, json.rel);
   // window.location.href="<%=request.getContextPath()%>/index.do";
}


</script>
<div class="pageHeader"> 
<form id="pagerForm" method="post" action="admin/role/findRoleList.do" onsubmit="return navTabSearch(this);"> 
	<input type="hidden" name="status" value="${pager.status}"/>
	<input type="hidden" name="keywords" value="${pager.keywords}"/>
	<input type="hidden" name="pageNum" value="${pager.pageNum}"/>
	<input type="hidden" name="numPerPage" value="${pager.numPerPage}"/>
</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a href="admin/role/newRole.do" target="navTab" rel="roleOperate" class="add"><span>新增</span></a>
			</li>
			<li>
			    <a href="admin/role/editRole.do?roleId={roleId}" target="navTab" rel="roleOperate" class="edit"><span>编辑</span></a></li>
			<li>
                <a class="delete" title="确定要删除选中的记录吗?" target="ajaxTodo"
				href="admin/role/removeRole.do?roleId={roleId}"> <span>删除</span>
			</a>
			</li>
			<li><a class="icon" title="实要导出这些记录吗?" targettype="navTab"
				target="dwzExport" href="demo/common/dwz-team.xls"> <span>导出EXCEL</span>
			</a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="90">
		<thead>
		<tr>
			<th align="center">序号</th>
			<th align="center">角色名称</th>
			<th align="center">角色类别</th>
			<th align="center">创建人</th>
        </tr>
		</thead>
		<tbody>
		<c:forEach items="${roleList}" var="role" varStatus="status">
			<tr target="roleId" rel="${role.roleId }" align="center">
				<td width=20%>${ status.index + 1 + pager.numPerPage*(pager.pageNum-1)}</td>
				<td width=20%>${role.roleName }</td>
				<td width=20%>
					<c:choose>
						<c:when test="${role.category=='1'}">超级管理员</c:when>
						<c:when test="${role.category=='2'}">普通管理员</c:when>
						<c:when test="${role.category=='3'}">纯商家</c:when>
						<c:when test="${role.category=='4'}">商家子角色</c:when>
						<c:when test="${role.category=='5'}">个体商家</c:when>
					</c:choose>
				</td>
			 <td width=20%>${role.createDate}</td> 
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>
			<!-- <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="4" ${pager.numPerPage == 4?"selected":""}>4</option> 
				<option value="20" ${pager.numPerPage == 20?"selected":""}>20</option> 
				<option value="100" ${pager.numPerPage == 100?"selected":""}>100</option> 
				<option value="200" ${pager.numPerPage == 200?"selected":""}>200</option> 
			</select> -->
			共${pager.total }条, 共${pager.pageTotal}页</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${pager.total}" numPerPage="${pager.numPerPage}" pageNumShown="10" currentPage="${pager.pageNum}"></div>
	</div>
</div>
