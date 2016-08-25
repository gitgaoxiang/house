package com.cn.ninezero.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import com.cn.ninezero.service.CommonService;

@Controller("commons")  
@RequestMapping("admin/common")  
public class CommonController {
	@Autowired
	private CommonService commonService;
	
/*	@Resource
	private UserService userService;
*/
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
	
	
/*	
	
	@RequestMapping(value = "/user/i_forget_password")
	@ResponseBody
	public Map<String, ?> forgetPass(HttpServletRequest request, String userName) {
		User users = userService.getUserByUserName(userName);
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (users == null) { // 用户名不存在
			msg = "用户名不存在,你不会忘记用户名了吧?";
			map.put("message", msg);
			map.put("success", Boolean.valueOf(true));
			return map;
		}
		try {
			String secretKey = UUID.randomUUID().toString(); // 密钥
			Timestamp outDate = new Timestamp(
					System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期
			long date = outDate.getTime() / 1000 * 1000; // 忽略毫秒数
			users.setValidataCode(secretKey);
			users.setRegisterDate(outDate);
			userService.update(users); // 保存到数据库
			String key = users.getUserName() + "$" + date + "$" + secretKey;
			String digitalSignature = MD5.MD5Encode(key); // 数字签名
			String emailTitle = "有方云密码找回";
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			String resetPassHref = basePath + "user/reset_password?sid="
					+ digitalSignature + "&userName=" + users.getUserName();
			String emailContent = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href="
					+ resetPassHref + " target='_BLANK'>点击我重新设置密码</a>"
					+ "<br/>tips:本邮件超过30分钟,链接将会失效，需要重新申请'找回密码'" + key + "\t"
					+ digitalSignature;
			System.out.print(resetPassHref);
			SendMail.getInstatnce().sendHtmlMail(emailTitle, emailContent,
					users.getEmail());
			msg = "操作成功,已经发送找回密码链接到您邮箱。请在30分钟内重置密码";
		//	logInfo(request, userName, "申请找回密码");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "邮箱不存在？未知错误,联系管理员吧。";
		}
		map.put("msg", msg);
		return map;
	}
	
	
	*/
	
	
	
	
	
	
	
	
}
