package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.EUTreeNode;
import com.project.common.pojo.TaotaoResult;
import com.project.service.ContentCategoryService;


/**
 * 内容分类管理
 * <p>Title: ContenCategoryController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月25日下午12:47:14
 * @version 1.0
 */
@Controller		  
@RequestMapping("/content/category")
public class ContenCategoryController {

	@Autowired
	private ContentCategoryService contentCategoryService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<EUTreeNode> getContentCatList(@RequestParam(value="id",defaultValue="0")Long parentId){
		List<EUTreeNode> list = contentCategoryService.getCategoryList(parentId);
		return list;
	}
	@RequestMapping("/create")
	@ResponseBody
	public TaotaoResult createContenCategory(Long parentId,String name){
		TaotaoResult result = contentCategoryService.insertContentCategroy(parentId, name);
		return result;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public TaotaoResult createContentCategory(Long id){
		TaotaoResult result = contentCategoryService.deleteContentCategroy(id);
		return result;
	}
	@RequestMapping("/update")
	@ResponseBody
	public TaotaoResult createContentCategory(String name,Long id){
		TaotaoResult result = contentCategoryService.updateContentCategroy(name, id);
		return result;
	}
	
}
