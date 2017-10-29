package com.cmb.pms.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.cmb.pms.client.dto.UserDTO;
import com.cmb.pms.client.service.UserServiceClient;
import com.cmb.pms.web.utils.Env;
import com.cmb.pms.web.utils.SessionConstants;

@Controller
public class LoginController {

	@Resource(name = "userServiceClient")
	private UserServiceClient userServiceClient;

	//    登录验证
	@RequestMapping(value = "login.do")
	public @ResponseBody String login(HttpServletRequest request,
			HttpServletResponse response) {
		// 获取前台传来的工号和密码（以工号为用户名进行登录）
		String userWorkID = request.getParameter("userWorkID");
		String passWord = request.getParameter("password");  // 密码，暂时为明文，后期要加密处理
		 // System.out.println("当前登录用户：" + userWorkID);

		// 设置登录反馈信息变量：0—成功；1—用户名不存在；2—密码无效登录失败。
		String msg = null;
		UserDTO userDTO = userServiceClient.getUserByUserWorkID(userWorkID);
		if(userDTO == null) {
			msg = "1";
		} else {
			if (passWord.equals(userDTO.getUserPassword())) {
				request.getSession().setAttribute(SessionConstants.KEY_USER_Work_ID,  userWorkID);
				request.getSession().setAttribute(SessionConstants.KEY_NAME, userDTO.getUserName());
				request.getSession().setAttribute(SessionConstants.KEY_USER_ID, userDTO.getUserID());
				msg = "0";
			} else {
				msg = "2";
			}
		}
				
		return msg;
	}

	// 请求 url 地址映射，类似 Struts 的 action-mapping
	@RequestMapping(value = "loadHome.do", method = RequestMethod.GET)
	public String loadHome(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/index";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		
		// 辅助权限判断
		Env.setUrlRes_IsGet(false);
		return "redirect:/login.jsp";
	}

	// 验证用户名和密码
	@RequestMapping(value = "/checkLogin.json", method = RequestMethod.POST)
	@ResponseBody
	public String checkLogin(String username, String password) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return JSONUtils.toJSONString(result);
	}

	// 退出登录
	@RequestMapping(value = "/logout.json", method = RequestMethod.POST)
	@ResponseBody
	public String logout() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return JSONUtils.toJSONString(result);
	}
}
