package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.JiaoliuhuifuEntity;
import com.entity.view.JiaoliuhuifuView;

import com.service.JiaoliuhuifuService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 交流回复
 * 后端接口
 * @author 
 * @email 
 * @date 2021-03-10 17:20:00
 */
@RestController//=@Controller+@ResponseBody,提供更简洁的方式编写处理HTTP请求并返回响应的控制器
@RequestMapping("/jiaoliuhuifu")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
public class JiaoliuhuifuController {
    @Autowired//标注在构造器、方法、参数及字段和派生注解上，准确控制注入
    private JiaoliuhuifuService jiaoliuhuifuService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R page(@RequestParam Map<String, Object> params,JiaoliuhuifuEntity jiaoliuhuifu, 
		HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yuangong")) {
			jiaoliuhuifu.setGonghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<JiaoliuhuifuEntity> ew = new EntityWrapper<JiaoliuhuifuEntity>();
    	PageUtils page = jiaoliuhuifuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiaoliuhuifu), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R list(@RequestParam Map<String, Object> params,JiaoliuhuifuEntity jiaoliuhuifu, HttpServletRequest request){
        EntityWrapper<JiaoliuhuifuEntity> ew = new EntityWrapper<JiaoliuhuifuEntity>();
    	PageUtils page = jiaoliuhuifuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiaoliuhuifu), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R list( JiaoliuhuifuEntity jiaoliuhuifu){
       	EntityWrapper<JiaoliuhuifuEntity> ew = new EntityWrapper<JiaoliuhuifuEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jiaoliuhuifu, "jiaoliuhuifu")); 
        return R.ok().put("data", jiaoliuhuifuService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R query(JiaoliuhuifuEntity jiaoliuhuifu){
        EntityWrapper< JiaoliuhuifuEntity> ew = new EntityWrapper< JiaoliuhuifuEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jiaoliuhuifu, "jiaoliuhuifu")); 
		JiaoliuhuifuView jiaoliuhuifuView =  jiaoliuhuifuService.selectView(ew);
		return R.ok("查询交流回复成功").put("data", jiaoliuhuifuView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R info(@PathVariable("id") Long id){
        JiaoliuhuifuEntity jiaoliuhuifu = jiaoliuhuifuService.selectById(id);
        return R.ok().put("data", jiaoliuhuifu);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R detail(@PathVariable("id") Long id){
        JiaoliuhuifuEntity jiaoliuhuifu = jiaoliuhuifuService.selectById(id);
        return R.ok().put("data", jiaoliuhuifu);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiaoliuhuifuEntity jiaoliuhuifu, HttpServletRequest request){
    	jiaoliuhuifu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiaoliuhuifu);

        jiaoliuhuifuService.insert(jiaoliuhuifu);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R add(@RequestBody JiaoliuhuifuEntity jiaoliuhuifu, HttpServletRequest request){
    	jiaoliuhuifu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiaoliuhuifu);

        jiaoliuhuifuService.insert(jiaoliuhuifu);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody JiaoliuhuifuEntity jiaoliuhuifu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiaoliuhuifu);
        jiaoliuhuifuService.updateById(jiaoliuhuifu);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R delete(@RequestBody Long[] ids){
        jiaoliuhuifuService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<JiaoliuhuifuEntity> wrapper = new EntityWrapper<JiaoliuhuifuEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yuangong")) {
			wrapper.eq("gonghao", (String)request.getSession().getAttribute("username"));
		}

		int count = jiaoliuhuifuService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
