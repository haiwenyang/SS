<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
  <h3>发布新闻类型</h3>
   <s:form action="addCategory" namespace="/s2h">
    <s:textfield name="category1.categoryName" label="类型名"/>
    <s:submit vlaue="添加"/>
    </s:form>
</body>
</html>