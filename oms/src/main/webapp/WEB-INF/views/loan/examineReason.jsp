<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>

<h2 class="contentTitle">申请审核</h2>
<div class="pageContent">
	<form id="editForm" method="post" action="admin/loan/loanApply.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone)">
		<input type="hidden" name="qq" value="${id}" />

		<div class="pageFormContent nowrap" layoutH="97">
			<dl>
         <select class="combox" name="checkresult">
							
								<option value="1" ${loan.checkresult==1
									? 'selected="selected"' : ''}>通过</option>
								<option value="2" ${loan.checkresult==2
									? 'selected="selected"' : ''}>不通过</option>
						</select>
						</dl>
			<dl>
				<textarea name="checkreason" rows="13" cols="85" id="textarea"
					onblur="if(this.innerHTML==''){this.innerHTML='请输入审核意见';}"
					onfocus="if(this.innerHTML=='请输入审核意见'){this.innerHTML=''; }">请输入审核意见</textarea>
			</dl>

		</div>
		<div class="formBar">
			<ul>
				<li>
					<div id="null_B" class="button">
						<div class="buttonContent">
							 <button type="button" name="common.button.submit"
								onclick="submitform()">提 交</button> 
                      <!--   <div class="buttonContent">
							<button type="submit" name="common.button.submit">提 交</button>
						</div> -->
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
<script type="text/javascript">
	/* var setting = {
	 check: {
	 enable: true,
	 chkboxType: { "Y" : "s", "N" : "s" }
	 },
	 data: {
	 simpleData: {
	 enable: true
	 }
	 }
	 };

	 var zNodes =${menuData};
	 $(document).ready(function(){
	 $.fn.zTree.init(navTab.getCurrentPanel().find("#treeDemo"), setting, zNodes);
	 }); */
	 function submitform() {
		
		validateCallback(editForm, navTabAjaxDone) ;
		navTab.closeCurrentTab();
		
	} 
</script>