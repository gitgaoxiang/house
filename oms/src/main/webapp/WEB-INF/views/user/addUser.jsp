<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pageContent">
	
	<form method="post" action="admin/user/saveUser.do" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>用户名：</label>
				<input type="text" name="userName" size="30"  class="required"  remote="admin/common/checkUnique.do?tName=user&tProperty=user_name&property=userName"/>
			</div>
			<div class="unit">
				<label>手机号：</label>
				<input type="text" name="teamId" size="30" />
				<input type="text" hidden="true" name="roleName" size="30" />
			</div>
			<div class="unit">
			<label>角色类别:</label>
						<select class="combox" name="userRole">
							
							<c:forEach var="role" items="${roleList}">
									 <option value="${role.roleId}" >
										${role.roleName}</option> 
							</c:forEach>			
						</select>
						
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>

