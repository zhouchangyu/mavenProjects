package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.TaotaoResult;
import com.project.mapper.TbmaoyiMapper;
import com.project.pojo.Tbmaoyi;

/**
 * <p>Title: tbMaoyiController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年5月27日下午2:54:13
 * @version 1.0
 */
@Controller
public class tbMaoyiController {
 
	@Autowired
	private TbmaoyiMapper mapper;
	
	@RequestMapping("/item/iNsert")
	@ResponseBody
	private TaotaoResult geItemList(HttpServletRequest request){
		Tbmaoyi data = new Tbmaoyi();
		data.setAddress("aasdfas");
		data.setCarnum("adsfasdf");
		mapper.insert(data);
		return TaotaoResult.ok();
	}
}


