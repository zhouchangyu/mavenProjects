package com.project.service.imp;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.pojo.TaotaoResult;
import com.project.mapper.TbItemParamMapper;
import com.project.pojo.TbItemParam;
import com.project.pojo.TbItemParamExample;
import com.project.pojo.TbItemParamExample.Criteria;
import com.project.service.ItemParamService;

@Service
public class ItemParamServiceImpl implements ItemParamService {

	@Autowired
	private TbItemParamMapper itemParamMapper;
	
	@Override
	public TaotaoResult getItemParaByCid(long cid) {
		TbItemParamExample example = new TbItemParamExample();
		Criteria criteria = example.createCriteria();
		criteria.andItemCatIdEqualTo(cid);
		//大文本类型
		List<TbItemParam> list = itemParamMapper.selectByExampleWithBLOBs(example);
		//判断是否有结果
		if(list !=null&&list.size()>0){
			return TaotaoResult.ok(list.get(0));
		}
		return TaotaoResult.ok();
	}

	@Override
	public TaotaoResult insertItemParam(TbItemParam itemParam) {
		//补全对像
		itemParam.setCreated(new Date());
		itemParam.setUpdated(new Date());
		//插入数据
		itemParamMapper.insert(itemParam);
		return TaotaoResult.ok();
	}

}
