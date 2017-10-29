<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 将 "项目路径basePath"放入pageContext中，待以后用EL表达式读出。    
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<!--[if lt IE 9]>
<script src="static/html5/js/html5shiv.js"></script>
<![endif]-->
<link href="<%=basePath%>static/html5/css/normalize.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/html5/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/html5/css/jquery.idealforms.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/css/register-style.css" rel="stylesheet" type="text/css" />
</head>

<script src="<%=basePath%>static/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="<%=basePath%>static/html5/js/jquery-ui.min.js" type="text/javascript" ></script>
<script src="<%=basePath%>static/html5/js/jquery.idealforms.js" type="text/javascript" ></script>
<script src="<%=basePath%>static/js/sweet-alert.min.js" type="text/javascript" ></script>

<body>
	<div class="main">
		<div>
			<form id="my-form" class="myform">
				<div>
					<label>工号:</label><input id="username" name="username" type="text" />
				</div>
				<div>
					<label>密码:</label><input id="pass" name="password" type="password" />
				</div>
				<div>
					<label>确认密码:</label><input id="pass2" name="password" type="password" />
				</div>
				<div>
					<label>姓名:</label><input id="fullname" type="text" name="fullname" data-ideal="name" />
				</div>
				<div>
					<label>手机号码:</label><input id="telephone" type="text" name="phone" data-ideal="phone" />
				</div>
				<div>
					<label>邮箱:</label> <input id="email" name="email" data-ideal="required email" type="email" />
				</div>
				<div style="margin-top: 10px; margin-left: 23%;">
					 <button type="button" id="submit" class="submit">提交</button>
					 <button id="reset" type="button">重置</button>
		        </div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		var options = {
			onFail : function() {
				alert($myform.getInvalid().length + " invalid fields.");
			},

			inputs : {
				'password' : {
					filters : 'required pass',
				},
				'username' : {
					filters : 'required username',
					data : {}
				},
				'email' : {
					filters : 'required email',
				},
				'phone' : {
					filters : 'required phone',
				},
				'fullname' : {
					filters : 'required',
				}
			}
		};

		var $myform = $('#my-form').idealforms(options).data('idealforms');

		$('#submit').click(function() {
			var username = document.getElementById("username").value; //用户名
            if(username == "") {
                sweetAlert("用户名不能为空！");
                return;
            }
            var password = document.getElementById("pass").value;    //密码
            if(password == "") {
                sweetAlert("密码不能为空！");
                return;
            }
			var email = document.getElementById("email").value;     //邮箱
			if(email == "") {
                sweetAlert("邮箱不能为空！");
                return;
            }
			var telephone = document.getElementById("telephone").value;     //手机号码
			if(telephone == "") {
                sweetAlert("手机号码不能为空！");
                return;
            }
			var fullname = document.getElementById("fullname").value;     //姓名
			if(fullname == "") {
                sweetAlert("姓名不能为空！");
                return;
            }
			
			$.ajax({
				type : "post",
				url : "<%=basePath%>userRegister.do",
				data: {
				   username:username, password:password,
				   fullname:fullname, email:email, telephone:telephone
                },
				success : function() {
					sweetAlert("注册成功！", "注册成功", "success");
				},
				error:function(e) {
				    sweetAlert("注册失败！", e, "error");
				}
			});
		});
		
		$('#reset').click(function() {
			$myform.reset().fresh().focusFirst();
		});

		$myform.focusFirst();
	</script>

</body>
</html>

