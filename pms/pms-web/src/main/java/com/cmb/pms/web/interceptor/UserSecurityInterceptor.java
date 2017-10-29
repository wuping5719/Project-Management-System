package com.cmb.pms.web.interceptor;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cmb.pms.web.utils.SessionConstants;

public class UserSecurityInterceptor implements HandlerInterceptor {

	private static final String DEFAULT_LOGIN = "/login.jsp";

	private List<String> noLoginAuthUrlList = new ArrayList<>();

	/**
	 *   preHandle 方法是进行处理器拦截用的，该方法将在 Controller 处理之前进行调用，
	 *   SpringMVC 中的 Interceptor 拦截器是链式的，可以同时存在多个 Interceptor，
	 *   然后 SpringMVC 会根据声明的前后顺序一个接一个的执行，
	 *   而且所有的 Interceptor 中的 preHandle 方法都会在 Controller 方法调用之前调用。
	 *   SpringMVC 的这种 Interceptor 链式结构也是可以进行中断的，
	 *   这种中断方式是令 preHandle 的返回值为 false，当 preHandle 的返回值为 false 的时候整个请求就结束了。
	 */
	@SuppressWarnings("deprecation")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// 请求的路径
		String contextPath = request.getContextPath();
		String url = request.getServletPath().toString();
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute(SessionConstants.KEY_NAME);
		// 这里可以根据 session 的用户来判断角色的权限，根据权限来重定向不同的页面，
		// 简单起见，这里只是做了一个重定向.
		if (StringUtils.isEmpty(userName)) {
			// 被拦截，重定向到 login 界面
			String  targetPath = contextPath +DEFAULT_LOGIN + "?redirectURL=" + URLEncoder.encode(url);
			response.sendRedirect(targetPath);
			return false;
		}
		
		/*if(!isLogin(request)){
			response.sendRedirect(contextPath + "/login.jsp?redirectURL=" + URLEncoder.encode(url));
			return false;
		}*/
		
		return true;
	}

	/**
	 * 该方法也是需要当前对应的 Interceptor 的 preHandle 方法的返回值为 true 时才会执行。
	 * 该方法将在整个请求完成之后，也就是 DispatcherServlet 渲染了视图执行，
	 * 这个方法的主要作用是用于清理资源的，
	 * 当然这个方法也只能在当前这个 Interceptor 的 preHandle 方法的返回值为 true 时才会执行。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response , Object arg2, Exception ex) throws Exception {
	}

	/**
	 *  这个方法只会在当前这个 Interceptor 的 preHandle 方法返回值为 true 的时候才会执行。
	 *  postHandle 是进行处理器拦截用的，它的执行时间是在处理器进行处理之后，
	 *  也就是在 Controller 的方法调用之后执行，但是它会在 DispatcherServlet 进行视图的渲染之前执行，
	 *  也就是说在这个方法中你可以对 ModelAndView 进行操作。
	 *  这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的 Interceptor 拦截器该方法反而会后调用，
	 *  这跟 Struts2 里面的拦截器的执行过程有点像，只是 Struts2 里面的 intercept 方法中要手动的调用 
	 *  ActionInvocation 的 invoke 方法，Struts2 中调用 ActionInvocation 的 invoke 方法就是调用下一个 Interceptor
	 *  或者是调用 action，然后要在 Interceptor 之前调用的内容都写在调用 invoke 之前，
	 *  要在 Interceptor 之后调用的内容都写在调用 invoke 方法之后。
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	protected boolean isLogin(HttpServletRequest httpServletRequest) {
		String currentUrl = httpServletRequest.getRequestURI();

		noLoginAuthUrlList.add("/login.jsp");

		for (String url : noLoginAuthUrlList) {
			if (currentUrl.startsWith(url)) {
				return true;
			}
		}

		HttpSession httpSession = httpServletRequest.getSession();
		String userName = (String) httpSession.getAttribute(SessionConstants.KEY_NAME);
		if (userName == null) {
			// 仅仅记住 get 请求的链接
			if (StringUtils.equalsIgnoreCase(httpServletRequest.getMethod(), "GET")) {
				HttpSession session = httpServletRequest.getSession();
				String servletPath = httpServletRequest.getServletPath();
				String fullURL = new StringBuffer(servletPath).append(toParameterString(httpServletRequest)).toString();
				session.setAttribute("KEY_USER_NAME", fullURL);
			}
			return false;
		}
		return true;
	}

	private String toParameterString(HttpServletRequest httpServletRequest) {
		@SuppressWarnings("unchecked")
		Enumeration<String> paramEnumeration = httpServletRequest.getParameterNames();
		if (!paramEnumeration.hasMoreElements()) {
			return "";
		}
		StringBuffer stringBuffer = new StringBuffer();
		while (paramEnumeration.hasMoreElements()) {
			String paramName = paramEnumeration.nextElement();
			stringBuffer.append("&");
			stringBuffer.append(paramName);
			stringBuffer.append("=");
			stringBuffer.append(httpServletRequest.getParameter(paramName));
		}
		stringBuffer.replace(0, 1, "?");
		return stringBuffer.toString();
	}
}
