package com.project.weframe.servlet;

import java.awt.TexturePaint;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求url
		String url = request.getRequestURI();
		//URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
		if(url.indexOf("login.action")>0){
			return true;
		}
		//获取session
		HttpSession session = request.getSession();
		String username =(String)session.getAttribute("username");
		if(null!=username){
			return true;
		}
		//跳转到登录页面
		request.getRequestDispatcher("/frame/login.jsp").forward(request, response);
		//response.sendRedirect("localhost:8080/frame/login.jsp");
		return false;
	}

	/**
	 * Handler执行之后，ModelAndView返回之前调用这个方法 
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	/**
	 *  Handler执行完成之后调用这个方法 
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
