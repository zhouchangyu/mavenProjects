package com.project.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.utils.JsonUtils;
import com.project.service.PictureService;


/**
 * <p>Title: PictureController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	zcy
 * @date	2017年2月18日下午7:04:46
 * @version 1.0
 */
@Controller
public class PictureController {

	@Autowired
	private PictureService pictureService;
	
	@RequestMapping("/pic/upload")
	@ResponseBody
	private String pictureUpload(MultipartFile uploadFile){
		Map reslut = pictureService.uploadPicture(uploadFile);
		//为了保证功能的兼容性，把返回的数据准换成json
		String json = JsonUtils.objectToJson(reslut);
		return json;
	}
}
