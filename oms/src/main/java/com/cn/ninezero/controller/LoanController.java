package com.cn.ninezero.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cn.bluemobi.product.common.DwzPagerMySQL;
import com.cn.bluemobi.product.utils.JsonObject;
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Loan;
import com.cn.ninezero.service.LoanService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("loanController")
@RequestMapping("admin/loan")
public class LoanController {

	@Resource
	private LoanService loanService;
	

	
	@RequestMapping(value = "/loanList")
	public String getUserList(@ModelAttribute("pager") DwzPagerMySQL pager,
			@ModelAttribute Loan loan, Model model, HttpServletRequest request) {
		if (loan == null) {
			loan = new Loan();
		}
		// 登录用户信息
		List<Loan> loanList = null;
		// 用户总数
		long total = 0;

		// 取得用户列表
		try {
			// 用户总数
			total = loanService.getLoanCount(loan);
			if (total <= pager.getOffset()) {
				pager.setPageNum(1L);
			}
			// 设置分页对象
			loan.setPager(pager);
			loanList = loanService.getLoanList(loan);
		
		} catch (Exception e) {
			// log.error(e.getMessage());
		}
		pager.setTotal(total);
		// 将用户信息放到会话中
		model.addAttribute("loan", loan);
		model.addAttribute("loanList", loanList);
		model.addAttribute("pager", pager);

		// 跳转至管理员主页面
		return "loan/listLoan";
	}
	@RequestMapping(value = "/export")
	public void invoice(@ModelAttribute("pager") DwzPagerMySQL pager,
			@ModelAttribute Loan loan, Model model,
			HttpServletRequest request, HttpServletResponse res) {

		List<Loan> loanList = loanService.getLoanList_export(loan);

		try {
			exports(res, loanList, "申请表.xls", "invoice");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected HSSFCellStyle style;
	public final static int sheetMaxDataCount = 60000;
	public void exports(HttpServletResponse response, Object data,
			String fileName, String status) throws Exception {
		response.setContentType("application/vnd.ms-excel");
		try {
			// 处理中文名称
			response.setHeader("Content-disposition", "attachment;filename="
					+ new String(fileName.getBytes("gb2312"), "ISO8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HSSFWorkbook wb = new HSSFWorkbook();
		// 设置单元格格式
		style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
		style.setWrapText(true);// 自动换行
		if ("invoice".equals(status)) {
			makeExcelData(wb, data);
		}

		writeData(wb, response);// 向页面写数据
	}
	private String[] columns_invoice = { "姓名","电话", "信用评分", "信用状况",
			"借贷理由", "申请时间" ,"借贷数","申请结果","审核意见", "QQ"};// 初始化列名

	// 填充数据
	protected void makeExcelData(HSSFWorkbook wb, Object dataList) {
		@SuppressWarnings("unchecked")
		List<Loan> list = (List<Loan>) dataList;
		double dataCount = list.size();
		double sheetCount = Math.ceil(dataCount / sheetMaxDataCount);
		for (int k = 0; k < sheetCount; k++) {
			HSSFSheet sheet = wb.createSheet("发票申请报表");
			makeHead(sheet, columns_invoice);
			int rowIndex = 0;
			for (int i = k * sheetMaxDataCount; i < (k + 1) * sheetMaxDataCount
					&& i < dataCount; i++) {
				Loan loan = list.get(i);

				int rowNumUp = ++rowIndex;
				// int rowNumDown = ++rowIndex;
				HSSFRow row0 = sheet.createRow(rowNumUp);
				// HSSFRow row1 = sheet.createRow(rowNumDown);
				HSSFCell cell00 = row0.createCell(0);
				cell00.setCellValue(loan.getName());
				cell00.setCellStyle(style);

				HSSFCell cell01 = row0.createCell(1);
				cell01.setCellValue(loan.getTel());
				cell01.setCellStyle(style);
			

				HSSFCell cell02 = row0.createCell(2);
				cell02.setCellValue(loan.getCreditscore());
				cell02.setCellStyle(style);

				HSSFCell cell03 = row0.createCell(3);
				cell03.setCellValue(loan.getCreditcondition());
				cell03.setCellStyle(style);

				HSSFCell cell04 = row0.createCell(4);
				cell04.setCellValue(loan.getLoanreason());
				cell04.setCellStyle(style);

				HSSFCell cell05 = row0.createCell(5);
				cell05.setCellValue(loan.getApplytime());
				cell05.setCellStyle(style);
				
				HSSFCell cell06 = row0.createCell(6);
				cell06.setCellValue(loan.getLoanlimit());
				cell06.setCellStyle(style);
				
				HSSFCell cell07 = row0.createCell(7);
				cell07.setCellValue(select(loan.getCheckresult()));
				cell07.setCellStyle(style);

				HSSFCell cell08 = row0.createCell(8);
				cell08.setCellValue(loan.getCheckreason());
				cell08.setCellStyle(style);
				
				HSSFCell cell09 = row0.createCell(9);
				cell09.setCellValue(loan.getQq());
				cell09.setCellStyle(style);

				
				
				
			}
		}
	}
	protected void makeHead(HSSFSheet sheet, Object[] columns) {
		HSSFRow row = sheet.createRow((int) 0);
		for (int i = 0; i < columns.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(columns[i].toString());
			cell.setCellStyle(style);
			sheet.autoSizeColumn(i, true);
			sheet.setColumnWidth(i, 3500);// 设置列宽
		}
	}
	
	private void writeData(HSSFWorkbook wb, HttpServletResponse response)
			throws Exception {
		OutputStream ouputStream = null;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);
		} catch (IOException e) {
			e.printStackTrace();
			throw new Exception("导出Excel时IO异常");
		} finally {
			try {
				ouputStream.flush();
				ouputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value = "/examineReasonUi")
	public String examineReasonUi(
			@RequestParam("ids") String id, Model model) {
		model.addAttribute("id", id);
		// 跳转至用户选择画面
		return "loan/examineReason";
	}
	@RequestMapping(value = "/loanApply")
	@ResponseBody
	public String loanApply(@ModelAttribute("loan") Loan loan,
			Model model, HttpServletRequest request) throws IOException {
		// 处理结果信息
		DwzAjaxResult dwzResult;
		
			try {
				loanService.loanApply(loan);
				dwzResult = new DwzAjaxResult("200", "保存成功", "loanList.do", "closeCurrent", "");
			} catch (Exception e) {
				
				dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "loanList.do", "", "");
			}
		
		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}
	
	private String select(Integer i) {
		switch (i) {
		case 0:
			return "审核中";
		case 1:
			return "通过";
		case 2:
		    return "不通过";
		default:
			return "其他";
		}
	}
}
