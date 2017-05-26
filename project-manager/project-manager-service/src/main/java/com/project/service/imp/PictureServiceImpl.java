package com.project.service.imp;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.utils.FtpUtil;
import com.project.common.utils.IDUtils;
import com.project.service.PictureService;

@Service
public class PictureServiceImpl implements PictureService {
	/*
	 * 读取properties里边的内容
	 */
	@Value("${FTP_ADDRESS}")
	private String FTP_ADDRESS;
	@Value("${FTP_PORT}")
	private int FTP_PORT;
	@Value("${FTP_USERNAME}")
	private String FTP_USERNAME;
	@Value("${FTP_PASSWORD}")
	private String FTP_PASSWORD;
	@Value("${FTP_BASE_PATH}")
	private String FTP_BASE_PATH;
	@Value("${IMAGE_BASE_URL}")
	private String IMAGE_BASE_URL;
	@Override
	public Map uploadPicture(MultipartFile uploadFile) {
		Map resultMap = new HashMap<>();
		try {
			//生成一个新的文件名
				//去原始的文件名
			String oldName = uploadFile.getOriginalFilename();
			//UUID.randomUUID();
			String newName = IDUtils.genImageName();
			newName = newName + oldName.substring(oldName.lastIndexOf("."));
			String imagePath = new DateTime().toString("yyyy/MM/dd");
			boolean result = FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD,
					FTP_BASE_PATH,imagePath , newName, uploadFile.getInputStream());
			//返回结果
			if(!result){
				resultMap.put("error", 1);
				resultMap.put("message", "文件上传失败！");
			return resultMap;
			}
			resultMap.put("error",0);
			String path =IMAGE_BASE_URL+"/"+imagePath+"/"+newName;
			resultMap.put("url",path);
			return resultMap;
		} catch (IOException e) {
			resultMap.put("error", 1);
			resultMap.put("message", "文件上传失败！");
			return resultMap;
		}
	 
	}

}
