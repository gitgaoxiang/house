<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pageContent">
	
	<form method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>用户名：</label>
				${tblUser.userName}
			</div>
			<div class="unit">
				<label>请输入当前密码：</label>
				<input type="text" name="patientNames" size="30" class="required"/>
			</div>
			<div class="unit">
				<label>请输入新密码：</label>
				<input type="text" name="patientNames" size="30" class="required"/>
			</div>
			<div class="unit">
				<label>请再次输入新密码：</label>
				<input type="text" name="patientNames" size="30" class="required"/>
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

