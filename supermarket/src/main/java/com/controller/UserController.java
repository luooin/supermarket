
package com.controller;


import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.TokenEntity;
import com.entity.UserEntity;
import com.service.TokenService;
import com.service.UserService;
import com.utils.CommonUtil;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.ValidatorUtils;

/**
 * 登录相关
 */
@RequestMapping("users")//处理请求地址映射的注解，表示类中所有请求方法都以该地址为父路径
@RestController//=@Controller+@ResponseBody,提供更简洁的方式编写处理HTTP请求并返回响应的控制器
public class UserController{
	
	@Autowired//标注在构造器、方法、参数及字段和派生注解上，准确控制注入
	private UserService userService;
	
	@Autowired
	private TokenService tokenService;

	/**
	 * 登录
	 */
	@IgnoreAuth//忽略权限校验方法注解
	@PostMapping(value = "/login")//声明post请求处理方法注解
	public R login(String username, String password, String captcha, HttpServletRequest request) {
		UserEntity user = userService.selectOne(new EntityWrapper<UserEntity>().eq("username", username));
		if(user==null || !user.getPassword().equals(password)) {
			return R.error("账号或密码不正确");
		}
		String token = tokenService.generateToken(user.getId(),username, "users", user.getRole());
		return R.ok().put("token", token);
	}
	
	/**
	 * 注册
	 */
	@IgnoreAuth
	@PostMapping(value = "/register")
	public R register(@RequestBody UserEntity user){
//    	ValidatorUtils.validateEntity(user);
    	if(userService.selectOne(new EntityWrapper<UserEntity>().eq("username", user.getUsername())) !=null) {
    		return R.error("用户已存在");
    	}
        userService.insert(user);
        return R.ok();
    }

	/**
	 * 退出
	 */
	@GetMapping(value = "logout")//定义HTTP GET请求的URL路径
	public R logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return R.ok("退出成功");
	}
	
	/**
     * 密码重置
     */
    @IgnoreAuth
	@RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request){
    	UserEntity user = userService.selectOne(new EntityWrapper<UserEntity>().eq("username", username));
    	if(user==null) {
    		return R.error("账号不存在");
    	}
    	user.setPassword("123456");
        userService.update(user,null);
        return R.ok("密码已重置为：123456");
    }
	
	/**
     * 列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,UserEntity user){
        EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
    	PageUtils page = userService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.allLike(ew, user), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/list")
    public R list( UserEntity user){
       	EntityWrapper<UserEntity> ew = new EntityWrapper<UserEntity>();
      	ew.allEq(MPUtil.allEQMapPre( user, "user")); 
        return R.ok().put("data", userService.selectListView(ew));
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        UserEntity user = userService.selectById(id);
        return R.ok().put("data", user);
    }
    
    /**
     * 获取用户的session用户信息
     */
    @RequestMapping("/session")
    public R getCurrUser(HttpServletRequest request){
    	Long id = (Long)request.getSession().getAttribute("userId");
        UserEntity user = userService.selectById(id);
        return R.ok().put("data", user);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserEntity user){
//    	ValidatorUtils.validateEntity(user);
    	if(userService.selectOne(new EntityWrapper<UserEntity>().eq("username", user.getUsername())) !=null) {
    		return R.error("用户已存在");
    	}
        userService.insert(user);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody UserEntity user){
//        ValidatorUtils.validateEntity(user);
        userService.updateById(user);//全部更新
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        userService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}
