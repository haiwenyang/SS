<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script src="bootstrap/js/jquery.3.2.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
  <h3 align="right">发布新闻类型</h3>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<!-- namespace的标签对div的action不起动作 ，所以action="s2h/addCategory"-->
			<form class="form-horizontal"  action="s2h/addCategory" namespace="">
				<div class="form-group">
					 <label class="col-sm-2 control-label"  >类型名</label>
					<div class="col-sm-10">
						<input class="form-control" style="width: 213px;" name="category1.categoryName"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-default" type="submit">提交</button>
					</div>
				</div>
			</form> 
		</div>
	</div>
</div>
</body>
</html>