<%@ page language="java" import="java.util.*,org.hibernate.Query,com.sise.hibernate.*,com.hibernate.*" pageEncoding="utf-8"%>
<%--<%@page import="com.opensymphony.xwork2.ActionContext"%> --%>
<%@page import="org.hibernate.Session"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>Bootstrap 实例</title> 
 <!-- html5注释 <title>Bootstrap 实例</title> -->
 <%// 服务器端注释，页面和查看源代码看不到 <title>Bootstrap 实例</title> %>
 <%/* 服务器端注释，页面和查看源代码看不到 <title>Bootstrap 实例</title>*/ %>
 <%--  服务器端注释，页面和查看源代码看不到<title>Bootstrap 实例</title>--%>
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
				 <a class="list-group-item active" href="addCategorys.action"
				 >类型添加</a>
		   </div>
		   <div class="list-group">
				 <a class="list-group-item active" href="#" >类型查看</a>
		   </div>
		   
		   <h3>
				新闻发布
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="addInput.action">新闻发布</a>
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

			<h3 align="center">
				新闻类型查看
			</h3>
			<table class="table table-condensed table-bordered">
				<thead>
					<tr>
						<th>
							序号
						</th>
						<th>
							类型
						</th>
						<th>
							操作
						</th>
						
					</tr>
				</thead>
				 <s:if test="categories.size()>0">
       <s:iterator value="categories" var="category" status="stu">
       <tr>
       <td width="60"><s:property value="#stu.count"/></td>
         <td width="120"><s:property value="#category.categoryName"/></td>
         <td><s:a href="updateCategory.action?cid=%{#category.id}">更新</s:a>
         &nbsp;&nbsp;<s:a href="s2h/deleteCategory.action?cid=%{#category.id}" onclick="return window.confirm('确定要删除吗？');">删除</s:a>
         </td>
         </tr>
    </s:iterator>
    </s:if>
			</table>
			<center>
    
        <font size="5">共<font color="red"><s:property value="#request.pageBeanCategory.totalPage"/></font>页 </font>&nbsp;&nbsp;
        <font size="5">共<font color="red"><s:property value="#request.pageBeanCategory.allRows"/></font>条记录</font><br><br>
        
        <s:if test="#request.pageBeanCategory.currentPage == 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>
        
        <s:else>
            <a href="listCategory.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="listCategory.action?page=<s:property value="#request.pageBeanCategory.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="#request.pageBeanCategory.currentPage != #request.pageBeanCategory.totalPage">
        	&nbsp;&nbsp;&nbsp; 第<s:property value="#request.pageBeanCategory.currentPage"/>页&nbsp;&nbsp;&nbsp;
            <a href="listCategory.action?page=<s:property value="#request.pageBeanCategory.currentPage + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="listCategory.action?page=<s:property value="#request.pageBeanCategory.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
        &nbsp;&nbsp;&nbsp; 第<s:property value="#request.pageBeanCategory.totalPage"/>页&nbsp;&nbsp;&nbsp;
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
    
    </center>
		</div>
	</div>
</div>
	</div>
</div>
</body>
</html>