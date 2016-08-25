package com.cn.ninezero.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cn.ninezero.service.CommonService;

@Controller("common")  
@RequestMapping("admin/common")  
public class CommonController {
	@Autowired
	private CommonService commonService;
	/**
	 * 唯一性检查通用方法
	 */
	@RequestMapping(value = "/checkUnique")
	@ResponseBody
	public String checkUnique(HttpServletRequest request) {
		String tName=request.getParameter("tName");
		String tProperty=request.getParameter("tProperty");
		String pkTProperty=request.getParameter("pkTProperty");
		String pkTValue=request.getParameter("pkTValue");
		String property=request.getParameter("property");
		String value=request.getParameter(property);
		Map<String,String> map=new HashMap<String, String>();
		map.put("tName",tName);
		map.put("tProperty",tProperty);
		map.put("pkTProperty",pkTProperty);
		map.put("pkTValue",pkTValue);
		map.put("value",value);
		int count=commonService.checkCommonUnique(map);
		// 返回处理结果信息
		return (count==0)+"";
	}
}
