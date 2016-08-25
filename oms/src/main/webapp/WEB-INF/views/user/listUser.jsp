<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my" %>
<script type="text/javascript">
	var webroot = "${webroot}";
	function ajaxDoneCallback(json){
	}
</script>
<div class="pageHeader"> 
<form id="pagerForm" method="post" action="admin/user/userList.do" onsubmit="return navTabSearch(this);"> 
	<input type="hidden" name="status" value="${pager.status}"/>
	<input type="hidden" name="keywords" value="${pager.keywords}"/>
	<input type="hidden" name="pageNum" value="${pager.pageNum}"/>
	<input type="hidden" name="numPerPage" value="${pager.numPerPage}"/>
	<div class="searchBar">
		<table class="searchContent">
		<tbody>
					<tr>
						<td style="align: left"><span>登陆帐号:</span> <input
							name="userName" value="${user.userName}" /></td>
					<%-- 	<td style="align: left"><span>角色类别: </span><select
							name="roleName" class="select_Style">
								<option value="">全部</option>
								<option value="0"
									${user.userRole==0
									? 'selected="selected"' : ''}>草稿</option>
								<option value="5"
									${user.userRole==5
									? 'selected="selected"' : ''}>提交审核</option>
								<option value="12"
									${user.userRole==12
									? 'selected="selected"' : ''}>分享申请中</option>
								<option value="10"
									${user.userRole==10
									? 'selected="selected"' : ''}>专属</option>

						</select></td> --%>
						<td style="align: left"><span>角色类别: </span>
						<td><select class="combox" name="userRole">
							<option value="">全部</option>
							<c:forEach var="role" items="${roleList}">
									 <option value="${role.roleId}" >
										${role.roleName}</option> 
							</c:forEach>			
						</select></td>

						<td align="right">
							<div id="formSubmitter_B" class="button">
								<div class="buttonContent">
									<button id="formSubmitter" type="submit"
										name="common.button.search">查 询</button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
		</table>
	</div>
</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<!-- <li class=""><a class="add" rel="userAddPage" target="navTab"
				href="user/newUser.do"> <span>新增</span>
			</a></li> -->
			<li class=""><a class="add" mask="true" target="dialog"
				href="admin/user/newUser.do"> <span>新增</span>
			</a></li>
			<!-- <li class=""><a class="edit" rel="userEditPage" target="navTab"
				href="user/editUser.do?userId={userId}"> <span>编辑</span>
			</a></li> -->
			<li class=""><a class="delete" title="确定要删除选中的记录吗?" rel="ids"
				rel="pkUserinfos" target="selectedTodo" href="admin/user/removeUser.do">
					<span>删除</span>
			</a></li>
		<!-- 	<li class=""><a class="icon"
				href="javascript:$.printBox('w_list_print')"> <span>打印</span>
			</a></li> -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="113">
		<thead>
		<tr align="center">
			<th width="10"><input type="checkbox" group="pkUserinfos"
					class="checkboxCtrl" /></th>
			<th>序号</th>
			<th>账号</th>
			
			<th>手机号</th>
			<th>角色</th>
        </tr>
		</thead>
		<tbody>
		<c:forEach items="${userList}" var="user" varStatus="status">
			<tr target="userId" rel="${user.userId }" align="center">
				<td>
					<input name="ids"  value="${user.userId}"
						type="checkbox"  />
				</td>
				<td>${ status.index + 1 + pager.numPerPage*(pager.pageNum-1)}</td>
				<td>${user.userName }</td>
				<td>${user.teamId }</td>
				<td>${user.roleName }</td>
				<%-- <td>
					<c:choose>
						<c:when test="${user.userStatus == '1'}">
							正常
						</c:when>
						<c:when test="${user.userStatus == '2'}">
							冻结
						</c:when>
					</c:choose></td> --%>
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
