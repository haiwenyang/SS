<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listNews.jsp' starting page</title>
    
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
    <div align="right"><s:a href="s2h/addInput.action">添加新闻</s:a></div>
    <table width="600" border="1" cellspacing="0" cellpadding="0">
      <tr>
          <th width="40%">标题</th>
          <th width="15%">类型</th>
          <th width="20%">发布时间</th>
          <th width="20%">操作</th>
      </tr>
    <s:if test="newss.size()>0">
    <s:iterator value="newss" var="news">
       <tr>
         <td><s:a href="showNews.action?id=%{#news.id}"><s:property value="#news.title"/></s:a></td>
         <td><s:property value="#news.category.categoryName" /></td>
         <td><s:date name="#news.issueTime" format="yyyy-MM--dd hh:mm:ss"/></td>
         <td><s:a href="s2h/updateInput.action?id1=%{#news.id}">更新</s:a>
         &nbsp;&nbsp;<s:a href="s2h/deleteNews.action?id1=%{#news.id}">删除</s:a>
         </td>
       </tr>
    </s:iterator>
    </s:if>
    <s:else>
    <tr>
    <td colspan="3">没有找到新闻</td>
    </tr>
    </s:else>
    </table>
      <s:if test="categorys.size()>0">
      <s:iterator value="categorys" var="category">
      	<s:property value="#category.id" />
    	<s:property value="#category.categoryName" />
    	</s:iterator>
    	</s:if>
    	<s:else>
    	
    	</s:else>
  </body>
</html>
