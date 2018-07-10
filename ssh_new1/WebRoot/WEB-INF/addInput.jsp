<%@page import="com.hibernate.action.CategoryAction"%>
<%@page import="com.sise.hibernate.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
   %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addInput.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <s:form action="addNews" namespace="/s2h">
    <s:textfield name="news.title" label="标题"/>
    <s:if test="categories.size()>0">
        <s:select list="cateMap" name="category_name" label="新闻类型">
    	</s:select>
    	</s:if>
    	<s:else>
    	现在没有类型选择，请先添加类型
    	</s:else>
    <s:textarea name="news.content" cols="60" rows="12" label="内容"/>
    <s:submit label="添加"/>
    </s:form>
    
  </body>
</html>
