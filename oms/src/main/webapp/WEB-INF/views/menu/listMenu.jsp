<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my" %>
<%-- <%@ taglib uri="/WEB-INF/bluemobi-tag.tld" prefix="bmtag" %> --%>
<script type="text/javascript">
	var webroot = "${webroot}";
	function navTabAjaxDone(json){
	  //  DWZ.ajaxDone(json);
	 var obj = new Function("return" + json)();   
	    alertMsg.info(obj.message);
	  navTabPageBreak({}, json.rel);
	   // window.location.href="<%=request.getContextPath()%>/index.do";
	}
	
</script>
<div class="pageHeader"> 
<form id="pagerForm" method="post" action="admin/menu/findMenuList.do" onsubmit="return navTabSearch(this);"> 
	<input type="hidden" name="status" value="${pager.status}"/>
	<input type="hidden" name="keywords" value="${pager.keywords}"/>
	<input type="hidden" name="pageNum" value="${pager.pageNum}"/>
	<input type="hidden" name="numPerPage" value="${pager.numPerPage}"/>
	
	<div class="searchBar">
		<table class="searchContent">
		<tbody>
			<tr>	
				<td style="align:left">
					<label style="align:left">菜单名称</label>
				</td>
				<td>
					<input type="text" name="contents" value="${menu.contents}">
				</td>
				<td style="align:left">
					<label style="align:left">菜单链接</label>
				</td>
				<td>
					<input type="text" name="url" value="${menu.url}">
				</td>
				
				<td style="align:left">
					<label style="align:left">上级菜单</label>
				</td>
				<td>
					<input name="org.id" value="${menu.parentMenuId}" type="hidden"/>
					<input name="org.name" value="${menu.parentMenuName}" type="text" class="required normal" readonly />
					
				</td>
				<td><a class="btnLook" style="float:right;width:20px;" href="admin/menu/getMenuTreeLookup.do" width="250" lookupGroup="org">查找带回</a></td>
						<td align="right">
						<td align="right">
							<div id="formSubmitter_B" class="button">
								<div class="buttonContent">
									<button id="formSubmitter" type="submit"
										name="common.button.search">查 询</button>
								</div>
							</div>
						</td>

					</tr>
			<%-- <tr>	
				<td style="align:left">
					<label style="align:left">菜单类别</label>
				</td>
				<td >
					<select  name="menuType" style="width:130px;">
						<option value="">--请选择--</option>
						<option value="1" ${menu.menuType==1 ? 'selected="selected"' : ''}>菜单权限</option>
						<option value="2" ${menu.menuType==2 ? 'selected="selected"' : ''}>按钮权限</option>
					</select>
				</td>
				
			</tr> --%>
		</tbody>
		</table>
	</div>
</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li class=""><a class="add" rel="menuAdd" target="navTab"
				href="admin/menu/newMenu.do"> <span>新增</span>
			</a></li>
			<li class=""><a class="edit" rel="roleEditPage" target="navTab"
				href="admin/menu/editMenu.do?menuId={menuId}"> <span>编辑</span>
			</a></li>
			<li class=""><a class="delete" title="确定要删除选中的记录吗?" rel="ids"
				target="selectedTodo"  href="admin/menu/removeMenu.do"> <span>批量删除</span>
			</a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="155">
		<thead>
		<tr>
			<th width="10"><input type="checkbox" group="ids"
					class="checkboxCtrl" />
				</th>
			<th align="center">序号</th>
			<th align="center">菜单ID</th>
			<th align="center">菜单名称</th>
			<th align="center">菜单链接</th>
			<th align="center">上级菜单</th>
		    <th align="center">菜单标签</th> 
			<th align="center">菜单排序</th>
        </tr>
		</thead>
		<tbody>
		<c:forEach items="${menuList}" var="menu" varStatus="status">
			<tr target="menuId" rel="${menu.menuId }" align="center">
				<td><input name="ids"  value="${menu.menuId }"
						type="checkbox" />
				</td>
				<td>${ status.index + 1 + pager.numPerPage*(pager.pageNum-1)}</td>
				<td>${menu.menuId }</td>
				<td>${menu.contents }</td>
				<td>${menu.url }</td>
				<td>
				    <c:choose>
						<c:when test="${menu.parentMenuId==''}">根菜单</c:when>
						<c:when test="${menu.parentMenuId!=''}">${menu.parentMenuName}</c:when>
					</c:choose>
                </td>
                <td>${menu.rel }</td>
				<%-- <td>
					<c:choose>
						<c:when test="${menu.menuType=='1'}">菜单权限</c:when>
						<c:when test="${menu.menuType=='2'}">按钮权限</c:when>
					</c:choose>
				</td> --%>
				<td>${menu.sortNumber }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>
			共${pager.total }条, 共${pager.pageTotal}页</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${pager.total}" numPerPage="${pager.numPerPage}" pageNumShown="10" currentPage="${pager.pageNum}"></div>
	</div>
</div>
