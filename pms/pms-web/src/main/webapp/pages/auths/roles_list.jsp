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
<title>角色列表</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/roles-layout.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/sweet-alert.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/jquery-ui-1.11.4/external/jquery/jquery.js"></script>
<script src="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.js"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
<script src="<%=basePath%>static/js/main.js" type="text/javascript"></script>
</head>

<body>
	<div id="container">
		<div id="head">
			<div id="main_top">
				<div id="logo">
					<a href="#" > 
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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 权限管理->角色列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">角色名：</label> 
					 <input id="roleName" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">角色类型：</label>
					 <select id="roleType" style="width: 120px; height: 24px; margin-top: 0.5%;">
                           <option id="roleType_Op1">全部</option>
                           <option id="roleType_Op2">室经理</option>
                           <option id="roleType_Op3">项目组长</option>
                           <option id="roleType_Op4">普通开发人员</option>
                           <option id="roleType_Op5">管理员</option>
                     </select>
					 <img id="rolesSearch" class="rolesSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newRole" type="button" class="btn btn-default btn-sm" >新建角色</button>
				</div>

				<div id="rolesListTable">
					<table id="rolesTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 120px">角色名</td>
							<td style="width: 100px">角色类型</td>
							<td style="width: 160px">角色描述</td>
							<td style="width: 50px">角色权限</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="rolesPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="rolesFirst" class="rolesSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="rolesPrevious" class="rolesSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="rolesCenterBar" style="width: 60px;">
							      <input id="rolesCurPageNum" style="width: 30px; background-color: #eee; " readonly="readonly" />
							      <label>/</label> 
							      <input id="rolesTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="rolesNext" class="rolesSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="rolesEnd" class="rolesSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="rolesCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="rolesJumpN" class="rolesSkip" src="<%=basePath%>static/img/sureBtn.png" />
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

	<script>
     $(document).ready(function () {
    	 // 异步加载角色列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchRoles.do",
             data : { 
            	 roleName : null, 
            	 roleType : null,
            	 pageNum : 1
             },	  	 
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("rolesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.rolesTotalNum+"条记录";
                 $("#rolesCurPageNum").attr("value", 1);
                 $("#rolesTotalPage").attr("value", msgRes.rolesTotalPage);
                 $("#rolesCurNo").attr("value", 1);

                 // 清空 table
                 var rolesTB = document.getElementById("rolesTab");
                 var rowNum = rolesTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 rolesTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var rolesItem;
                 $.each(msgRes.roleDTOsList,function(i,result){
                    	 rolesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
				               <td >" + result.sortIndex + "</td>\
				               <td >" + result.roleName + "</td>\
				               <td >" + result.roleType + "</td>\
				               <td >" + result.roleDescription + "</td>\
				               <td ><a href=\"#\" onclick=\"setRoleAuth("+ result.roleID +",'"+ result.roleName +"')  \">\
	                                 <font>设置</font></a></td>\
			                   <td ><a href=\"#\" onclick=\"updateRole("+ result.roleID +")  \">修改</a></td>\
			                   <td ><a href=\"#\" onclick=\"deleteRole("+ result.roleID +")  \">\
   		                             <font>删除</font></a></td>\
				               <td style=\"display:none\">" + result.roleID + "</td></tr>";
                         $("#rolesTab").append(rolesItem);
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".rolesSkip").click(function(){
          var rolesCurPageNum = Number(document.getElementById("rolesCurPageNum").value);  //当前页码
          var rolesPageNum = 1;  // 将要跳转的页码
          var rolesTotalPage = Number(document.getElementById("rolesTotalPage").value);  //页码总数
          if (this.id == "rolesFirst") {   // 首页
        	  rolesPageNum = 1;
          } else if (this.id == "rolesPrevious") {  //上一页
                 if (rolesCurPageNum > 1 && rolesCurPageNum <= rolesTotalPage) {
                	 rolesPageNum = Number(rolesCurPageNum) - 1;
                 } else {
                	 rolesPageNum = 1;
                 }
             } else if (this.id == "rolesNext") { // 下一页
                 if (rolesCurPageNum < rolesTotalPage){
                	 rolesPageNum = Number(rolesCurPageNum) + 1;
                 }else {
                	 rolesPageNum = rolesTotalPage;
                 }
             } else if (this.id == "rolesEnd") {  // 末页
            	 rolesPageNum = rolesTotalPage;
             } else if (this.id == "rolesSearch") {  // 查询
            	 rolesPageNum = 1;
             } else if (this.id == "rolesJumpN") {
                 var rolesCurNo = Number(document.getElementById("rolesCurNo").value);
                 if(rolesCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(rolesCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (rolesCurNo > rolesTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 rolesPageNum = Number(rolesCurNo);
             }
             
             // 查询条件
             var roleName = document.getElementById("roleName").value;   
             var roleType = document.getElementById("roleType").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchRoles.do",
                 data : { 
                        roleName : roleName, 
                        roleType : roleType,
                        pageNum : rolesPageNum
                  },	  	
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("rolesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.rolesTotalNum+"条记录";
                     $("#rolesCurPageNum").attr("value", rolesPageNum);
                     $("#rolesTotalPage").attr("value", msgRes.rolesTotalPage);
                     $("#rolesCurNo").attr("value", rolesPageNum);

                     // 清空 table
                     var rolesTB = document.getElementById("rolesTab");
                     var rowNum = rolesTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 rolesTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var rolesItem;
                     $.each(msgRes.roleDTOsList,function(i, result) {
                        	 rolesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
                        		 <td >" + result.sortIndex + "</td>\
  				                 <td >" + result.roleName + "</td>\
  				                 <td >" + result.roleType + "</td>\
  				                 <td >" + result.roleDescription + "</td>\
  				                 <td ><a href=\"#\" onclick=\"setRoleAuth("+ result.roleID +",'"+ result.roleName +"')  \">\
		                                   <font>设置</font></a></td>\
  				                 <td ><a href=\"#\" onclick=\"updateRole("+ result.roleID +")  \">修改</a></td>\
  				                 <td ><a href=\"#\" onclick=\"deleteRole("+ result.roleID +")  \">\
            		                       <font>删除</font></a></td>\
  				                 <td style=\"display:none\">" + result.roleID + "</td></tr>";
                           $("#rolesTab").append(rolesItem);
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
      
      function deleteRole(roleID) {
    	  if (roleID == "1") {
    		  sweetAlert("警告", "根角色无法删除！", "warning");
    		  return;
    	  } 
          swal({
              title:"提示",
              text:"您确定要删除该角色吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteRole.do",
                   data : { 
                	    roleID : roleID
                   }  		   
              }).done(function() {
                     window.location.href = "<%=basePath%>loadRolesList.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
	</script>

	<div id="dialogRole" style="display: none;">
		<div id="RoleInfo" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">角色名*：</label> 
				<input id="newRoleName" type="text" style="margin-top: 30px; width: 250px" />
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">角色类型*：</label> 
				<select id="newRoleType" style="margin-top:30px; height:30px; width:235px;">
                     <option id="newRoleType_Op1">室经理</option>
                     <option id="newRoleType_Op2">项目组长</option>
                     <option id="newRoleType_Op3">普通开发人员</option>
                     <option id="newRoleType_Op4">管理员</option>
                </select>
			    <label style="margin-top: 30px; margin-left: 20px; ">角色描述：</label> 
			    <input id="newRoleDescription" type="text" style="margin-top: 30px; width: 240px" />
			    <label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">所属父角色*：</label> 
			    <ul id="rolesTree" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#newRole").click(function() {
	       // 清空缓存
	      $("#newRoleName").attr("value", "");
	      $("#newRoleDescription").attr("value", "");
	      
	      var rts = document.getElementById("newRoleType")
  	      rts.options[rts.selectedIndex].removeAttribute("selected");
	      $("#newRoleType_Op4").attr("selected", "selected");
	      
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
           var treeNodes2; 
           $.ajax({  
                 cache : false,  //是否使用缓存  
                 type : 'POST',  //请求方式：post  
                 dataType : 'json', //数据传输格式：json  
                 url : "<%=basePath%>initRolesTree.do",
                 data : { 
                	 parentRoleID : -1,
             	     roleID : -1
                 },  			 
                 error : function() {  
                      sweetAlert("请求角色资源树数据失败！");
                 },  
                 success : function(data) {  
                      treeNodes2 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                      var tree2 = $("#rolesTree");  
                      tree2 = $.fn.zTree.init(tree2, setting2, treeNodes2); 
                 }  
          });  
	      
	      newRoleDialog();
	      event.preventDefault();
	  });
	
	 function newRoleDialog() {
		 $("#dialogRole").dialog({
			   autoOpen: true,
	    	   title: "新建角色",
	    	   width: 450,
	    	   height: 620,
	    	   buttons: [
	    		 {
	    			text: "创建",
	    			click: function() {
	    	            var newRoleName = document.getElementById("newRoleName").value;   // 角色名
	    	            if(newRoleName == "") {
	    	                sweetAlert("角色名不能为空！");
	    	                return;
	    	            }
	    	            var newRoleType = document.getElementById("newRoleType").value;   // 角色类型
	    	            if(newRoleType == "") {
	    	                sweetAlert("角色类型不能为空！");
	    	                return;
	    	            }
	    	            var newRoleDescription = document.getElementById("newRoleDescription").value;   // 角色描述

	    	            var rolesTreeObj = $.fn.zTree.getZTreeObj("rolesTree");
               	        var nodes = rolesTreeObj.getCheckedNodes(true);
	    	            var parentRoleID = nodes[0].id;
	    	            
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>createRole.do",
	    	                data : { 
	    	                	  newRoleName : newRoleName,
	    	                	  newRoleType : newRoleType,
	    	                	  newRoleDescription : newRoleDescription,
	    	                	  parentRoleID : parentRoleID
	    	                },  	
	    	                success: function () {
	    	                	   sweetAlert("警告", "创建角色成功！", "success");
	    	                	   window.location.href = "<%=basePath%>loadRolesList.do";
	                        },
							error : function(e) {
									sweetAlert("创建角色失败：", e, "error");
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
     
	 function updateRole(roleID) {
		 if (roleID == "1") {
   		      sweetAlert("警告", "根角色无法修改！", "warning");
   		      return;
   	     } 
		 updateRoleDialog(roleID);
   	     event.preventDefault();
     }
	 
	 function updateRoleDialog(roleID) {
   	      $(function(){
                $.ajax({
           	          type: "POST",
                      url : "<%=basePath%>getRoleByID.do",
                      data : { roleID: roleID },
                      success : function(msg) {
                   	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                   	       
                   	       $("#newRoleName").attr("value", msgRes.roleName);
              	           $("#newRoleDescription").attr("value", msgRes.roleDescription);
              	      
              	           var rts = document.getElementById("newRoleType")
                	       rts.options[rts.selectedIndex].removeAttribute("selected");
              	           if (msgRes.roleType == 'PM') {
              	        	    $("#newRoleType_Op1").attr("selected", "selected");
              	           } else if (msgRes.roleType == 'PL') {
              	        	    $("#newRoleType_Op2").attr("selected", "selected");
              	           } else if (msgRes.roleType == 'CD') {
              	        	    $("#newRoleType_Op3").attr("selected", "selected");
              	           } else {
              	        	    $("#newRoleType_Op4").attr("selected", "selected");
              	           }
              	      
              	           var parentRoleID = msgRes.parentRoleID;
              	           
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
               	                     chkStyle: "radio",
               	       		         radioType: "all",  //设置tree的分组
               	                }
                          };
                          var treeNodes3; 
                          $.ajax({  
                               cache : false,  //是否使用缓存  
                               type : 'POST',  //请求方式：post  
                               dataType : 'json', //数据传输格式：json  
                               url : "<%=basePath%>initRolesTree.do", 
                               data : { 
 	    	                	    parentRoleID : parentRoleID,
 	    	                	    roleID : roleID
 	    	                   },  	
                               error : function() {  
                                    sweetAlert("请求角色资源树数据失败！");
                               },  
                               success : function(data) {  
                                    treeNodes3 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                                    var tree3 = $("#rolesTree");  
                                    tree3 = $.fn.zTree.init(tree3, setting3, treeNodes3); 
                               }  
                         });  
                       },
                      error : function(e) {    
                   	      sweetAlert("初始化角色信息失败：", e, "error");
                      }
                });
         });
   	  
	     $("#dialogRole").dialog({
	    	   title: "修改角色",
	    	   autoOpen: true,
	    	   width: 450,
	    	   height: 620,
	      	   buttons: [
	      		 {
	      			text: "更新",
	      			click: function() {
	      				var newRoleName = document.getElementById("newRoleName").value;   // 角色名
	    	            if(newRoleName == "") {
	    	                sweetAlert("角色名不能为空！");
	    	                return;
	    	            }
	    	            var newRoleType = document.getElementById("newRoleType").value;   // 角色类型
	    	            if(newRoleType == "") {
	    	                sweetAlert("角色类型不能为空！");
	    	                return;
	    	            }
	    	            var newRoleDescription = document.getElementById("newRoleDescription").value;   // 角色描述

	    	            var rolesTreeObj = $.fn.zTree.getZTreeObj("rolesTree");
               	        var nodes = rolesTreeObj.getCheckedNodes(true);
	    	            var parentRoleID = nodes[0].id;
	      	         
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>updateRole.do",
	      	                data : { roleID : roleID, 
	      	                	newRoleName : newRoleName, newRoleType : newRoleType,
	      	                	newRoleDescription : newRoleDescription, parentRoleID : parentRoleID
	      	                },
	      	                success: function () {
	      	                	   sweetAlert("更新角色信息成功！", "success");
	      	                	   window.location.href = "<%=basePath%>loadRolesList.do";
	                        },
	  						error : function(e) {
	  								sweetAlert("更新角色信息失败：", e, "error");
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
	
	<div id="dialogRoleAuth" style="display: none;">
		<div id="RoleAuthInfo" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; ">当前为角色：</label> 
				<input id="authRoleName" type="text" style="margin-top: 30px; width: 220px" />
				<label style="margin-top: 10px; margin-left: 20px; ">设置权限</label> 
			    <label style="margin-top: 10px;  color: #ff0000;">*</label> 
			    <ul id="authsTree" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
			</div>
		</div>
	</div>
	<script>
    function setRoleAuth(roleID, roleName) {
    	if (roleID == "1") {
 		      sweetAlert("提示", "根角色无须设置角色权限！", "warning");
 		      return;
 	     } 
    	 setRoleAuthDialog(roleID, roleName);
   	     event.preventDefault();
     }
	 
	 function setRoleAuthDialog(roleID, roleName) {
   	      $(function(){
   	    	      $("#authRoleName").attr("value", roleName);

	              var setting4 = {
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
                var treeNodes4; 
                $.ajax({  
                     cache : false,  //是否使用缓存  
                     type : 'POST',  //请求方式：post  
                     dataType : 'json', //数据传输格式：json  
                     url : "<%=basePath%>initRoleAuthsTree.do", 
                     data : { roleID : roleID },  	
                     error : function() {  
                          sweetAlert("请求权限资源树数据失败！");
                     },  
                     success : function(data) {  
                          treeNodes4 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                          var tree4 = $("#authsTree");  
                          tree4 = $.fn.zTree.init(tree4, setting4, treeNodes4); 
                     }  
               });  
          });
   	  
	     $("#dialogRoleAuth").dialog({
	    	   title: "角色权限",
	    	   autoOpen: true,
	    	   width: 450,
	    	   height: 620,
	      	   buttons: [
	      		 {
	      			text: "设置",
	      			click: function() {
	    	            var authsTreeObj = $.fn.zTree.getZTreeObj("authsTree");
               	        var nodes = authsTreeObj.getCheckedNodes(true);
               	        authIDStr = "";
                        for(var i=0; i<nodes.length; i++){
                        	if(i == 0) {
                        		authIDStr += nodes[i].id;
                        	} else {
                        		authIDStr += "," + nodes[i].id ;
                        	}
                         }
	      	         
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>setRoleAuth.do",
	      	                data : { roleID : roleID, authIDStr : authIDStr },
	      	                success: function () {
	      	                	   sweetAlert("提示","设置角色权限成功！", "success");
	                        },
	  						error : function(e) {
	  								sweetAlert("设置角色权限失败：", e, "error");
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