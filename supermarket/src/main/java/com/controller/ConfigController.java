
package com.controller;


import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.ConfigEntity;
import com.service.ConfigService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.ValidatorUtils;

/**
 * 登录相关
 */
@RequestMapping("config")
@RestController//=@Controller+@ResponseBody,提供更简洁的方式编写处理HTTP请求并返回响应的控制器
public class ConfigController{
	
	@Autowired//标注在构造器、方法、参数及字段和派生注解上，准确控制注入
	private ConfigService configService;

	/**
     * 列表
     */
    @RequestMapping("/page")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R page(@RequestParam Map<String, Object> params,ConfigEntity config){
        EntityWrapper<ConfigEntity> ew = new EntityWrapper<ConfigEntity>();
    	PageUtils page = configService.queryPage(params);
        return R.ok().put("data", page);
    }
    
	/**
     * 列表
     */
    @IgnoreAuth//忽略权限校验方法注解
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ConfigEntity config){
        EntityWrapper<ConfigEntity> ew = new EntityWrapper<ConfigEntity>();
    	PageUtils page = configService.queryPage(params);
        return R.ok().put("data", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        ConfigEntity config = configService.selectById(id);
        return R.ok().put("data", config);
    }
    
    /**
     * 详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        ConfigEntity config = configService.selectById(id);
        return R.ok().put("data", config);
    }
    
    /**
     * 根据name获取信息
     */
    @RequestMapping("/info")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R infoByName(@RequestParam String name){
        ConfigEntity config = configService.selectOne(new EntityWrapper<ConfigEntity>().eq("name", "faceFile"));
        return R.ok().put("data", config);
    }
    
    /**
     * 保存
     */
    @PostMapping("/save")//声明post请求处理方法注解
    //处理客户端发送的post请求
    public R save(@RequestBody ConfigEntity config){
//    	ValidatorUtils.validateEntity(config);
    	configService.insert(config);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R update(@RequestBody ConfigEntity config){
//        ValidatorUtils.validateEntity(config);
        configService.updateById(config);//全部更新
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
    	configService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}
