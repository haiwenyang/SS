<%@ page language="java" import="java.util.*,org.hibernate.Query,com.sise.hibernate.*,com.hibernate.*" pageEncoding="utf-8"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
	<script src="../bootstrap/js/jquery.3.2.1.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script Language="JavaScript">
     function deleSelect() 
	{ 
      var delValue=""; 
      var flag=false; 
      var de= document.getElementsByName("checkname"); 
       for(var i=0;i<de.length;i++) 
        { 
        if(de[i].checked){ 
                delValue+=","+de[i].value; 
                flag = true; 
                         } 
        } 
    if(flag==false) 
        { 
        window.alert("至少你要选择一个待删除记录");
        return false; 
        } 
        return true;
      }
    </script>
</head>
<body>

<div class="container">
	<div class="row clearfix">
	<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-769593">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-769593">
					</li>
					<li data-slide-to="1" data-target="#carousel-769593">
					</li>
					<li data-slide-to="2" data-target="#carousel-769593">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="../image/default0.jpg" style="height: 136px; width: 1051px; "/>
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="../image/default1.jpg" style="height: 136px; width: 1051px; "/>
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="../image/default2.jpg" style="height: 136px; width: 1051px; "/>
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-769593" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-769593" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		<div class="col-md-5 column">
			<h3>
				类型管理
			</h3>
			<div class="list-group">
				 <a class="list-group-item active" href="addCategorys.action"
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
			
			<form name="formlogin" action="delSelectUsers.action" method="post" onsubmit="return deleSelect();">
			<table class="table table-condensed table-bordered">
				<thead>
					<tr>
					   
						<th>
							标题
						</th>
						<th>
							类型
						</th>
						<th>
						发布时间
						</th>
						<th>
							操作
						</th>
						 <th>
					              删除
					    </th>
					</tr>
				</thead>
				<s:if test="newss.size()>0">
    <s:iterator value="newss" var="news">
       <tr>
        
         <td><s:a href="showNews.action?id1=%{#news.id}"><s:property value="#news.title"/></s:a></td>
         <td><s:property value="#news.category.categoryName"/></td>
         <td><s:date name="#news.issueTime" format="yyyy-MM--dd hh:mm:ss"/></td>
         <td><s:a href="updateInput.action?id1=%{#news.id}">更新</s:a>
         &nbsp;&nbsp;<s:a href="deleteNews.action?id1=%{#news.id}" onclick="return window.confirm('确定要删除吗？');">删除</s:a>
         </td>
         <td><input type="checkbox" name="checkname" value="${news.id}"/> <%-- ${news.id}代表引用的值--%>
	    </td>
       </tr>
     
    </s:iterator>
      <tr>
      <s:submit name="delselect" value="删除所选记录" onclick="return deleSelect()"/>
       </tr>
    </s:if>
    <s:else>
     
    <tr>
    <td colspan="3">没有找到新闻</td>
    </tr>
    </s:else>
			</table>
			<!--<s:submit name="delselect" value="删除所选记录" onclick="return deleSelect()"/>-->
			</form>
			<center>
        <font size="5">共<font color="red"><s:property value="#request.pageBeanCategory.totalPage"/></font>页 </font>&nbsp;&nbsp;
        <font size="5">共<font color="red"><s:property value="#request.pageBeanCategory.allRows"/></font>条记录</font><br><br>
        
        <s:if test="#request.pageBeanCategory.currentPage == 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>
        
        <s:else>
            <a href="listNews.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="listNews.action?page=<s:property value="#request.pageBeanCategory.currentPage - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="#request.pageBeanCategory.currentPage != #request.pageBeanCategory.totalPage">
        	&nbsp;&nbsp;&nbsp; 第<s:property value="#request.pageBeanCategory.currentPage"/>页&nbsp;&nbsp;&nbsp;
            <a href="listNews.action?page=<s:property value="#request.pageBeanCategory.currentPage + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="listNews.action?page=<s:property value="#request.pageBeanCategory.totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
        &nbsp;&nbsp;&nbsp; 第<s:property value="#request.pageBeanCategory.totalPage"/>页&nbsp;&nbsp;&nbsp;
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
    
    </center>
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