package com.project.service.imp;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.mapper.TbContentMapper;
import com.project.pojo.TbContent;
import com.project.pojo.TbContentExample;
import com.project.pojo.TbContentExample.Criteria;
import com.project.service.ContentService;

/**
 * 内容管理
 * <p>Title: ContentServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月25日下午10:33:41
 * @version 1.0
 */
@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	private TbContentMapper contentMapper;
	@Override
	public EUDataGridResult getContentList(int page, int rows,Long categoryId) {
		//创建EUDataGridResult返回对象
		EUDataGridResult result = new EUDataGridResult();
		//查询列表数据
		TbContentExample example = new TbContentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(categoryId);
		List<TbContent> list = contentMapper.selectByExample(example);
		result.setRows(list);
		//设置分类
		PageHelper.startPage(page, rows);
		PageInfo<TbContent> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	@Override
	public TaotaoResult insertContent(TbContent content) {
		content.setCreated(new Date());
		content.setUpdated(new Date());
		contentMapper.insert(content);
		return TaotaoResult.ok();
	}

}
