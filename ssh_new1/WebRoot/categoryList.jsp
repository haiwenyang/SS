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
<h3>查看新闻类型</h3>
<div align="right"><s:a href="addInput.action" namespace="/s2h">添加新闻</s:a></div>
    <table width="360" border="1" cellspacing="0" cellpadding="6">
      <tr align="center">
         <th>序号</th>
          <th>类型</th>
          <th >操作</th>
      </tr>
    <s:if test="categories.size()>0">
    <s:iterator value="categories" var="category" status="stu">
       <tr align="center">
       <td width="60"><s:property value="#category.id"/></td>
         <td width="120"><s:property value="#category.categoryName"/></td>
         <td><s:a href="s2h/updateCategory.action?cid=%{#category.id}">更新</s:a>
         &nbsp;&nbsp;<s:a href="s2h/deleteCategory.action?cid=%{#category.id}">删除</s:a>
         </td>
       </tr>
    </s:iterator>
    </s:if>
    <s:else>
    <tr>
    <td colspan="3">没有找到新闻类型</td>
    </tr>
    </s:else>
    </table>
  </body>
</html>
