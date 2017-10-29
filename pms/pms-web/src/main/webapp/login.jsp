<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
<head>
<title>项目管理系统—欢迎登录</title>
<link rel="stylesheet" type="text/css" href="static/css/login-style.css" />
<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css" />
</head>
<body>
	<script src="static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="static/js/sweet-alert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("body").keydown(function() {
				if (event.keyCode == "13") {  // keyCode=13 是 回车键
					$('#submit').click();
				}
			});

			$("#submit").click(function() {
				var userWorkID = document.getElementById("username").value;   // 注意：此处用户名为用户工号 userWorkID
				var password = document.getElementById("password").value;
				if (userWorkID == "" && password == "") {
					$("#notice").html('<span style="color:red;">请输入用户名和密码！</span>'); //更改 p 标签，显示提示信息
					$("#username").focus(); //获取焦点
					return;
				} else {
					if (userWorkID == "") {
						$("#notice").html('<span style="color:red;">请输入用户名！</span>');
						$("#username").focus();
						return;
					} else if (password == "") {
						$("#notice").html('<span style="color:red;">请输入密码！</span>');
						$("#password").focus();
						return;
					}
			   }

			   $.ajax({
				   type : "POST",
				   url : "login.do?userWorkID=" + userWorkID + "&password=" + password,
				   success : function(msg) {
					  if (msg == "2") {
                         $("#notice").html('<span style="color:red;">密码无效！</span>');
						 $("#password").focus();
					  } else if (msg == "1") {
						$("#notice").html('<span style="color:red;">用户名不存在！</span>');
						$("#username").focus();
					  } else {
						 window.location.href = "<%=basePath%>loadHome.do";
					  }
				   },
				   error : function(e) {
					  sweetAlert("网页发生错误：",e,"error");
				   }
			   });
		  });
	});
	</script>
	<form id="login">		
		<p id="notice">欢迎登录，注意保护账号！</p>
		<br>
		<fieldset id="inputs">	     
			<input id="username" type="text" placeholder="员工工号" autofocus required onfocus=""> 
			<br><br><br>
			<input id="password" type="password" placeholder="密码" required onfocus="">
		</fieldset>
        <br><br>
		<fieldset id="actions">
			<input type="button" id="submit" value="登　录" onkeyup="submitByEnter(event)"> 
			<a href="">忘记密码？</a>   <a href="<%=basePath%>pages/auths/user_register.jsp">注册</a>
		</fieldset>
	</form>	
</body>
</html>
