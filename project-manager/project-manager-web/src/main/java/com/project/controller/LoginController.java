package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.ToJson;

@Controller
@RequestMapping("/systemAction")
public class LoginController {

	@RequestMapping("/login")
	@ResponseBody
	public ToJson login(HttpServletRequest request){
		ToJson json = new ToJson();
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		if(null!=username&&!"".equals(username)){
			request.getSession().setAttribute("username", username);
		}
		json.setRtState(true);
		return json;
	}
}
