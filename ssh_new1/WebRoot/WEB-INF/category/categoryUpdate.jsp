<%@ page import="com.opensymphony.xwork2.ActionContext"%>
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
  <% String idint=request.getParameter("cid");
     Integer id=Integer.valueOf(idint);  %>
     <%=id %>
  <h3>更新新闻类型:</h3>
    <s:form action="updatedCategory" namespace="/s2h">
    <s:hidden name="category1.id"/>
    <s:textfield name="category1.categoryName" id="category1.categoryName" label="类型名"/>
    <% ActionContext ctx=ActionContext.getContext();
       ctx.getSession().put("update_category",id);
    %>
    <s:submit value="更新"/>
    </s:form>
  </body>
</html>
