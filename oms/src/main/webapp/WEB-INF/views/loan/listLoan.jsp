<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="my"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">

function exportSubmit(formId,url){
	var form = navTab.getCurrentPanel().find("#"+formId);
	var oldUrl = form.attr("action");
	var oldSubmitMethod = form.attr("onsubmit");
	form.attr("onsubmit",null)
	form.attr("action",url);
	form.submit();
	form.attr("action",oldUrl);
	form.attr("onsubmit",oldSubmitMethod);
}

</script>
<div class="pageHeader">
	<form id="pagerForm" method="post" action="admin/loan/loanList.do"
		onsubmit="return navTabSearch(this);">
		<input type="hidden" name="status" value="${pager.status}" /> <input
			type="hidden" name="keywords" value="${pager.keywords}" /> <input
			type="hidden" name="pageNum" value="${pager.pageNum}" /> <input
			type="hidden" name="numPerPage" value="${pager.numPerPage}" />

<!-- <div class="searchBar">
		<table class="searchContent">
		<tbody>
			<tr>	
				
						<td align="right">
							<div id="formSubmitter_B" class="button">
								<div class="buttonContent">
									<button id="formSubmitter" type="submit" onclick="exportSubmit('pagerForm','admin/loan/export.do')"
										name="common.button.search">Excel导出</button>
								</div>
							</div>
						</td>

					</tr>
			
		</tbody>
		</table>
	</div> -->
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<!-- 	<li>
				<a href="admin/loan/examineReasonUi.do?id={qq}" target="navTab"  class="add"><span>审核</span></a>
			</li>  -->
			<!-- <li class=""><a class="delete" title="确定要审核记录吗?" rel="ids"
				target="selectedTodo"  href="admin/loan/examineReasonUi.do"> <span>审核</span>
			</a></li> -->
			<li>
			    <a href="admin/loan/examineReasonUi.do?ids={qq}" target="navTab" rel="roleOperate" class="edit"><span>审核</span></a></li>
			<li>
			<li><a class="icon" targettype="navTab"
				target="dwzExport" onclick="exportSubmit('pagerForm','admin/loan/export.do')"> <span>导出EXCEL</span>
			</a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="90">
		<thead>
			<tr>
				<th align="center">序号</th>
				<th align="center">姓名</th>
				<th align="center">QQ</th>
				<th align="center">电话</th>
				<th align="center">信用评分</th>
				<th align="center">信用状况</th>
				<th align="center">借贷理由</th>
				<th align="center">申请时间</th>
				<th align="center">借贷数</th>
				<th align="center">申请结果</th>
				<th align="center">审核意见</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${loanList}" var="loan" varStatus="status">
				<tr target="qq" rel="${loan.qq }" align="center">
				
					<td>${ status.index + 1 + pager.numPerPage*(pager.pageNum-1)}</td>
					<td>${loan.name }</td>
					<td>${loan.qq }</td>
					<td>${loan.tel }</td>
					<td>${loan.creditscore }</td>
					<td>${loan.creditcondition }</td>
					<td>${loan.loanreason }</td>
					<td><fmt:formatDate value="${loan.applytime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${loan.totallimit }</td>
					<td>
					<c:choose>
						<c:when test="${loan.checkresult==0}">审核中</c:when>
						<c:when test="${loan.checkresult==1}"><a style="color:green;">通过</a></c:when>
						<c:when test="${loan.checkresult==2}"><a style="color:red;">不通过</a></c:when>
						
					</c:choose>
					</td>
					<td>${loan.checkreason }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span> 共${pager.total }条, 共${pager.pageTotal}页</span>
		</div>
		<div class="pagination" targetType="navTab"
			totalCount="${pager.total}" numPerPage="${pager.numPerPage}"
			pageNumShown="10" currentPage="${pager.pageNum}"></div>
	</div>
</div>
