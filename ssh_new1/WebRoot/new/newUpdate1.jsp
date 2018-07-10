<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Bootstrap 实例</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
	<script src="../bootstrap/js/jquery.3.2.1.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<% String idint=request.getParameter("id1");
   %>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-5 column">
			<h3>
				类型管理
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="#"
				 >类型添加</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="s2h/listCategory.action" >类型查看</a>
		   </div>
		   
		   <h3>
				新闻发布
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="s2h/addInput.action">新闻发布</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="listNews.action">新闻查看</a>
		   </div>
	</div>
		<div class="col-md-4 column" style="position:relative;border:1px;width:0; height:400px; background-color:blue"></div>
		<div class="col-md-3 column">
		<div class="container">
	<div class="row clearfix">
	<div class="col-md-6 column">
	   <body>
  <h3 align="center">更新新闻</h3>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<!-- namespace的标签对div的action不起动作 ，所以action="s2h/addCategory"-->
			<form class="form-horizontal"  action="s2h/updateNews" namespace="">
			<s:hidden name="news.id"/>
				<div class="form-group">
					 <label class="col-sm-2 control-label">新闻标题</label>
					<div class="col-sm-10">
                   <s:textfield name="news.title" id="news.title"/>
					</div>
				</div>
				
				<div class="form-group">
					 <label class="col-sm-2 control-label">新闻内容</label>
					<div class="col-sm-10">
                   <s:textfield name="news.content" id="news.content"/>
					</div>
				</div>
				
				<div class="form-group">
					 <label class="col-sm-2 control-label">新闻类型</label>
					<div class="col-sm-10">
                  <s:hidden name="news.issueTime"/>
                  <s:select list="cateMap" name="category_name"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-default btn-success" type="submit">更新</button>
					</div>
				</div>
			</form> 
		</div>
	</div>
</div>
</body>
</div>
</div>
</div>
	</div>
</div>
</body>
</html>