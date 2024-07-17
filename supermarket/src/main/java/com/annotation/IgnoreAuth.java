package com.annotation;

import java.lang.annotation.*;

/**
 * 忽略Token验证
 */
//注解的作用目标
@Target(ElementType.METHOD)//方法

//注解的保留位置
@Retention(RetentionPolicy.RUNTIME)//Annotations将被JVM保留，运行时被JVM或使用反射机制的代码读取使用
@Documented//元注解，修饰其他注解
public @interface IgnoreAuth {

}
