package com.project.service;

import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.pojo.TbContent;

public interface ContentService {

	EUDataGridResult getContentList(int page,int rows,Long categoryId);
	TaotaoResult insertContent(TbContent content);
}
