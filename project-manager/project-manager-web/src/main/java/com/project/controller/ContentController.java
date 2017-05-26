package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.pojo.TbContent;
import com.project.service.ContentService;


/**
 * 内容管理
 * <p>Title: ContentController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月25日下午10:41:04
 * @version 1.0
 */
@RequestMapping("/content")
@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/query/list")
	@ResponseBody
	public EUDataGridResult getContentList(int page,int rows,Long categoryId){
		EUDataGridResult resultList = contentService.getContentList(page, rows,categoryId);
		return resultList;
	}
	@RequestMapping("/save")
	@ResponseBody
	public TaotaoResult insertContent(TbContent content){
		TaotaoResult result = contentService.insertContent(content);
		return result;
	}
}
