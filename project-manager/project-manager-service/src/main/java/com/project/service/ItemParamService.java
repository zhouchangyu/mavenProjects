package com.project.service;

import com.project.common.pojo.TaotaoResult;
import com.project.pojo.TbItemParam;

public interface ItemParamService {
 TaotaoResult getItemParaByCid(long cid);
 TaotaoResult insertItemParam(TbItemParam itemParam);
}
