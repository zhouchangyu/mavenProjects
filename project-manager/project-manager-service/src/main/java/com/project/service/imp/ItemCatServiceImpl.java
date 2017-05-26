package com.project.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.pojo.EUTreeNode;
import com.project.mapper.TbItemCatMapper;
import com.project.pojo.TbItemCat;
import com.project.pojo.TbItemCatExample;
import com.project.pojo.TbItemCatExample.Criteria;
import com.project.service.ItemCatService;


/**
 * <p>Title: ItemCatServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月17日下午10:01:30
 * @version 1.0
 */
@Service
public class ItemCatServiceImpl implements ItemCatService {

	@Autowired
	private TbItemCatMapper tbitemCatMapper;
	
	@Override
	public List<EUTreeNode> getCatList(long parentId) {
		
		//创建查询条件
		TbItemCatExample example = new TbItemCatExample();
		 Criteria create = example.createCriteria();
		create.andParentIdEqualTo(parentId);
		//创建查询条件
		List<TbItemCat> list = tbitemCatMapper.selectByExample(example);
		List<EUTreeNode> resultList = new ArrayList<>();
		//把列表转换成trreeNodeList
		for(TbItemCat itItemCat : list){
			EUTreeNode node = new EUTreeNode();
			node.setId(itItemCat.getId());
			node.setText(itItemCat.getName());
			node.setState(itItemCat.getIsParent()?"closed" : "open");
			resultList.add(node);
		}
		return resultList;
	}

}
