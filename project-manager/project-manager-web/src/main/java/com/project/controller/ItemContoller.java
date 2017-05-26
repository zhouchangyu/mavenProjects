package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.pojo.TbItem;
import com.project.service.ItemService;

/**
 * <p>Title: ItemContoller</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月16日上午12:19:08
 * @version 1.0
 */
@Controller	
public class ItemContoller {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/item/{itemId}")
	@ResponseBody
	private TbItem geItemById(@PathVariable Long itemId){
		TbItem item = itemService.getItemById(itemId);
		return item;
	}
	@RequestMapping("/item/list")
	@ResponseBody
	private EUDataGridResult geItemList(Integer page ,Integer rows){
		EUDataGridResult result = itemService.getItemList(page, rows);
		return result;
	}
	//使用pojo接收数据是pojo中的属性要和表单中的name一致
	@RequestMapping(value="/item/save",method=RequestMethod.POST)
	@ResponseBody
	private TaotaoResult createItem(TbItem item,String desc,String itemParams) throws Exception{
		 TaotaoResult result  = itemService.createItem(item,desc, itemParams);
		return result;
	}
}
