package com.project.service.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.pojo.EUTreeNode;
import com.project.common.pojo.TaotaoResult;
import com.project.mapper.TbContentCategoryMapper;
import com.project.pojo.TbContentCategory;
import com.project.pojo.TbContentCategoryExample;
import com.project.pojo.TbContentCategoryExample.Criteria;
import com.project.service.ContentCategoryService;
 


/**
 * 内容分类管理
 * <p>Title: ContentCategoryServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月25日下午12:32:50
 * @version 1.0
 */
@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

	@Autowired
	private TbContentCategoryMapper contentCategoryMapper;
	@Override
	public List<EUTreeNode> getCategoryList(long parentId) {
		//根据parentId查询节点列表
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbContentCategory> list = contentCategoryMapper.selectByExample(example);
		List<EUTreeNode> resultList = new ArrayList<>();
		for(TbContentCategory tbContentCategory:list){
			//创建一个节点
			EUTreeNode node = new EUTreeNode();
			node.setId(tbContentCategory.getId());
			node.setText(tbContentCategory.getName());
			node.setState(tbContentCategory.getIsParent()?"closed":"open");
			resultList.add(node);
		}
		return resultList;
	}
	@Override
	public TaotaoResult insertContentCategroy(long parentId, String name) {
		
		//创建pojo
		TbContentCategory tbContentCategory= new TbContentCategory();
		tbContentCategory.setIsParent(false);
		tbContentCategory.setName(name);
		//状态 1为正常 2为删除
		tbContentCategory.setStatus(1);
		tbContentCategory.setParentId(parentId);
		tbContentCategory.setSortOrder(1);
		tbContentCategory.setCreated(new Date());
		tbContentCategory.setUpdated(new Date());
		//添加记录
		contentCategoryMapper.insert(tbContentCategory);
		//查看父节点的isParent列 是否为true,如果不为ture则改成ture
		TbContentCategory parentCat = contentCategoryMapper.selectByPrimaryKey(parentId);
		if(!parentCat.getIsParent()){
			parentCat.setIsParent(true);
			contentCategoryMapper.updateByPrimaryKey(parentCat);
		}
		//返回结果
		return TaotaoResult.ok(tbContentCategory);
	}
	@Override
	public TaotaoResult deleteContentCategroy(Long id) {
		//删除当前数据
		TbContentCategory selectByPrimaryKey = contentCategoryMapper.selectByPrimaryKey(id);
		long parentId = selectByPrimaryKey.getParentId();
		contentCategoryMapper.deleteByPrimaryKey(id);
		//查询父节点是否还有子节点
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbContentCategory> list = contentCategoryMapper.selectByExample(example);
		if(list.size()==0){
			TbContentCategory category = new TbContentCategory();
			category.setId(id);
			category.setIsParent(false);	
			contentCategoryMapper.updateByPrimaryKeySelective(category);
		}
		return TaotaoResult.ok();
	}
	@Override
	public TaotaoResult updateContentCategroy(String name, Long id) {
		TbContentCategory category = new TbContentCategory();
		category.setId(id);
		category.setName(name);
		contentCategoryMapper.updateByPrimaryKeySelective(category);
		
		return TaotaoResult.ok();
	}

}
