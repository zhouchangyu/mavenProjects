package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.ItemParamItemService;


/**
 * 展示商品规格参数
 * <p>Title: ItemParamItemContoller</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月22日下午9:53:41
 * @version 1.0
 */
@Controller
public class ItemParamItemContoller {

	@Autowired
	private ItemParamItemService itemParamItemService;
	
	@RequestMapping("/showitem/{itemId}")
	public String showItemParam(@PathVariable Long itemId,Model model){
		String string = itemParamItemService.getItemParamByItemId(itemId);
		model.addAttribute("itemParam",string);
		return "item";
	}
	
}
