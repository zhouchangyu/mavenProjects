package com.project.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.ToEasyuiDataGridJson;
import com.project.common.pojo.ToJson;
import com.project.common.utils.JsonUtils;
import com.project.pojo.Tbmaoyi;
import com.project.pojo.ToDataGridModel;
import com.project.service.TbMaoyiService;

/**
 * 贸易数据管理
 * <p>Title: tbMaoyiController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年5月27日下午2:54:13
 * @version 1.0
 */
@Controller
@RequestMapping("/maoyi")
public class TbMaoyiController {
 
	@Autowired
	private TbMaoyiService maoYiService;
	
	@RequestMapping("/addOrUpdata")
	@ResponseBody
	private ToJson insert(HttpServletRequest request,Tbmaoyi data){
		ToJson json =null;
		if(null!=data.getId()&&!"".equals(data.getId())){
			 json =maoYiService.update(data); 
		}else{
			 json =maoYiService.insert(data);
		}
		return json;
	}
	
	@RequestMapping("/getList")
	@ResponseBody
	private ToEasyuiDataGridJson getList(HttpServletRequest request,ToDataGridModel model){
		ToEasyuiDataGridJson json =maoYiService.getList(model);
		return json;
	}
	
	@RequestMapping("/getListById")
	@ResponseBody
	private ToJson getListById(HttpServletRequest request){
		Long id = Long.parseLong(request.getParameter("id"));
		ToJson json =maoYiService.getListById(id);
		return json;
	}
	
	@RequestMapping("/exportExcelRece")
	@ResponseBody
	private void exportExcelRece(HttpServletRequest request,HttpServletResponse reponse){
		String para=request.getParameter("params");
		Map<String,String> params = JsonUtils.JsonStr2Map(para);
		maoYiService.exportExcel(params,reponse); 
	}
}


