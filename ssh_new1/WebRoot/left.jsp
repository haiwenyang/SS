<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
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
   <table cellpadding="0" cellspacing="0" width="200" align="center" class="table">
   <tr>
   <td height="80" align="center" bgcolor="#DBC2B0">
   <b>类型管理</b>
   </td>
   </tr>
   <td><table cellpadding="0" cellspacing="0" width="180" align="center" class="table">
   <tr>
   <td height="40"><a href="/ssh_new1/categoryAdd.jsp" target="right">类型添加</a></td></tr>
   <tr>
   <td height="40"><a href="s2h/listCategory.action" target="right">类型查看</a></td>
   </tr>
   </table>
   </td>
   </table>
    <table cellpadding="0" cellspacing="0" width="200" align="center" class="table">
   <tr>
   <td height="80" align="center" bgcolor="#DBC2B0">
   <b>新闻管理</b>
   </td>
   </tr>
   <td><table cellpadding="0" cellspacing="0" width="180" align="center" class="table">
   <tr>
   <td height="40"><a href="s2h/addInput.action" target="right">新闻发布</a></td></tr>
   <tr>
   <td height="40"><a href="s2h/listNews.action" target="right">新闻查看</a></td>
   </tr>
   </table>
   </td>
   </table>
  </body>
</html>
