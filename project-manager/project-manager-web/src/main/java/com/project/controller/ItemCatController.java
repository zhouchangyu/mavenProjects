package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.EUTreeNode;
import com.project.service.ItemCatService;


/**
 * <p>Title: ItemCatController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月17日下午10:14:35
 * @version 1.0
 */
@Controller
@RequestMapping("/item/cat")
public class ItemCatController {

	@Autowired
	private ItemCatService itemCatService;
	@RequestMapping("/list")
	@ResponseBody
	private List<EUTreeNode> getCatList(@RequestParam(value ="id",defaultValue="0") long parentId){
		 List<EUTreeNode> list =  itemCatService.getCatList(parentId);
		 return list;
	}
}
