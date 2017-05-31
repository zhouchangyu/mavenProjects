package com.project.weframe.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ToRequestFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		//获取请求url
		String qUri = ((HttpServletRequest) request).getRequestURI();
		//URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
		if (qUri.endsWith("/")) {
			qUri += "index.jsp";
		}
		if ((qUri.endsWith(".jsp") || qUri.endsWith(".action"))){
					
			String username =(String)session.getAttribute("username");
			if(null!=username||"/systemAction/login.action".equals(qUri)||"/frame/login.jsp".equals(qUri)){
			
			}else{
				request.getRequestDispatcher("/frame/login.jsp").forward(request, response);
				
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
