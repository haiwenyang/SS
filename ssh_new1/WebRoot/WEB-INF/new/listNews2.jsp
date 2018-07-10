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
	</div>
	<div class="row clearfix">
		<div class="col-md-5 column">
			<h3>
				类型管理
			</h3>
		   <div class="list-group">
				 <a class="list-group-item active" href="listCategory1.action" >类型查看</a>
		   </div>
		   
		   <h3>
				新闻管理
			</h3>
		   <div class="list-group">
				 <a class="list-group-item active" href="listNews1.action">新闻查看</a>
		   </div>
	</div>
		<div class="col-md-4 column" style="position:relative;border:1px;width:0; height:400px; background-color:blue"></div>
		<div class="col-md-3 column">
	   <div class="container">
	<div class="row clearfix">
	<div class="col-md-6 column">

			<h3 align="center">
				新闻查看<h5><form action="selectTitle.action?title=title"><input value="标题模糊查询" name="title" id="title" />&nbsp<button type="submit" id="title">查询</button></form><form action="findTime.action"><input value="开始时间" name="starttime" id="starttime" />&nbsp<input value="结束时间" name="endtime" id="endtime" /><button type="submit">查询</button></form>
				
				<form action="findNewsByCategoryname">	<div>
						 <s:select list="cateMap" name="category_name"></s:select><button type="submit">新闻类型查询</button>
					</div></form></h5>
			</h3>
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
						
					</tr>
				</thead>
				<s:if test="newss.size()>0">
    <s:iterator value="newss" var="news">
       <tr>
         <td><s:a href="showNews1.action?id1=%{#news.id}"><s:property value="#news.title"/></s:a></td>
         <td><s:property value="#news.category.categoryName" /></td>
         <td><s:date name="#news.issueTime" format="yyyy-MM-dd hh:mm:ss"/></td>

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