<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<script type="text/javascript">
	function navTabAjaxDone(json){
	  //  DWZ.ajaxDone(json);
	 var obj = new Function("return" + json)();   
	 
	    alertMsg.info(obj.message+",并请手动刷新页面！");
	    //关闭当前页面
	    navTab.closeCurrentTab(); 
	    //刷新页面
	    navTabPageBreak({}, json.rel);

	   <%--  if(obj.statusCode==200){
	    window.location.href="<%=request.getContextPath()%>/index.do";
	    } --%>
	}
	
</script>
<h2 class="contentTitle">菜单添加</h2>
<div class="pageContent">
<form id="addMenuForm" method="post" action="admin/menu/saveMenu.do" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="menuId" value="${menu.menuId}" />
	<div class="pageFormContent nowrap" layoutH="97" >
			<dl>
				<dt>菜单名称：</dt>
				<dd>
					<input name="contents" value="${menu.contents}" type="text" class="required normal" size="25"
						maxlength="20" remote="<%=request.getContextPath()%>/admin/common/checkUnique.do?tName=p_m_menu&tProperty=contents&property=contents"/>
				</dd>
			</dl>
			<dl>
				<dt>菜单链接：</dt>
				<dd>
					<input name="url" value="${menu.url}" type="text" class="halfsymbol" size="25"
						maxlength="60" />
				</dd>
			</dl>
			<dl>
				<dt>上级菜单：</dt>
				<dd>
					<input name="org.id" value="${menu.parentMenuId}" type="hidden"/>
					<input name="org.name" value="${menu.parentMenuName}" type="text" class="normal" readonly />
					<a class="btnLook" href="admin/menu/getMenuTreeLookup.do" width="250" lookupGroup="org">查找带回</a>	
				</dd>
			</dl>
			<!-- <dl>
				<dt>菜单类别：</dt>
				<dd>
					<select name="menuType" class="required">
						<option value="">--------------请选择---------------</option>
						<option value="1">菜单权限</option>
						<option value="2">按钮权限</option>
					</select>
				</dd>
			</dl> -->
			<dl>
				<dt>菜单标签：</dt>
				<dd>
					<input name="rel" value="${menu.rel}" type="text" class="alphanumeric" maxlength="20" />
				</dd>
			</dl>
			<dl>
				<dt>菜单排序：</dt>
				<dd>
					<input name="sortNumber" value="${menu.sortNumber}" type="text" class="required digits" size="2"
						maxlength="2" />
				</dd>
			</dl>
	</div>
	<div class="formBar">
			<ul>
				<li>
					<div id="null_B" class="button">
						<div class="buttonContent">
							<button type="submit" name="common.button.submit">提 交</button>
						</div>
					</div>
				</li>
				<li>
					<div id="null_B" class="button">
						<div class="buttonContent">
							<button class="close" type="button" name="common.button.back">
								返 回</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
</form>
</div>
