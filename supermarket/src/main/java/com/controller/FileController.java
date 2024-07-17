package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.ConfigEntity;
import com.entity.EIException;
import com.service.ConfigService;
import com.utils.R;

/**
 * 上传文件映射表
 */
@RestController//=@Controller+@ResponseBody,提供更简洁的方式编写处理HTTP请求并返回响应的控制器
@RequestMapping("file")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
@SuppressWarnings({"unchecked","rawtypes"})
public class FileController{
	@Autowired//标注在构造器、方法、参数及字段和派生注解上，准确控制注入
    private ConfigService configService;
	/**
	 * 上传文件
	 */
	@RequestMapping("/upload")
	public R upload(@RequestParam("file") MultipartFile file, String type,HttpServletRequest request) throws Exception {
		if (file.isEmpty()) {
			throw new EIException("上传文件不能为空");
		}
		String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String fileName = new Date().getTime()+"."+fileExt;
		File dest = new File(request.getSession().getServletContext().getRealPath("/upload")+"/"+fileName);
		file.transferTo(dest);
		if(StringUtils.isNotBlank(type) && type.equals("1")) {
			ConfigEntity configEntity = configService.selectOne(new EntityWrapper<ConfigEntity>().eq("name", "faceFile"));
			if(configEntity==null) {
				configEntity = new ConfigEntity();
				configEntity.setName("faceFile");
				configEntity.setValue(fileName);
			} else {
				configEntity.setValue(fileName);
			}
			configService.insertOrUpdate(configEntity);
		}
		return R.ok().put("file", fileName);
	}
	
	/**
	 * 下载文件
	 */
	@IgnoreAuth//忽略权限校验方法注解
	@RequestMapping("/download")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
	public void download(@RequestParam String fileName, HttpServletRequest request, HttpServletResponse response) {
		try {
			File file = new File(request.getSession().getServletContext().getRealPath("/upload")+"/"+fileName);
			if (file.exists()) {
				response.reset();
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+"\"");
				response.setHeader("Cache-Control", "no-cache");
				response.setHeader("Access-Control-Allow-Credentials", "true");
				response.setContentType("application/octet-stream; charset=UTF-8");
				IOUtils.write(FileUtils.readFileToByteArray(file), response.getOutputStream());
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
