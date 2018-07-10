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
    
    <title>My JSP 'categoryUpdate.jsp' starting page</title>
    
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
   <% String idint=request.getParameter("id1");
   %>
  <h3>更新新闻:</h3>
    <s:form action="updateNews" namespace="/s2h">
    <s:hidden name="news.id"/>
    <s:textfield name="news.title" label="新闻标题"/>
    <s:textfield name="news.content" label="新闻内容"/>
    <s:hidden name="news.issueTime"/>
    <s:select list="cateMap" name="category_name" label="新闻类型"/>
    <!-- <s:textfield name="news.category.categoryName" id="category_name" label="新闻类型"/>-->
    <s:submit value="更新"/>
    </s:form>
  </body>
</html>
