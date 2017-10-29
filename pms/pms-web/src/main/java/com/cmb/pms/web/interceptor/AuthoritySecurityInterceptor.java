package com.cmb.pms.web.interceptor;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cmb.pms.client.service.AuthorityServiceClient;
import com.cmb.pms.web.utils.Env;
import com.cmb.pms.web.utils.SessionConstants;

public class AuthoritySecurityInterceptor implements HandlerInterceptor {

	private AuthorityServiceClient authorityServiceClient; 

	// 无权限跳转的页面
	private static final String NOAUTHPAGE = "/noAuth.jsp";

	// 当前用户所拥有的URL资源
	private static Set<String> urlResSet = new HashSet<>();

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String userIDStr = session.getAttribute(SessionConstants.KEY_USER_ID).toString();
		Integer userID = Integer.parseInt(userIDStr);
		
		if (!Env.isUrlRes_IsGet()) {
			urlResSet.clear();
			urlResSet = authorityServiceClient.getURLResources(userID);
			Env.setUrlRes_IsGet(true);
		}
		
		String contextPath = request.getContextPath();
		String currentUrl = request.getServletPath();

		if (urlResSet.contains(currentUrl)) {
			return true;
		}
		response.sendRedirect(contextPath + NOAUTHPAGE);

		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}
	
	public AuthorityServiceClient getAuthorityServiceClient() {
		return authorityServiceClient;
	}
	
	@Autowired  
	public void setAuthorityServiceClient(AuthorityServiceClient authorityServiceClient) {
		this.authorityServiceClient = authorityServiceClient;
	}
}
