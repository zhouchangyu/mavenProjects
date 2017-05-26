package com.project.service;

import java.util.List;

import com.project.common.pojo.EUTreeNode;

public interface ItemCatService {
 
	List<EUTreeNode> getCatList(long parentId);
}
