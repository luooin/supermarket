package com.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 登录用户信息
 */

//注解作用目标
@Target(ElementType.PARAMETER)//方法参数

//注解保留位置
@Retention(RetentionPolicy.RUNTIME)//Annotations将被JVM保留，运行时被JVM或使用反射机制的代码读取使用
public @interface APPLoginUser {

}
