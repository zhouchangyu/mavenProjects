package com.project.service;

import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.pojo.TbItem;

public interface ItemService {

	TbItem getItemById(Long id);
	EUDataGridResult getItemList(int page,int rows);
	TaotaoResult  createItem(TbItem item,String desc,String itemParam) throws Exception;
}
