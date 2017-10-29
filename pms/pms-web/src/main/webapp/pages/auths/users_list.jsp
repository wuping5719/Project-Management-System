<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。    
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<title>用户列表</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/users-layout.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/sweet-alert.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/jquery-ui-1.11.4/external/jquery/jquery.js"></script>
<script src="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.js"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
<script src="<%=basePath%>static/My97DatePicker/WdatePicker.js" ></script>
<script src="<%=basePath%>static/js/main.js" type="text/javascript"></script>
</head>

<body>
	<div id="container">
		<div id="head">
			<div id="main_top">
				<div id="logo">
					<a href="#"> 
					   <img src="<%=basePath%>static/img/main/cmb.png" />
					</a>
				</div>
				<div class="hg_nav">
					<div class="navi">
					     <ul class="hg_nav_list">
					          <li id="hg_nav_li1"><a href="<%=basePath%>loadHome.do" >首页</a></li>
						      <li id="hg_nav_li2"><a href="<%=basePath%>loadReqsList.do" >需求管理</a></li>
						      <li id="hg_nav_li3"><a href="<%=basePath%>loadProject.do" >项目管理</a></li>
						      <li id="hg_nav_li4"><a href="<%=basePath%>loadProgramConflict.do" >程序冲突</a></li>
						      <li id="hg_nav_li5"><a href="<%=basePath%>loadEventTrack.do" >事项追踪</a></li>	
						      <li id="hg_nav_li6"><a href="<%=basePath%>loadNotesList.do" >知识管理</a></li>	
						      <li id="hg_nav_li7"><a href="<%=basePath%>loadPublicActivity.do" >公共活动</a></li>
						      <li id="hg_nav_li8"><a href="<%=basePath%>loadUsersList.do" >权限管理</a></li>
					   </ul>
				    </div>
					<div class="hg_sch">
						<a id="userName" href="#"><%=session.getAttribute("_name")%></a> 
						<a id="a_logout" href="<%=basePath%>logout.do" >注销</a>
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="menu"><ul id="treeMenu" class="ztree" ></ul></div>
			<div id="local">
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 权限管理->用户列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">姓名：</label> 
					 <input id="fullName" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">工号：</label>
					 <input id="userWorkID" type="text" style="width: 150px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="usersSearch" class="usersSkip" src="<%=basePath%>static/img/search.png" /> 
				</div>

				<div id="usersListTable">
					<table id="usersTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 80px">工号</td>
							<td style="width: 80px">姓名</td>
							<td style="width: 80px">手机号码</td>
							<td style="width: 100px">邮箱</td>
							<td style="width: 100px">所属条线</td>
							<td style="width: 100px">所属开发室</td>
							<td style="width: 80px">用户角色</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="usersPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="usersFirst" class="usersSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="usersPrevious" class="usersSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="usersCenterBar" style="width: 60px;">
							      <input id="usersCurPageNum" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>/</label> 
							      <input id="usersTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="usersNext" class="usersSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="usersEnd" class="usersSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="usersCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="usersJumpN" class="usersSkip" src="<%=basePath%>static/img/sureBtn.png" />
							</td>
							<td style="width: 60px;"></td>
						</tr>
					</table>
				</div>

			</div>
		</div>

		<div id="footer">
			<p>Copyright &copy; 2017 吴平 版权所有</p>
		</div>
	</div>
	
	<div id="dialog" style="display: none;">
		<div id="userInfo" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">工号*：</label> 
				<input id="strUserWorkID" type="text" style="margin-top: 30px; width: 336px"/>
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">姓名*：</label>
				<input id="strUserName" type="text" style="margin-top: 30px; width: 336px; "/>
				<label style="margin-top: 30px; margin-left: 20px; ">手机号码：</label> 
				<input id="strUserMobile" type="text" style="margin-top: 30px; width: 312px; " />
				<label style="margin-top: 30px; margin-left: 20px; ">邮箱：</label> 
				<input id="strUserEmail" type="text" style="margin-top: 30px; width: 342px; " />
				<label style="margin-top: 30px; margin-left: 20px;">所属条线及开发室：</label> 
				<ul id="groupAndDevRoom" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
			</div>
		</div>
	</div>

	<script>
     $(document).ready(function () {
    	 // 异步加载内部培训列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchUsers.do",
             data : { 
            	 fullName : null, 
            	 userWorkID : null,
            	 pageNum : 1
             },
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("usersPage").rows[0].cells[1].innerHTML = "总计"+msgRes.usersTotalNum+"条记录";
                 $("#usersCurPageNum").attr("value", 1);
                 $("#usersTotalPage").attr("value", msgRes.usersTotalPage);
                 $("#usersCurNo").attr("value", 1);

                 //清空table
                 var usersTB = document.getElementById("usersTab");
                 var rowNum = usersTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 usersTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var usersItem;
                 $.each(msgRes.userDTOsList,function(i,result){
                     if (i % 2 == 0){
                    	 usersItem = "<tr style=\"background-color:#e0ffff\">\
                    		  <td >" + result.sortIndex + "</td>\
			                  <td >" + result.userWorkID + "</td>\
			                  <td >" + result.userName + "</td>\
			                  <td >" + result.userMobile + "</td>\
			                  <td >" + result.userEmail + "</td>\
			                  <td >" + result.groupName + "</td>\
			                  <td >" + result.devRoom + "</td>\
			                  <td ><a href=\"#\" onclick=\"setUserRole("+ result.userID +",'"+ result.userName +"')  \">\
                                    <font>指定角色</font></a></td>\
			                  <td ><a href=\"#\" onclick=\"updateUser(" + result.userID + ")  \">修改</a></td>\
		                      <td ><a href=\"#\" onclick=\"deleteUser(" + result.userID + ")  \">\
		                            <font>删除</font></a></td>\
			                  <td style=\"display:none\">" + result.userID + "</td></tr>";
                         $("#usersTab").append(usersItem);
                     }
                     else{
                    	 usersItem = "<tr style=\"background-color:#f5f5f5\">\
                    		     <td >" + result.sortIndex + "</td>\
				                 <td >" + result.userWorkID + "</td>\
				                 <td >" + result.userName + "</td>\
				                 <td >" + result.userMobile + "</td>\
				                 <td >" + result.userEmail + "</td>\
				                 <td >" + result.groupName + "</td>\
				                 <td >" + result.devRoom + "</td>\
				                 <td ><a href=\"#\" onclick=\"setUserRole("+ result.userID +",'"+ result.userName +"')  \">\
                                        <font>指定角色</font></a></td>\
				                 <td ><a href=\"#\" onclick=\"updateUser(" + result.userID + ")  \">修改</a></td>\
			                     <td ><a href=\"#\" onclick=\"deleteUser(" + result.userID + ")  \">\
    		                            <font>删除</font></a></td>\
				                 <td style=\"display:none\">" + result.userID + "</td></tr>";
                       $("#usersTab").append(usersItem);
                     }
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".usersSkip").click(function(){
          var usersCurPageNum = Number(document.getElementById("usersCurPageNum").value);  //当前页码
          var usersPageNum = 1;  // 将要跳转的页码
          var usersTotalPage = Number(document.getElementById("usersTotalPage").value);  //页码总数
          if (this.id == "usersFirst") {   // 首页
        	  usersPageNum = 1;
          } else if (this.id == "usersPrevious") {  //上一页
                 if (usersCurPageNum > 1 && usersCurPageNum <= usersTotalPage) {
                	 usersPageNum = Number(usersCurPageNum) - 1;
                 } else {
                	 usersPageNum = 1;
                 }
             } else if (this.id == "usersNext") { // 下一页
                 if (usersCurPageNum < usersTotalPage){
                	 usersPageNum = Number(usersCurPageNum) + 1;
                 }else {
                	 usersPageNum = usersTotalPage;
                 }
             } else if (this.id == "usersEnd") {  // 末页
            	 usersPageNum = usersTotalPage;
             } else if (this.id == "usersSearch") {  // 查询
            	 usersPageNum = 1;
             } else if (this.id == "usersJumpN") {
                 var usersCurNo = Number(document.getElementById("usersCurNo").value);
                 if(usersCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(usersCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (usersCurNo > usersTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 usersPageNum = Number(usersCurNo);
             }
             
             // 查询条件
             var fullName = document.getElementById("fullName").value;   
             var userWorkID = document.getElementById("userWorkID").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchUsers.do",
                 data : { 
                       fullName : fullName, 
                       userWorkID : userWorkID,
                       pageNum : usersPageNum
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("usersPage").rows[0].cells[1].innerHTML = "总计"+msgRes.usersTotalNum+"条记录";
                     $("#usersCurPageNum").attr("value", usersPageNum);
                     $("#usersTotalPage").attr("value", msgRes.usersTotalPage);
                     $("#usersCurNo").attr("value", usersPageNum);

                     // 清空 table
                     var usersTB = document.getElementById("usersTab");
                     var rowNum = usersTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 usersTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var usersItem;
                     $.each(msgRes.userDTOsList,function(i, result){
                         if (i % 2 == 0){
                        	 usersItem = "<tr style=\"background-color:#e0ffff\">\
                        		 <td >" + result.sortIndex + "</td>\
  				                 <td >" + result.userWorkID + "</td>\
  				                 <td >" + result.userName + "</td>\
  				                 <td >" + result.userMobile + "</td>\
  				                 <td >" + result.userEmail + "</td>\
  				                 <td >" + result.groupName + "</td>\
  				                 <td >" + result.devRoom + "</td>\
  				                 <td ><a href=\"#\" onclick=\"setUserRole("+ result.userID +",'"+ result.userName +"')  \">\
                                        <font>指定角色</font></a></td>\
  				                 <td ><a href=\"#\" onclick=\"updateUser(" + result.userID + ")  \">修改</a></td>\
				                 <td ><a href=\"#\" onclick=\"deleteUser(" + result.userID + ")  \">\
        		                        <font>删除</font></a></td>\
  				                 <td style=\"display:none\">" + result.userID + "</td></tr>";
                           $("#usersTab").append(usersItem);
                         }
                         else{
                        	 usersItem = "<tr style=\"background-color:#f5f5f5\">\
                        		 <td >" + result.sortIndex + "</td>\
  				                 <td >" + result.userWorkID + "</td>\
  				                 <td >" + result.userName + "</td>\
  				                 <td >" + result.userMobile + "</td>\
  				                 <td >" + result.userEmail + "</td>\
  				                 <td >" + result.groupName + "</td>\
  				                 <td >" + result.devRoom + "</td>\
  				                 <td ><a href=\"#\" onclick=\"setUserRole("+ result.userID +",'"+ result.userName +"')  \">\
                                        <font>指定角色</font></a></td>\
  				                 <td ><a href=\"#\" onclick=\"updateUser(" + result.userID + ")  \">修改</a></td>\
				                 <td ><a href=\"#\" onclick=\"deleteUser(" + result.userID + ")  \">\
        		                        <font>删除</font></a></td>\
  				                 <td style=\"display:none\">" + result.userID + "</td></tr>";
                             $("#usersTab").append(usersItem);
                         }
                     });
                 },
                 error:function(e){
                     sweetAlert("网页发生错误：", e, "error");
                 }
          });
     });
     
     var setting1 = {
    		data: {
    			simpleData: {
    				 enable: true,
    				 idKey: "id",
    				 pIdKey: "pId",
    				 rootPId: 0
    			}
    	    }
    };

     var treeNodes1 = [
              {"id":1, "pId":0, "name":"用户列表", "url":"<%=basePath%>loadUsersList.do","target":"_self"},
              {"id":2, "pId":0, "name":"角色列表", "url":"<%=basePath%>loadRolesList.do","target":"_self"},
              {"id":3, "pId":0, "name":"权限列表", "url":"<%=basePath%>loadAuthoritiesList.do","target":"_self"},
              {"id":4, "pId":0, "name":"文件管理", "url":"<%=basePath%>loadFilesList.do","target":"_self"}
     ];

      var tree1 = $("#treeMenu");  
      $(function() {   
           tree1 = $.fn.zTree.init(tree1, setting1, treeNodes1); 
           tree1.expandAll(true); 
      });  
      
      function deleteUser(userID) {
          swal({
              title:"提示",
              text:"您确定要删除该用户吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteUser.do",
                   data : { userID : userID }	   
              }).done(function() {
                     window.location.href = "<%=basePath%>loadUsersList.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
      
	  function updateUser(userID) {
		   updateUserDialog(userID);
  	       event.preventDefault();
      }
	 
	  function updateUserDialog(userID) {
  	      $(function(){
               $.ajax({
          	       type: "POST",
                     url : "<%=basePath%>getUserByID.do",
                     data : { userID: userID },
                     success : function(msg) {
                  	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                  	       $("#strUserWorkID").attr("value", msgRes.userWorkID);
               	           $("#strUserName").attr("value", msgRes.userName);
               	           $("#strUserMobile").attr("value", msgRes.userMobile);
               	           $("#strUserEmail").attr("value", msgRes.userEmail);
               	           
               	           var setting2 = {
               	     		   data: {
               	     			   simpleData: {
               	     				    enable: true,
               	     				    idKey: "id",
               	     				    pIdKey: "pId",
               	     				    rootPId: 0
               	     			   }
               	     	       },
               	     	       check:{   //表示tree的节点在点击时的相关设置
               	                     enable:true,   //是否显示radio/checkbox
               	                     chkStyle: "radio",
               	       		         radioType: "all",  //设置tree的分组
               	               }
               	           };
               	           
               	           var  treeNodes2 = [
                          	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                          	                  {"id":11, "pId":1, "name":"风险管理设计室"},
                          	                  {"id":12, "pId":1, "name":"信用风险开发室"},
                          	                  {"id":13, "pId":1, "name":"对公信贷开发室"},
                          	                  {"id":14, "pId":1, "name":"操作风险开发室"},
                          	                  {"id":15, "pId":1, "name":"风险计量开发室"}
                          	      ];
               	           if(msgRes.devRoom == "对公信贷开发室") {
               	        	     treeNodes2 = [
                          	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                          	                  {"id":11, "pId":1, "name":"风险管理设计室"},
                          	                  {"id":12, "pId":1, "name":"信用风险开发室"},
                          	                  {"id":13, "pId":1, "name":"对公信贷开发室", checked:true},
                          	                  {"id":14, "pId":1, "name":"操作风险开发室"},
                          	                  {"id":15, "pId":1, "name":"风险计量开发室"}
                          	      ];
               	           } else if (msgRes.devRoom == "风险管理设计室") {
             	        	     treeNodes2 = [
                           	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                           	                  {"id":11, "pId":1, "name":"风险管理设计室", checked:true},
                           	                  {"id":12, "pId":1, "name":"信用风险开发室"},
                           	                  {"id":13, "pId":1, "name":"对公信贷开发室"},
                           	                  {"id":14, "pId":1, "name":"操作风险开发室"},
                           	                  {"id":15, "pId":1, "name":"风险计量开发室"}
                           	      ];
               	           }  else if (msgRes.devRoom == "信用风险开发室") {
             	        	     treeNodes2 = [
                         	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                         	                  {"id":11, "pId":1, "name":"风险管理设计室"},
                         	                  {"id":12, "pId":1, "name":"信用风险开发室", checked:true},
                         	                  {"id":13, "pId":1, "name":"对公信贷开发室"},
                         	                  {"id":14, "pId":1, "name":"操作风险开发室"},
                         	                  {"id":15, "pId":1, "name":"风险计量开发室"}
                         	      ];
             	           } else if (msgRes.devRoom == "操作风险开发室") {
             	        	     treeNodes2 = [
                         	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                         	                  {"id":11, "pId":1, "name":"风险管理设计室"},
                         	                  {"id":12, "pId":1, "name":"信用风险开发室"},
                         	                  {"id":13, "pId":1, "name":"对公信贷开发室"},
                         	                  {"id":14, "pId":1, "name":"操作风险开发室", checked:true},
                         	                  {"id":15, "pId":1, "name":"风险计量开发室"}
                         	      ];
             	           } else if (msgRes.devRoom == "风险计量开发室") {
           	        	     treeNodes2 = [
                      	                  {"id":1, "pId":0, "name":"风险业务开发团队"},
                      	                  {"id":11, "pId":1, "name":"风险管理设计室"},
                      	                  {"id":12, "pId":1, "name":"信用风险开发室"},
                      	                  {"id":13, "pId":1, "name":"对公信贷开发室"},
                      	                  {"id":14, "pId":1, "name":"操作风险开发室"},
                      	                  {"id":15, "pId":1, "name":"风险计量开发室", checked:true}
                      	      ];
          	              }
               	           
               	           var tree2 = $("#groupAndDevRoom");  
               	           $(function() {   
               	                tree2 = $.fn.zTree.init(tree2, setting2, treeNodes2); 
               	                tree2.expandAll(false); 
               	           });  
                     },
                     error : function(e) {    
                  	      sweetAlert("初始化用户信息失败：", e, "error");
                     }
               });
         });
  	  
	     $("#dialog").dialog({
	    	   title: "修改用户信息",
	    	   autoOpen: true,
	    	   width: 500,
	       	   height: 660,
	      	   buttons: [
	      		 {
	      			text: "更新",
	      			click: function() {
	      				var strUserWorkID = document.getElementById("strUserWorkID").value;   // 工号
	    	            if(strUserWorkID == "") {
	    	                sweetAlert("工号不能为空！");
	    	                return;
	    	            }
	    	            var strUserName = document.getElementById("strUserName").value;   // 姓名
	    	            if(strUserName == "") {
	    	                sweetAlert("姓名不能为空！");
	    	                return;
	    	            }
	    	            var strUserMobile = document.getElementById("strUserMobile").value;   // 手机号码
	    	            if(strUserMobile == "") {
	    	                sweetAlert("手机号码不能为空！");
	    	                return;
	    	            }
	    	            var strUserEmail = document.getElementById("strUserEmail").value;   // 邮箱
	    	            if(strUserEmail == "") {
	    	                sweetAlert("邮箱不能为空！");
	    	                return;
	    	            }
	    	            
	    	            var treeObj = $.fn.zTree.getZTreeObj("groupAndDevRoom");
               	        var nodes = treeObj.getCheckedNodes(true);
               	        var strGroupName = nodes[0].getParentNode().name; 
	    	            var strDevRoom = nodes[0].name;
               	     
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>updateUser.do",
	      	                data : { userID : userID, 
	      	                	  strUserWorkID : strUserWorkID, strUserName : strUserName,
	      	                	  strUserMobile : strUserMobile, strUserEmail : strUserEmail,
	      	                	  strGroupName : strGroupName, strDevRoom : strDevRoom
	      	                },
	      	                success: function () {
	      	                	   sweetAlert("提示", "更新用户信息成功！", "success");
	      	                	   window.location.href = "<%=basePath%>loadUsersList.do";
	                        },
	  						error : function(e) {
	  								sweetAlert("更新用户信息失败：", e, "error");
	  						}
	  				    });
	  				    $(this).dialog("close");
	  				   }
	  			}, {
	  				text : "取消",
	  				click : function() {
	  						$(this).dialog("close");
	  				}
	  			} ]
	  	    });
	 }
	</script>
	
	<div id="dialogUserRole" style="display: none;">
		<div id="UserRoleInfo" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; ">当前为用户：</label> 
				<input id="roleUserName" type="text" style="margin-top: 30px; width: 220px" />
				<label style="margin-top: 10px; margin-left: 20px; ">指定角色</label> 
			    <label style="margin-top: 10px;  color: #ff0000;">*</label> 
			    <ul id="rolesTree" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
			</div>
		</div>
	</div>
	<script>
    function setUserRole(userID, userName) {
    	 setUserRoleDialog(userID, userName);
   	     event.preventDefault();
     }
	 
	 function setUserRoleDialog(userID, userName) {
   	      $(function(){
   	    	      $("#roleUserName").attr("value", userName);

	              var setting3 = {
	    		       data: {
	     			        simpleData: {
	     				          enable: true,
	     				          idKey: "id",
	     				          pIdKey: "pId",
	     				          rootPId: 0
	     			        }
	     	          },
	     	          check:{   //表示tree的节点在点击时的相关设置
	                       enable:true,   //是否显示radio/checkbox
	                       chkStyle: "checkbox",
	                  }
                };
                var treeNodes3; 
                $.ajax({  
                     cache : false,  //是否使用缓存  
                     type : 'POST',  //请求方式：post  
                     dataType : 'json', //数据传输格式：json  
                     url : "<%=basePath%>initUserRolesTree.do", 
                     data : { userID : userID },	  		 
                     error : function() {  
                          sweetAlert("请求角色资源树数据失败！");
                     },  
                     success : function(data) {  
                          treeNodes3 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                          var tree3 = $("#rolesTree");  
                          tree3 = $.fn.zTree.init(tree3, setting3, treeNodes3); 
                     }  
               });  
          });
   	  
	     $("#dialogUserRole").dialog({
	    	   title: "用户角色",
	    	   autoOpen: true,
	    	   width: 420,
	    	   height: 560,
	      	   buttons: [
	      		 {
	      			text: "指定角色",
	      			click: function() {
	    	            var rolesTreeObj = $.fn.zTree.getZTreeObj("rolesTree");
               	        var nodes = rolesTreeObj.getCheckedNodes(true);
               	        roleIDStr = "";
                        for(var i=0; i<nodes.length; i++){
                        	if(i == 0) {
                        		roleIDStr += nodes[i].id;
                        	} else {
                        		roleIDStr += "," + nodes[i].id ;
                        	}
                         }
	      	         
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>setUserRole.do",
	      	                data : { userID : userID, roleIDStr : roleIDStr },
	      	                success: function () {
	      	                	   sweetAlert("提示","指定用户角色成功！", "success");
	                        },
	  						error : function(e) {
	  								sweetAlert("指定用户角色失败：", e, "error");
	  						}
	  				    });
	  				    $(this).dialog("close");
	  				   }
	  			}, {
	  				text : "取消",
	  				click : function() {
	  						$(this).dialog("close");
	  				}
	  			} ]
	  	    });
	 }
	</script>
</body>
</html>