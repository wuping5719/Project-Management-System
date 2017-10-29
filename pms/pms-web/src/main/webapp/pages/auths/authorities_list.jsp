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
<title>权限列表</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/auths-layout.css" rel="stylesheet" type="text/css" />

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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 权限管理->权限列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">权限名：</label> 
					 <input id="authName" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="authsSearch" class="authsSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newAuth" type="button" class="btn btn-default btn-sm" >新建权限</button>
					 <button id="viewAuth" type="button" class="btn btn-default btn-sm" >查看权限资源树</button>
				</div>

				<div id="authsListTable">
					<table id="authsTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 120px">权限名</td>
							<td style="width: 160px">权限描述</td>
							<td style="width: 120px">权限URL</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="authsPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="authsFirst" class="authsSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="authsPrevious" class="authsSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="authsCenterBar" style="width: 60px;">
							      <input id="authsCurPageNum" style="width: 30px; background-color: #eee; " readonly="readonly" />
							      <label>/</label> 
							      <input id="authsTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="authsNext" class="authsSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="authsEnd" class="authsSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="authsCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="authsJumpN" class="authsSkip" src="<%=basePath%>static/img/sureBtn.png" />
							</td>
							<td style="width: 60px;"></td>
						</tr>
					</table>
				</div>

			</div>
		</div>

		<div id="footer">
			<p>Copyright &copy; 2017  吴平 版权所有</p>
		</div>
	</div>

	<script>
     $(document).ready(function () {
    	 // 异步加载角色列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchAuths.do",
             data : { authName : null, pageNum : 1 },		 
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("authsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.authsTotalNum+"条记录";
                 $("#authsCurPageNum").attr("value", 1);
                 $("#authsTotalPage").attr("value", msgRes.authsTotalPage);
                 $("#authsCurNo").attr("value", 1);

                 // 清空 table
                 var authsTB = document.getElementById("authsTab");
                 var rowNum = authsTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 authsTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var authsItem;
                 $.each(msgRes.authDTOsList,function(i,result) {
                	  authsItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
			                <td >" + result.sortIndex + "</td>\
			                <td >" + result.authName + "</td>\
			                <td >" + result.authDescription + "</td>\
			                <td >" + result.authURL + "</td>\
			                <td ><a href=\"#\" onclick=\"updateAuth(" + result.authorityID + ")  \">修改</a></td>\
			                <td ><a href=\"#\" onclick=\"deleteAuth(" + result.authorityID + ")  \">\
  		                          <font>删除</font></a></td>\
			                <td style=\"display:none\">" + result.authorityID + "</td></tr>";
                      $("#authsTab").append(authsItem);
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".authsSkip").click(function(){
          var authsCurPageNum = Number(document.getElementById("authsCurPageNum").value);  //当前页码
          var authsPageNum = 1;  // 将要跳转的页码
          var authsTotalPage = Number(document.getElementById("authsTotalPage").value);  //页码总数
          if (this.id == "authsFirst") {   // 首页
        	  authsPageNum = 1;
          } else if (this.id == "authsPrevious") {  //上一页
                 if (authsCurPageNum > 1 && authsCurPageNum <= authsTotalPage) {
                	 authsPageNum = Number(authsCurPageNum) - 1;
                 } else {
                	 authsPageNum = 1;
                 }
             } else if (this.id == "authsNext") { // 下一页
                 if (authsCurPageNum < authsTotalPage){
                	 authsPageNum = Number(authsCurPageNum) + 1;
                 }else {
                	 authsPageNum = authsTotalPage;
                 }
             } else if (this.id == "authsEnd") {  // 末页
            	 authsPageNum = authsTotalPage;
             } else if (this.id == "authsSearch") {  // 查询
            	 authsPageNum = 1;
             } else if (this.id == "authsJumpN") {
                 var authsCurNo = Number(document.getElementById("authsCurNo").value);
                 if(authsCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(authsCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (authsCurNo > authsTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 authsPageNum = Number(authsCurNo);
             }
             
             // 查询条件
             var authName = document.getElementById("authName").value;    

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchAuths.do",
                 data : { authName : authName, pageNum : authsPageNum },	
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("authsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.authsTotalNum+"条记录";
                     $("#authsCurPageNum").attr("value", authsPageNum);
                     $("#authsTotalPage").attr("value", msgRes.authsTotalPage);
                     $("#authsCurNo").attr("value", authsPageNum);

                     // 清空 table
                     var authsTB = document.getElementById("authsTab");
                     var rowNum = authsTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 authsTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var authsItem;
                     $.each(msgRes.authDTOsList,function(i, result){
                    	   authsItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
			                    <td >" + result.sortIndex + "</td>\
			                    <td >" + result.authName + "</td>\
			                    <td >" + result.authDescription + "</td>\
			                    <td >" + result.authURL + "</td>\
			                    <td ><a href=\"#\" onclick=\"updateAuth(" + result.authorityID + ")  \">修改</a></td>\
			                    <td ><a href=\"#\" onclick=\"deleteAuth(" + result.authorityID + ")  \">\
		                              <font>删除</font></a></td>\
			                    <td style=\"display:none\">" + result.authorityID + "</td></tr>";
                            $("#authsTab").append(authsItem);
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
      
      function deleteAuth(authorityID) {
    	  if (authorityID == "1") {
    		  sweetAlert("警告", "根权限无法删除！", "warning");
    		  return;
    	  } else {
    		  swal({
                  title:"提示",
                  text:"您确定要删除该权限吗？",
                  type:"warning",
                  showConfirmButton:"true",
                  showCancelButton:"true",
                  confirmButtonText:"确定",
                  cancelButtonText:"取消",
                  animation:"slide-from-top"
              }, function() {
                  $.ajax({
                       type : "POST",
                       url : "<%=basePath%>deleteAuth.do",
                       data : { authorityID : authorityID },		   
                  }).done(function() {
                         window.location.href = "<%=basePath%>loadAuthoritiesList.do";
                  }).error(function() {
                       swal("OMG", "删除操作失败了!",  "error");
                  });
              });
    	  }
      }
	</script>

	<div id="dialog" style="display: none;">
		<div id="AuthInfo" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div>
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">权限名*：</label> 
				<input id="newAuthName" type="text" style="margin-top: 30px; width: 250px" />
			    <label style="margin-top: 30px; margin-left: 20px; ">权限描述：</label> 
			    <input id="newAuthDescription" type="text" style="margin-top: 30px; width: 240px" />
			    <label style="margin-top: 30px; margin-left: 20px; ">权限URL：</label> 
			    <input id="newAuthURL" type="text" style="margin-top: 30px; width: 240px" />
			    <label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">所属父级权限*：</label> 
			    <ul id="auhtsTree" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#newAuth").click(function() {
	       // 清空缓存
	      $("#newAuthName").attr("value", "");
	      $("#newAuthDescription").attr("value", "");
	      $("#newAuthURL").attr("value", "");
	      
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
                 url : "<%=basePath%>initAuthsTree.do",  
                 data : { parentAuthID : -1, authorityID : -1},	
                 error : function() {  
                      sweetAlert("请求权限资源树数据失败！");
                 },  
                 success : function(data) {  
                      treeNodes2 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                      var tree2 = $("#auhtsTree");  
                      tree2 = $.fn.zTree.init(tree2, setting2, treeNodes2); 
                 }  
          });  
	      
	      newAuthDialog();
	      event.preventDefault();
	  });
	
	 function newAuthDialog() {
		 $("#dialog").dialog({
			   autoOpen: true,
	    	   title: "新建权限",
	    	   width: 450,
	    	   height: 620,
	    	   buttons: [
	    		 {
	    			text: "创建",
	    			click: function() {
	    	            var newAuthName = document.getElementById("newAuthName").value;   // 权限名
	    	            if(newAuthName == "") {
	    	                sweetAlert("权限名不能为空！");
	    	                return;
	    	            }
	    	            var newAuthDescription = document.getElementById("newAuthDescription").value;   // 权限描述
	    	            var newAuthURL = document.getElementById("newAuthURL").value;   // 权限URL
	    	            
	    	            var auhtsTreeObj = $.fn.zTree.getZTreeObj("auhtsTree");
               	        var nodes = auhtsTreeObj.getCheckedNodes(true);
	    	            var parentAuthID = nodes[0].id;
	    	            
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>createAuth.do",
	    	                data : { newAuthName : newAuthName, 
	    	                	newAuthDescription : newAuthDescription,
	    	                	newAuthURL : newAuthURL,
	    	                	parentAuthID : parentAuthID
	    	                },	
	    	                success: function () {
	    	                	   sweetAlert("创建权限成功！", "success");
	    	                	   window.location.href = "<%=basePath%>loadAuthoritiesList.do";
	                        },
							error : function(e) {
									sweetAlert("创建权限失败：", e, "error");
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
     
	 function updateAuth(authorityID) {
		 if (authorityID == "1") {
 		       sweetAlert("警告", "根权限无法修改！", "warning");
 		       return;
 	      } 
		 updateAuthDialog(authorityID);
   	     event.preventDefault();
     }
	 
	 function updateAuthDialog(authorityID) {
   	      $(function(){
                $.ajax({
           	          type: "POST",
                      url : "<%=basePath%>getAuthByID.do",
                      data : { authorityID: authorityID },
                      success : function(msg) {
                   	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                   	       
                   	       $("#newAuthName").attr("value", msgRes.authName);
              	           $("#newAuthDescription").attr("value", msgRes.authDescription);
              	           $("#newAuthURL").attr("value", msgRes.authURL);
              	           
              	           var parentAuthID = msgRes.parentAuthID;
              	           
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
                               url : "<%=basePath%>initAuthsTree.do", 
                               data : { parentAuthID : parentAuthID,  authorityID : authorityID},		   
                               error : function() {  
                                    sweetAlert("请求权限资源树数据失败！");
                               },  
                               success : function(data) {  
                                    treeNodes3 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                                    var tree3 = $("#auhtsTree");  
                                    tree3 = $.fn.zTree.init(tree3, setting3, treeNodes3); 
                               }  
                         });  
                       },
                      error : function(e) {    
                   	      sweetAlert("初始化权限信息失败：", e, "error");
                      }
                });
         });
   	  
	     $("#dialog").dialog({
	    	   title: "修改权限",
	    	   autoOpen: true,
	    	   width: 450,
	    	   height: 620,
	      	   buttons: [
	      		 {
	      			text: "更新",
	      			click: function() {
	      				var newAuthName = document.getElementById("newAuthName").value;   // 权限名
	    	            if(newAuthName == "") {
	    	                sweetAlert("权限名不能为空！");
	    	                return;
	    	            }
	    	            var newAuthDescription = document.getElementById("newAuthDescription").value;   // 权限描述
	    	            var newAuthURL = document.getElementById("newAuthURL").value;   // 权限URL
	    	            
	    	            var auhtsTreeObj = $.fn.zTree.getZTreeObj("auhtsTree");
               	        var nodes = auhtsTreeObj.getCheckedNodes(true);
	    	            var parentAuthID = nodes[0].id;
	      	         
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>updateAuth.do",
	      	                data : { authorityID : authorityID, 
	      	                	   newAuthName : newAuthName, 
	      	                	   newAuthDescription : newAuthDescription, 
	      	                	   newAuthURL : newAuthURL, 
	      	                	   parentAuthID : parentAuthID
	      	                },
	      	                success: function () {
	      	                	   sweetAlert("更新权限信息成功！", "success");
	      	                	   window.location.href = "<%=basePath%>loadAuthoritiesList.do";
	                        },
	  						error : function(e) {
	  								sweetAlert("更新权限信息失败：", e, "error");
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
	
	<div id="viewDialog" style="display: none;">
		<div id="viewAuthDiv" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<ul id="viewAuhtsTree" class="ztree" style="margin-left: 20px; width: 315px; font-size:14px; "></ul> 
		</div>
	</div>
	<script>
	$("#viewAuth").click(function() {
	       var setting4 = {
	    		  data: {
 	     			   simpleData: {
 	     				    enable: true,
 	     				    idKey: "id",
 	     				    pIdKey: "pId",
 	     				    rootPId: 0
 	     			   }
 	     	       }
           };
           var treeNodes4; 
           $.ajax({  
                 cache : false,  //是否使用缓存  
                 type : 'POST',  //请求方式：post  
                 dataType : 'json', //数据传输格式：json  
                 url : "<%=basePath%>initAuthsTree.do?parentAuthID=-1&authorityID=-1",  
                 error : function() {  
                      sweetAlert("请求权限资源树数据失败！");
                 },  
                 success : function(data) {  
                      treeNodes4 = data;   // 把后台封装好的简单Json格式赋给treeNodes  
                      var tree4 = $("#viewAuhtsTree");  
                      tree4= $.fn.zTree.init(tree4, setting4, treeNodes4); 
                      
                      var treeObj4 = $.fn.zTree.getZTreeObj("viewAuhtsTree");
                      treeObj4.expandAll(true);
                 }  
          });  
	      
           viewAuthDialog();
	       event.preventDefault();
	  });
	
	 function viewAuthDialog() {
		 $("#viewDialog").dialog({
			   autoOpen: true,
	    	   title: "查看权限资源树",
	    	   width: 450,
	    	   height: 800,
	    	   buttons: [
	    		{
					text : "关闭",
					click : function() {
						 $(this).dialog("close");
					}
				} ]
		 });
	 }
	 </script>
</body>
</html>