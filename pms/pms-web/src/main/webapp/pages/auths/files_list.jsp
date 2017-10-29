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
<title>文件列表</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/files-layout.css" rel="stylesheet" type="text/css" />

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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 权限管理->文件管理</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">文件名：</label> 
					 <input id="fileName" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">文件类型：</label>
					 <input id="fileType" type="text" style="width: 150px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="filesSearch" class="filesSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="uploadPicFile" type="button" class="btn btn-default btn-sm" >上传图片</button>
				</div>

				<div id="filesListTable">
					<table id="filesTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 120px">文件名</td>
							<td style="width: 100px">文件描述</td>
							<td style="width: 60px">文件类型</td>
							<td style="width: 80px">修改日期</td>
							<td style="width: 80px">文件大小(KB)</td>
							<td style="width: 100px">文件全名</td>
							<td style="width: 40px">删除</td>
						</tr>
					</table>

					<table id="filesPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="filesFirst" class="filesSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="filesPrevious" class="filesSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="filesCenterBar" style="width: 60px;">
							      <input id="filesCurPageNum" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>/</label> 
							      <input id="filesTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="filesNext" class="filesSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="filesEnd" class="filesSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="filesCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="filesJumpN" class="filesSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
    	 // 异步加载文件列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchFiles.do",
             data : { fileName : null, fileType : null, pageNum : 1 },		 
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("filesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.filesTotalNum+"条记录";
                 $("#filesCurPageNum").attr("value", 1);
                 $("#filesTotalPage").attr("value", msgRes.filesTotalPage);
                 $("#filesCurNo").attr("value", 1);

                 //清空table
                 var filesTB = document.getElementById("filesTab");
                 var rowNum = filesTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 filesTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var filesItem;
                 $.each(msgRes.fileDTOsList,function(i,result){
                	   filesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
		                   <td >" + result.sortIndex + "</td>\
		                   <td >" + result.fileName + "</td>\
		                   <td >" + result.fileDescription + "</td>\
		                   <td >" + result.fileType + "</td>\
		                   <td >" + result.createTime + "</td>\
		                   <td >" + result.fileSize + "</td>\
		                   <td >" + result.originalFileName + "</td>\
	                       <td ><a href=\"#\" onclick=\"deleteFile("+ result.fileID +",'"+ result.originalFileName +"')  \">\
	                                  删除</a></td></tr>";
                       $("#filesTab").append(filesItem);
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".filesSkip").click(function(){
          var filesCurPageNum = Number(document.getElementById("filesCurPageNum").value);  //当前页码
          var filesPageNum = 1;  // 将要跳转的页码
          var filesTotalPage = Number(document.getElementById("filesTotalPage").value);  //页码总数
          if (this.id == "filesFirst") {   // 首页
        	  filesPageNum = 1;
          } else if (this.id == "filesPrevious") {  //上一页
                 if (filesCurPageNum > 1 && filesCurPageNum <= filesTotalPage) {
                	 filesPageNum = Number(filesCurPageNum) - 1;
                 } else {
                	 filesPageNum = 1;
                 }
             } else if (this.id == "filesNext") { // 下一页
                 if (filesCurPageNum < filesTotalPage){
                	 filesPageNum = Number(filesCurPageNum) + 1;
                 }else {
                	 filesPageNum = filesTotalPage;
                 }
             } else if (this.id == "filesEnd") {  // 末页
            	 filesPageNum = filesTotalPage;
             } else if (this.id == "filesSearch") {  // 查询
            	 filesPageNum = 1;
             } else if (this.id == "filesJumpN") {
                 var filesCurNo = Number(document.getElementById("filesCurNo").value);
                 if(filesCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(filesCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (filesCurNo > filesTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 filesPageNum = Number(filesCurNo);
             }
             
             // 查询条件
             var fileName = document.getElementById("fileName").value;   
             var fileType = document.getElementById("fileType").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchFiles.do",
                 data : { 
                	  fileName : fileName, 
                	  fileType : fileType, 
                	  pageNum : filesPageNum 
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("filesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.filesTotalNum+"条记录";
                     $("#filesCurPageNum").attr("value", filesPageNum);
                     $("#filesTotalPage").attr("value", msgRes.filesTotalPage);
                     $("#filesCurNo").attr("value", filesPageNum);

                     // 清空 table
                     var filesTB = document.getElementById("filesTab");
                     var rowNum = filesTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 filesTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var filesItem;
                     $.each(msgRes.fileDTOsList,function(i,result){
                    	  filesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
		                      <td >" + result.sortIndex + "</td>\
		                      <td >" + result.fileName + "</td>\
		                      <td >" + result.fileDescription + "</td>\
		                      <td >" + result.fileType + "</td>\
		                      <td >" + result.createTime + "</td>\
		                      <td >" + result.fileSize + "</td>\
		                      <td >" + result.originalFileName + "</td>\
		                      <td ><a href=\"#\" onclick=\"deleteFile("+ result.fileID +",'"+ result.originalFileName +"')  \">\
		                                删除</a></td></tr>";
                          $("#filesTab").append(filesItem);
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
      
      function deleteFile(fileID, originalFileName) {
          swal({
              title:"提示",
              text:"您确定要删除该文件吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteFile.do",
                   data : { 
                	    fileID : fileID, 
                	    originalFileName : originalFileName
                   },	   
              }).done(function() {
                     window.location.href = "<%=basePath%>loadFilesList.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
	</script>
	
	<div id="dialogUpload" style="display: none;">
		<div id="UploadFile" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
				<form action="<%=basePath%>uploadPicture.do" method="post" onsubmit="return doSubmit()" enctype="multipart/form-data">  
                       <input type="file" name="file" onchange="checkPicFile(this)" style="margin-left: 20px; margin-top: 30px; width: 220px;  float:left;" /> 
                       <input id="submitFile" type="submit" value="上传" style="margin-left: 10px; margin-top: 30px; width: 60px; float:left;"/>
                </form>  
		</div>
	</div>
	<script>
		var isCommitted = false; // 表单是否已经提交标识，默认为 false
		// 防止表单重复提交
		function doSubmit() {
			if (isCommitted == false) {
				isCommitted = true ; // 提交表单后，将表单是否已经提交标识设置为 true
				return true;  // 返回 true 让表单正常提交
			} else {
				sweetAlert("提示", "请勿重复提交！", "warning");
				return false;  // 返回 false 那么表单将不提交
			}
		}

		$("#uploadPicFile").click(function() {
			uploadDialog();
			isCommitted = false; 
			event.preventDefault();
		});

		function uploadDialog() {
			$("#dialogUpload").dialog({
				autoOpen : true,
				title : "上传图片",
				width : 400,
				height : 380,
				buttons : [ {
					text : "关闭",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}

		function checkPicFile(obj) {
			var array = new Array('jpg', 'jpeg', 'png', 'bmp', 'gif'); // 可以上传的文件类型
			var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; // 这个文件类型正则很有用.
			var isExists = false;
			for ( var i in array) {
				if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
					isExists = true;
					sweetAlert("提示", "文件类型正确！", "success");
					return true;
				}
			}
			if (isExists == false) {
				obj.value = null;
				sweetAlert("提示", "上传文件类型需为 jpg, jpeg, png, bmp, gif！", "warning");
				return false;
			}
			return false;
		}
	</script>
</body>
</html>