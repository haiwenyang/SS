package com.sise.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sise.categoryDao.CategoryDao;


public class TestApp {
   @Test
   public void demo(){
	  
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");//读取bean.xml中的内容
	   CategoryDao categoryDao=(CategoryDao)ctx.getBean("categoryDao");
	   System.out.println(categoryDao.queryForPage(2, 1).getTotalPages(1, 0));
   }
}
