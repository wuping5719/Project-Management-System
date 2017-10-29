<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>项目管理系统</title>

<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/global.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/bootstrap-3.3.0/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/global.js" type="text/javascript"></script>

</head>
<body>
    <div id="main">
		<div id="main_top">
			<div id="logo">
				<a href="#"> <img
					src="<%=basePath%>static/img/main/cmb.png" />
				</a>
			</div>
			<div class="hg_nav">
				<div class="navi">
					<ul class="hg_nav_list js_nav_list">
						<li id="hg_nav_li1"><a href="<%=basePath%>loadReqsList.do" id="dp1"> 
						     <img id="tp1" src="<%=basePath%>static/img/main/stationb.png" /> 需求管理</a></li>
						<li id="hg_nav_li2"><a href="<%=basePath%>loadProject.do" id="dp2">
							 <img id="tp2" src="<%=basePath%>static/img/main/qualityw.png" />项目管理</a></li>
					</ul>
				</div>
				<div class="hg_sch">
				    <a id="userName" href="#" ><%=session.getAttribute("_name")%></a>
					<a id="a_logout" href="<%=basePath%>logout.do">注销</a>
				</div>
			</div>
		</div>

		<div id="main_middle">
			<div id="middle_workbench">
				<div id="workbenchTitle">
					<img src="<%=basePath%>static/img/main/work.png" class="titleImg" />
					<b style="color: #065b9b; font-size: 1.2em;">工作台</b>
					<hr style="color: #065b9b;" />
				</div>
				<div id="workbench_entry1" class="workbench_entry"
					style="top: 15%; left: 15%;">
					<a href="<%=basePath%>loadReqsList.do">
						<img src="<%=basePath%>static/img/main/usermanage.png" />
					</a>
					<p>需求管理</p>
				</div>
				<div id="workbench_entry2" class="workbench_entry"
					style="top: 15%; left: 35%;">
					<a href="<%=basePath%>loadProject.do"> 
					   <img src="<%=basePath%>static/img/main/performance.png" />
					</a>
					<p>项目管理</p>
				</div>
				<div id="workbench_entry3" class="workbench_entry"
					style="top: 15%; left: 55%;">
					<a href="<%=basePath%>loadPublicActivity.do" > 
					    <img src="<%=basePath%>static/img/main/rolemanage.png" />
					</a>
					<p>公共活动</p>
				</div>
				<div id="workbench_entry4" class="workbench_entry"
					style="top: 15%; left: 75%;">
					<a href="<%=basePath%>loadProgramConflict.do" > <img
						src="<%=basePath%>static/img/main/changemanage.png" /></a>
					<p>程序冲突</p>
				</div>
				<div id="workbench_entry5" class="workbench_entry"
					style="top: 50%; left: 15%;">
					<a href="<%=basePath%>loadEventTrack.do" > <img
						src="<%=basePath%>static/img/main/dataanly.png" /></a>
					<p>事项追踪</p>
				</div>
				<div id="workbench_entry6" class="workbench_entry"
					style="top: 50%; left: 35%;">
					<a href="<%=basePath%>loadNotesList.do"> 
					    <img src="<%=basePath%>static/img/main/resmanage.png" /></a>
					<p>知识管理</p>
				</div>
				<div id="workbench_entry7" class="workbench_entry"
					style="top: 50%; left: 55%;">
					<a  href="<%=basePath%>loadUsersList.do"> <img
						src="<%=basePath%>static/img/main/appmanage.png" /></a>
					<p>权限管理</p>
				</div>
			</div>

			<div id="middle_notice">
				<div id="noticeTitle">
					<img src="<%=basePath%>static/img/main/system.png" 
					       style="margin: 3px 5px; height: 18px; width: 20px; align: bottom;" />
					<b style="color: #065b9b;  font-size: 1.2em;">系统公告</b>
					<hr style="color: #065b9b;" />
				</div>
				<div id="marquee">
					<table>
						<tr>
							<td>2017-9-18</td>
						</tr>
						<tr>
							<td id="notice1">
							     <a href="#" onclick="sAlert('文档服务器还未启用，敬请期待')">关于项目管理模块上线的通知</a>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>2017-8-28</td>
						</tr>
						<tr>
							<td id="notice2">
							      <a href="#" onclick="sAlert('文档服务器还未启用，敬请期待')">关于权限管理模块上线的通知</a>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>2017-8-16</td>
						</tr>
						<tr>
							<td id="notice3">
							     <a href="#" onclick="sAlert('文档服务器还未启用，敬请期待')">关于需求管理模块上线的通知</a>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td id="notice4">
							     <a href="#" onclick="sAlert('文档服务器还未启用，敬请期待')">更多</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div id="middle_common">
				<div id="commonTitle">
					<img src="<%=basePath%>static/img/main/mainuse.png" class="titleImg" /> 
					<b style="color: #065b9b; font-size: 1.2em;">团队风采</b>
					<hr style="color: #065b9b;" />
				</div>
				<div id="commonContent" class="commonContent">
					<div id="myCarousel" class="carousel slide" style="margin:1%;">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<div class="item active">
								<img id="itemPic1" alt="FirstSlide" 
								             style="height:100%; width:100%; "  >
							</div>
							<div class="item">
								<img id="itemPic2" alt="SecondSlide"
								             style="height:100%; width:100%; " >
							</div>
							<div class="item">
								<img id="itemPic3" alt="ThirdSlide"
								             style="height:100%; width:100%; " >
							</div>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo; </a> 
					    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo; </a>
					</div>
				</div>
            </div>

			<script>
				$(function() {
					$('.carousel').carousel({
						interval : 3000,   //轮播间隔
						pause : "hover",  //鼠标悬停在轮播图上，是否停止滚动
						wrap : true,
						keyboard:true  //响应键盘事件
					});
					
					var imgObj1 = document.getElementById("itemPic1");
		            imgObj1.src = "<%=basePath%>static/file/team_elegant/desk1.png";
		            var imgObj2 = document.getElementById("itemPic2");
		            imgObj2.src = "<%=basePath%>static/file/team_elegant/desk2.png";
		            var imgObj3 = document.getElementById("itemPic3");
		            imgObj3.src = "<%=basePath%>static/file/team_elegant/desk3.png";
		               
					<%-- 
					// 定时器, 每秒钟触发 showPicsInOrder() 函数
		        	window.setInterval("showPicsInOrder()", 5000);
					
		        	var num = 1;
			        function showPicsInOrder()  {
			               var imgObj1 = document.getElementById("itemPic1");
			               imgObj1.src = "<%=basePath%>static/file/team_elegant/desk1.png";
			               var imgObj2 = document.getElementById("itemPic2");
			               imgObj2.src = "<%=basePath%>static/file/team_elegant/desk2.png";
			               var imgObj3 = document.getElementById("itemPic3");
			               imgObj3.src = "<%=basePath%>static/file/team_elegant/desk3.png";
			        } 
			        --%>
				});
			</script>

			<div id="middle_neededDealt">
				<div id="neededDealtTitle">
					<img src="<%=basePath%>static/img/main/wait.png" class="titleImg" />
					<b style="color: #065b9b; font-size: 1.2em;">待办</b>
					<hr style="color: #065b9b;" />
				</div>
				<div id="dealtedContent">
					<ul>
						<li id="main_work_1">
						      <a href="#" id="backLog1" style="color: #f00;">您有1条代办事项, 请及时处理</a>
						</li>
						<li id="main_work_2">
						      <a href="#" id="backLog2" style="color: #f00;">同业额度对接总控, 请及时处理</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer">
			<p>Copyright &copy; 2017 吴平 版权所有</p>
		</div>
</div>
</body>
</html>