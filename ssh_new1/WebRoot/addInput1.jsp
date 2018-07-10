<%@page import="com.hibernate.action.CategoryAction"%>
<%@page import="com.sise.hibernate.Category"%>
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
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script src="bootstrap/js/jquery.3.2.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-5 column">
			<h3>
				类型管理
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="/ssh_new1/left1.jsp">类型添加</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="#" >类型查看</a>
		   </div>
		   
		   <h3>
				新闻发布
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="s2h/addInput.action">新闻发布</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="s2h/listNews.action">新闻查看</a>
		   </div>
	</div>
		<div class="col-md-4 column" style="position:relative;border:1px;width:0; height:400px; background-color:blue"></div>
		<div class="col-md-3 column">
	   <div class="container">
	<div class="row clearfix">
	<div class="col-md-6 column">

			<h3 align="center">
				新闻发布
			</h3>
			
			
			<form class="form-horizontal"  action="s2h/addNews" namespace="">
				<div class="form-group">
					 <label class="col-sm-2 control-label"  >标题</label>
					<div class="col-sm-10">
						<input class="form-control" style="width: 213px;" name="news.title"/>
					</div>
					
					<label class="col-sm-2 control-label"  >新闻类型</label>
					<div class="col-sm-10">
						 <s:select list="cateMap" name="category_name"></s:select>
					</div>
					
					 <label class="col-sm-2 control-label"  >内容</label>
					<div class="col-sm-10">
						<s:textarea name="news.content" cols="60" rows="12"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-default" type="submit">添加</button>
					</div>
				</div>
			</form> 
			<!--<s:form action="addNews" namespace="/s2h">
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
    </s:form>-->
		</div>
	</div>
</div>
	</div>
</div>
</body>
</html>