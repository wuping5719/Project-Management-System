<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
<title>对不起，您没有操作权限！</title>
<style type="text/css">

</style>
<!--[if lte IE 8]>
<style type="text/css">
  h2 em { color:#e4ebf8; }
</style>
<![endif]-->

<script type="text/javascript">
  function returnFirst() {  
	  top.location.href = "<%=basePath%>pages/index.jsp";
  }
</script>

</head>
<body>
	<div style="width:100%; height:100%; ">
	    <h1 style="width:100%; height:100%; text-align:center;">对不起，您没有操作权限！</h1> 
	    <div style="width:100%; height:100%; text-align:center;">
	        <a href="javascript:void(0);" onclick="returnFirst()">&#9666;返回首页</a>
		    <a href="javascript:history.go(-1);">&#9666;返回上一页</a>
	    </div>
	</div>
</body>
</html>
