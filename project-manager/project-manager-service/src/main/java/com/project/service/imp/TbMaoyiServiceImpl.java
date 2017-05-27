package com.project.service.imp;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.project.common.pojo.ToEasyuiDataGridJson;
import com.project.common.pojo.ToJson;
import com.project.mapper.TbmaoyiMapper;
import com.project.pojo.Tbmaoyi;
import com.project.pojo.TbmaoyiExample;
import com.project.pojo.TbmaoyiExample.Criteria;
import com.project.pojo.ToDataGridModel;
import com.project.service.TbMaoyiService;

@Service
public class TbMaoyiServiceImpl implements TbMaoyiService {

	@Autowired
	private TbmaoyiMapper mapper; 
	
	@Override
	public ToJson insert(Tbmaoyi maoyi) {
		ToJson json = new ToJson();
		maoyi.setCreated(new Date().toString());
		mapper.insert(maoyi);
		json.setRtState(true);
		return json;
	}
	@Override
	public ToJson update(Tbmaoyi data) {
		ToJson json = new ToJson();
		mapper.updateByPrimaryKey(data);
		json.setRtState(true);
		return json;
	}
	@Override
	public ToEasyuiDataGridJson getList(ToDataGridModel model) {
		TbmaoyiExample example = new TbmaoyiExample();
		int page = model.getPage();
		int row = model.getRows();
		PageHelper.startPage(page,row);//设置分页
		ToEasyuiDataGridJson json = new ToEasyuiDataGridJson();
		List<Tbmaoyi> list = mapper.selectByExample(example);
		json.setRows(list);
		//记录总条数
		PageInfo<Tbmaoyi> pageInfo = new PageInfo<Tbmaoyi>(list);
		json.setTotal(pageInfo.getTotal());
		return json;
	}

	@Override
	public ToJson getListById(Long id) {
		ToJson json = new ToJson();
		Tbmaoyi maoyi = mapper.selectByPrimaryKey(id);
		json.setRtState(true);
		json.setRtData(maoyi);;
		return json;
	}
	 
	public <HttpServletResponse> ToJson getListById(String para,HttpServletResponse response) {
		TbmaoyiExample example = new TbmaoyiExample();
		Criteria createCriteria = example.createCriteria();
		List<Long> list= new ArrayList<>();
		list.add(Long.parseLong(para));
		createCriteria.andIdIn(list);
		List<Tbmaoyi> resultList = mapper.selectByExample(example);
		exportExcelReceive(response,resultList);
		return null;
	}
	public <HttpServletResponse> void exportExcelReceive(HttpServletResponse response,List  resultList) {
		// 获取当前时间
		Calendar c = Calendar.getInstance();
		String time = "[" + c.get(Calendar.YEAR) + (c.get(Calendar.MONTH) + 1)
				+ c.get(Calendar.DAY_OF_MONTH) + c.get(Calendar.HOUR_OF_DAY)
				+ c.get(Calendar.MINUTE) + "]";

		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("拟稿夹列表信息");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFFont font = wb.createFont();
			font.setFontHeightInPoints((short) 12); // 字体高度
			font.setColor(HSSFFont.COLOR_NORMAL); // 字体颜色
			font.setFontName("宋体"); // 字体
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 宽度
			font.setItalic(false); // 是否使用斜体
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
			style.setFont(font);

			HSSFFont font1 = wb.createFont();
			font1.setFontHeightInPoints((short) 12); // 字体高度
			font1.setColor(HSSFFont.COLOR_NORMAL); // 字体颜色
			font1.setFontName("宋体"); // 字体
			font1.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL); // 宽度
			font1.setItalic(false); // 是否使用斜体
			HSSFCellStyle style1 = wb.createCellStyle();
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
			style1.setFont(font1);

			HSSFCell cell = row.createCell((short) 0);
			List<String> head=new ArrayList<String>();
			// 设置表头
			cell.setCellValue("标题");
			cell.setCellStyle(style);
			cell = row.createCell((short) (1));
					
			cell.setCellValue("总收文字号");
			cell.setCellStyle(style);
			cell = row.createCell((short) (2));
					
			cell.setCellValue("文件字号");
			cell.setCellStyle(style);
			cell = row.createCell((short) (3));
					
			cell.setCellValue("密级");
			cell.setCellStyle(style);
			cell = row.createCell((short) (4));
			
			cell.setCellValue("缓急");
			cell.setCellStyle(style);
			cell = row.createCell((short) (5));
			
			cell.setCellValue("登记人");
			cell.setCellStyle(style);
			cell = row.createCell((short) (6));
			
			cell.setCellValue("登记时间");
			cell.setCellStyle(style);
			cell = row.createCell((short) (7));
			
			/*cell.setCellValue("登记状态");
			cell.setCellStyle(style);
			cell = row.createCell((short) (8));*/
			
			head.add("TITLE");
			head.add("RECEIVEDOCID");
			head.add("MAINDOCID");
			head.add("DENSE");
			head.add("URGENCY");
			head.add("REGISTENT");
			head.add("STARTDATE");
			//head.add("STATE");
		 
			// 设置内容
			Map map=new HashMap();
			for (int m = 0; m < resultList.size(); m++) {
				HSSFRow r = sheet.createRow((int) (m + 1));
                map=(Map) resultList.get(m);
				for (int n = 0; n <head.size(); n++) {
					cell = r.createCell((short) (n));
					cell.setCellValue(TeeStringUtil.getString(map.get(head.get(n))));
					cell.setCellStyle(style1);
				}
			}

			// 设置每一列的宽度
			sheet.setDefaultColumnWidth(10);
			String fileName = "列表信息" + time + ".xls";
			response.setHeader("Content-disposition", "attachment;filename="
					+ URLEncoder.encode(fileName, "UTF-8"));
			response.setContentType("application/msexcel;charset=UTF-8");
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
