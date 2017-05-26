package com.project.service;

import java.util.List;

import com.project.common.pojo.EUTreeNode;
import com.project.common.pojo.TaotaoResult;


public interface ContentCategoryService {

	List<EUTreeNode> getCategoryList(long parentId);
	TaotaoResult insertContentCategroy(long parentId,String name);
	TaotaoResult deleteContentCategroy(Long id);
	TaotaoResult updateContentCategroy(String name,Long id);
}
