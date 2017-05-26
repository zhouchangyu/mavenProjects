package com.project.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.utils.JsonUtils;
import com.project.mapper.TbItemParamItemMapper;
import com.project.pojo.TbItemParamItem;
import com.project.pojo.TbItemParamItemExample;
import com.project.pojo.TbItemParamItemExample.Criteria;
import com.project.service.ItemParamItemService;

/**
 * 查询商品规格参数
 * <p>Title: ItemParamItemServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月22日上午9:43:48
 * @version 1.0
 */
@Service
public class ItemParamItemServiceImpl implements ItemParamItemService {

	@Autowired
	private TbItemParamItemMapper itemParamItemMapper;
	@Override
	public String getItemParamByItemId(Long itemId) {
		TbItemParamItemExample example = new TbItemParamItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andItemIdEqualTo(itemId);
		//执行查询
		List<TbItemParamItem> list = itemParamItemMapper.selectByExampleWithBLOBs(example);
		if(list==null&&list.size()==0){
			return "";
		}
		//取参数信息
		TbItemParamItem itemParamItem = list.get(0);
		String paramData = itemParamItem.getParamData();
		//生成html
		//把规格参数json数据转换成list格式
		List<Map> jsonToList = JsonUtils.jsonToList(paramData, Map.class);
		StringBuffer sb = new StringBuffer(); 
		sb.append("<table cellpadding=\"0\" cellspacing=\"1\" width=\"100%\" border=\"0\" class=\"Ptable\">\n");
		sb.append("    <tbody>\n");
		for(Map m1:jsonToList){
			sb.append("			<tr>\n");
			sb.append("				<th class=\"tdTile\" colspan=\"2\">"+m1.get("group")+"</th>");
			sb.append("			</tr>\n");
			List<Map> list2 = (List<Map>)m1.get("params");
			for(Map m2:list2){
				sb.append("			<tr>\n");
				sb.append("				<td class=\"tdTile\" colspan=\"2\">"+m2.get("k")+"</td>");
				sb.append("				<td>"+m2.get("v")+"</td>\n");
			}
		sb.append("			</tr>\n");
		}
		sb.append("    </tbody>\n");
		sb.append("</table>\n");
		return sb.toString();
	}

}
