package com.project.service.imp;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.common.pojo.EUDataGridResult;
import com.project.common.pojo.TaotaoResult;
import com.project.common.utils.IDUtils;
import com.project.mapper.TbItemDescMapper;
import com.project.mapper.TbItemMapper;
import com.project.mapper.TbItemParamItemMapper;
import com.project.pojo.TbItemExample.Criteria;
import com.project.pojo.TbItem;
import com.project.pojo.TbItemDesc;
import com.project.pojo.TbItemExample;
import com.project.pojo.TbItemParamItem;
import com.project.service.ItemService;

/**
 * <p>Title: ItemServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月15日下午11:54:46
 * @version 1.0
 */
@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper itemMapper;
	@Autowired
	private TbItemDescMapper itemdescMapper;
	@Autowired
	private TbItemParamItemMapper ibItemParamItemMapper;
	@Override
	public TbItem getItemById(Long itemId) {
	//	itemMapper.selectByPrimaryKey(itemId);
		TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> list = itemMapper.selectByExample(example);
		TbItem ibItem = null;
		if(list!=null&&list.size()>0){
			ibItem = list.get(0);
		}
		return ibItem;
	}
	@Override
	public EUDataGridResult getItemList(int page, int rows) {
		//查询商品列表
		TbItemExample example = new TbItemExample();
		//分页 处理
		PageHelper.startPage(page, rows);
		List<TbItem> list = itemMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//记录总条数
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	@Override
	public TaotaoResult createItem(TbItem item,String desc,String itemParam) throws Exception {
		//item补全
		//生成商品id
		Long itemId = IDUtils.genItemId();
		item.setId(itemId);
		//商品的状态，1-正常 2-下架 3-删除
		item.setStatus((byte)1);
		item.setCreated(new Date());
		item.setUpdated(new Date());
		//插入数据库
		int insert = itemMapper.insert(item);
		//添加商品描述信息
		TaotaoResult result = insertItemDesc(itemId,desc);
		if(result.getStatus()!=200){
			//不需要加try catch 只需抛出异常 让spring去捕获 否则spring捕获不到异常事物将不会回滚
			throw new Exception();
		}
		//添加商品规格参数
		result = insertItemParamItem(itemId, itemParam);
		if(result.getStatus()!=200){
			//不需要加try catch 只需抛出异常 让spring去捕获 否则spring捕获不到异常事物将不会回滚
			throw new Exception();
		}
		return TaotaoResult.ok();
	}
	/**
	 * 添加商品描述
	 * <p>Title: insertItemDesc</p>
	 * <p>Description: </p>
	 * @param desc
	 * @return
	 */
	private TaotaoResult insertItemDesc(Long itemId,String desc){
		TbItemDesc itemdesc = new TbItemDesc();
		itemdesc.setItemId(itemId);
		itemdesc.setItemDesc(desc);
		itemdesc.setCreated(new Date());
		itemdesc.setUpdated(new Date());
		itemdescMapper.insert(itemdesc);
		return TaotaoResult.ok();
	}
 

	/**
	 * 添加商品规格信息
	 * <p>Title: insertItemParamItem</p>
	 * <p>Description: </p>
	 * @param itemId
	 * @param intemParam
	 * @return
	 */
	private TaotaoResult insertItemParamItem(long itemId,String itemParam){
		TbItemParamItem itemparamItem = new TbItemParamItem();
		itemparamItem.setItemId(itemId);
		itemparamItem.setParamData(itemParam);
		itemparamItem.setCreated(new Date());
		itemparamItem.setUpdated(new Date());
		//向表中插入数据
		ibItemParamItemMapper.insert(itemparamItem);
		return TaotaoResult.ok();
		
	}
}
