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

<div class="container">
	<div class="row clearfix">
		<div class="col-md-5 column">
			<h3>
				类型管理
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="/ssh_new1/left1.jsp"
				 >类型添加</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="listCategory.action" >类型查看</a>
		   </div>
		   
		   <h3>
				新闻发布
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="addInput.action">新闻发布</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="#">新闻查看</a>
		   </div>
	</div>
		<div class="col-md-4 column" style="position:relative;border:1px;width:0; height:400px; background-color:blue"></div>
		<div class="col-md-3 column">
	   <div class="container">
	<div class="row clearfix">
	<div class="col-md-6 column">

			<h3 align="center">
				新闻查看
			</h3>
			<table class="table table-condensed table-bordered">
				<thead>
					<tr>
						<th>
							标题
						</th>
						<th>
							发布
						</th>
						<th>
						时间
						</th>
						<th>
							操作
						</th>
						
					</tr>
				</thead>
				<s:if test="newss.size()>0">
    <s:iterator value="newss" var="news">
       <tr>
         <td><s:a href="showNews.action?id=%{#news.id}"><s:property value="#news.title"/></s:a></td>
         <td><s:property value="#news.category.categoryName" /></td>
         <td><s:date name="#news.issueTime" format="yyyy-MM--dd hh:mm:ss"/></td>
         <td><s:a href="updateInput.action?id1=%{#news.id}">更新</s:a>
         &nbsp;&nbsp;<s:a href="deleteNews.action?id1=%{#news.id}">删除</s:a>
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
		</div>
	</div>
</div>
	</div>
</div>
</body>
</html>