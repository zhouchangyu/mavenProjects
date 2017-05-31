package com.project.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.project.common.pojo.ToEasyuiDataGridJson;
import com.project.common.pojo.ToJson;
import com.project.pojo.Tbmaoyi;
import com.project.pojo.ToDataGridModel;

public interface TbMaoyiService {

	ToJson insert(Tbmaoyi maoyi);

	ToEasyuiDataGridJson getList(ToDataGridModel model);

	ToJson getListById(Long id);

	ToJson update(Tbmaoyi data);

	void exportExcel(Map<String, String> params, HttpServletResponse reponse);

	 
}
