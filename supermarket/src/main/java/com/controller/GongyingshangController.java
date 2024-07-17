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

import com.entity.GongyingshangEntity;
import com.entity.view.GongyingshangView;

import com.service.GongyingshangService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 供应商
 * 后端接口
 * @author 
 * @email 
 * @date 2021-03-10 17:20:00
 */
@RestController//=@Controller+@ResponseBody,提供更简洁的方式编写处理HTTP请求并返回响应的控制器
@RequestMapping("/gongyingshang")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
public class GongyingshangController {
    @Autowired//标注在构造器、方法、参数及字段和派生注解上，准确控制注入
    private GongyingshangService gongyingshangService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,GongyingshangEntity gongyingshang, 
		HttpServletRequest request){

        EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();
    	PageUtils page = gongyingshangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gongyingshang), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R list(@RequestParam Map<String, Object> params,GongyingshangEntity gongyingshang, HttpServletRequest request){
        EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();//条件构造器
    	PageUtils page = gongyingshangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gongyingshang), params), params));//分页工具类
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R list( GongyingshangEntity gongyingshang){
       	EntityWrapper<GongyingshangEntity> ew = new EntityWrapper<GongyingshangEntity>();//条件构造器
      	ew.allEq(MPUtil.allEQMapPre( gongyingshang, "gongyingshang")); 
        return R.ok().put("data", gongyingshangService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R query(GongyingshangEntity gongyingshang){
        EntityWrapper< GongyingshangEntity> ew = new EntityWrapper< GongyingshangEntity>();
 		ew.allEq(MPUtil.allEQMapPre( gongyingshang, "gongyingshang")); 
		GongyingshangView gongyingshangView =  gongyingshangService.selectView(ew);
		return R.ok("查询供应商成功").put("data", gongyingshangView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R info(@PathVariable("id") Long id){
        GongyingshangEntity gongyingshang = gongyingshangService.selectById(id);
        return R.ok().put("data", gongyingshang);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R detail(@PathVariable("id") Long id){
        GongyingshangEntity gongyingshang = gongyingshangService.selectById(id);
        return R.ok().put("data", gongyingshang);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R save(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
    	gongyingshang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(gongyingshang);

        gongyingshangService.insert(gongyingshang);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R add(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
    	gongyingshang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(gongyingshang);

        gongyingshangService.insert(gongyingshang);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R update(@RequestBody GongyingshangEntity gongyingshang, HttpServletRequest request){
        //ValidatorUtils.validateEntity(gongyingshang);
        gongyingshangService.updateById(gongyingshang);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
    public R delete(@RequestBody Long[] ids){
        gongyingshangService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<GongyingshangEntity> wrapper = new EntityWrapper<GongyingshangEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = gongyingshangService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	

}
