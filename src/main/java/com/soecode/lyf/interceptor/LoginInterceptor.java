package com.soecode.lyf.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	/**
	 * 调用前执行此方法。
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取请求URL
		String uri = request.getRequestURI();
		//URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
		if(uri.indexOf("login")>=0){
			return true;
		}
		//获取session
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		if(username != null){
			return true;
		}
		//不符合条件的，跳转到登录界面  
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response); 
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("==================>>执行postHandle");
	}
	/**
	 * handler 执行完成后调用此方法。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("==================>>执行afterCompletion");
	}

}
