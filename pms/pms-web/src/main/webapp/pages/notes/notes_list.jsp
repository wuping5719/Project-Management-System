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
<title>知识管理</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/notes-layout.css" rel="stylesheet" type="text/css" />

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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 知识管理->笔记列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">主题：</label> 
					 <input id="noteTitle" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">关键字：</label>
					 <input id="noteKeyWord" type="text" style="width: 150px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="notesSearch" class="notesSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="addNote" type="button" class="btn btn-default btn-sm" >添加新笔记</button>
				</div>

				<div id="notesListTable">
					<table id="notesTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 120px">主题</td>
							<td style="width: 200px">内容</td>
							<td style="width: 100px">附件</td>
							<td style="width: 100px">关键字</td>
							<td style="width: 80px">发布人</td>
							<td style="width: 100px">发布日期</td>
							<td style="width: 100px">最后修改日期</td>
							<td style="width: 40px">详情</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
						</tr>
					</table>

					<table id="notesPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="notesFirst" class="notesSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="notesPrevious" class="notesSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="notesCenterBar" style="width: 60px;">
							      <input id="notesCurPageNum" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>/</label> 
							      <input id="notesTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="notesNext" class="notesSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="notesEnd" class="notesSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="notesCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="notesJumpN" class="notesSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
             url : "<%=basePath%>searchNotes.do",
             data : { noteTitle : null, noteKeyWord : null, pageNum : 1 },		 
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("notesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.notesTotalNum+"条记录";
                 $("#notesCurPageNum").attr("value", 1);
                 $("#notesTotalPage").attr("value", msgRes.notesTotalPage);
                 $("#notesCurNo").attr("value", 1);

                 //清空table
                 var notesTB = document.getElementById("notesTab");
                 var rowNum = notesTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 notesTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var notesItem;
                 $.each(msgRes.noteDTOsList,function(i,result){
                	   notesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
		                   <td >" + result.sortIndex + "</td>\
		                   <td >" + result.noteTitle + "</td>\
		                   <td >" + result.noteContent + "</td>\
		                   <td >" + result.noteAttachment + "</td>\
		                   <td >" + result.noteKeyWord + "</td>\
		                   <td >" + result.notePublisher + "</td>\
		                   <td >" + result.notePublishDate + "</td>\
		                   <td >" + result.noteModifyDate + "</td>\
		                   <td ><a href=\"#\" onclick=\"viewNote("+ result.noteID +")  \">详情</a></td>\
		                   <td ><a href=\"#\" onclick=\"updateNote("+ result.noteID +")  \">修改</a></td>\
	                       <td ><a href=\"#\" onclick=\"deleteNote("+ result.noteID +",'"+ result.noteAttachment +"')  \">删除</a></td></tr>";
                       $("#notesTab").append(notesItem);
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".notesSkip").click(function(){
          var notesCurPageNum = Number(document.getElementById("notesCurPageNum").value);  //当前页码
          var notesPageNum = 1;  // 将要跳转的页码
          var notesTotalPage = Number(document.getElementById("notesTotalPage").value);  //页码总数
          if (this.id == "notesFirst") {   // 首页
        	  notesPageNum = 1;
          } else if (this.id == "notesPrevious") {  //上一页
                 if (notesCurPageNum > 1 && notesCurPageNum <= notesTotalPage) {
                	 notesPageNum = Number(notesCurPageNum) - 1;
                 } else {
                	 notesPageNum = 1;
                 }
             } else if (this.id == "notesNext") { // 下一页
                 if (notesCurPageNum < notesTotalPage){
                	 notesPageNum = Number(notesCurPageNum) + 1;
                 }else {
                	 notesPageNum = notesTotalPage;
                 }
             } else if (this.id == "notesEnd") {  // 末页
            	 notesPageNum = notesTotalPage;
             } else if (this.id == "notesSearch") {  // 查询
            	 notesPageNum = 1;
             } else if (this.id == "notesJumpN") {
                 var notesCurNo = Number(document.getElementById("notesCurNo").value);
                 if(notesCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(notesCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (notesCurNo > notesTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 notesPageNum = Number(notesCurNo);
             }
             
             // 查询条件
             var noteTitle = document.getElementById("noteTitle").value;   
             var noteKeyWord = document.getElementById("noteKeyWord").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchNotes.do",
                 data : { 
                	  noteTitle : noteTitle, 
                	  noteKeyWord : noteKeyWord, 
                	  pageNum : notesPageNum 
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);   //返回json对象
                     // 更新记录总数
                     document.getElementById("notesPage").rows[0].cells[1].innerHTML = "总计"+msgRes.notesTotalNum+"条记录";
                     $("#notesCurPageNum").attr("value", notesPageNum);
                     $("#notesTotalPage").attr("value", msgRes.notesTotalPage);
                     $("#notesCurNo").attr("value", notesPageNum);

                     // 清空 table
                     var notesTB = document.getElementById("notesTab");
                     var rowNum = notesTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 notesTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var notesItem;
                     $.each(msgRes.noteDTOsList,function(i,result){
                    	 notesItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
                    	      <td >" + result.sortIndex + "</td>\
		                      <td >" + result.noteTitle + "</td>\
		                      <td >" + result.noteContent + "</td>\
		                      <td >" + result.noteAttachment + "</td>\
		                      <td >" + result.noteKeyWord + "</td>\
		                      <td >" + result.notePublisher + "</td>\
		                      <td >" + result.notePublishDate + "</td>\
		                      <td >" + result.noteModifyDate + "</td>\
		                      <td ><a href=\"#\" onclick=\"viewNote("+ result.noteID +")  \">详情</a></td>\
		                      <td ><a href=\"#\" onclick=\"updateNote("+ result.noteID +")  \">修改</a></td>\
	                          <td ><a href=\"#\" onclick=\"deleteNote("+ result.noteID +",'"+ result.noteAttachment +"')  \">删除</a></td></tr>";
                          $("#notesTab").append(notesItem);
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
              {"id":1, "pId":0, "name":"笔记列表", "url":"<%=basePath%>loadNotesList.do","target":"_self"},
     ];

      var tree1 = $("#treeMenu");  
      $(function() {   
           tree1 = $.fn.zTree.init(tree1, setting1, treeNodes1); 
           tree1.expandAll(true); 
      });  
      
      function deleteNote(noteID, noteAttachment) {
          swal({
              title:"提示",
              text:"您确定要删除该笔记吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteNote.do",
                   data : { 
                	    noteID : noteID, 
                	    noteAttachment : noteAttachment
                   },	   
              }).done(function() {
                     window.location.href = "<%=basePath%>loadNotesList.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
	</script>
	
	<div id="dialogNote" style="display: none;">
		<div id="note" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
		     <table>
			      <tr>
			          <td>					
					        <label style="margin-top: 30px; margin-left: 20px; ">主题</label> 
				            <span style="margin-top: 30px; color: #ff0000;">*</span> 
			                <span style="margin-top: 30px; ">:</span>
				     </td>
				     <td>
					       <input id="newNoteTitle" type="text" style="margin-top: 30px; width: 320px" />					
				     </td>
				 </tr>
				 <tr>
			          <td>					
					        <label style="margin-top: 30px; margin-left: 20px; ">内容</label> 
				            <span style="margin-top: 30px; color: #ff0000;">*</span> 
			                <span style="margin-top: 30px; ">:</span>
				     </td>
				     <td>
					       <textarea id="newNoteContent" style="margin-top:30px; height: 180px; width:320px;"></textarea>			
				     </td>
				 </tr>
				 <tr>
			          <td>					
					        <label style="margin-top: 30px; margin-left: 20px; ">关键字</label>
			                <span style="margin-top: 30px; color: #ff0000;">*</span> 
			                <span style="margin-top: 30px; ">:</span>
				     </td>
				     <td>
					       <input id="newNoteKeyWord" type="text" style="margin-top: 30px; width: 270px" />	
					       <input id="selectKeyWord" type="button" value="选择" style="margin-top: 30px; width: 50px" />			
				     </td>
				 </tr>
				 <tr>
			          <td>					
					        <label style="margin-top: 30px; margin-left: 20px; ">附件：</label> 
				     </td>
				     <td>
					       <form id="fileForm" action="<%=basePath%>addNoteAttachment.do" method="post" 
					                onsubmit="return doSubmit()" enctype="multipart/form-data" target="message">  
                                <input id="attachmentFile" type="file" name="file" onchange="checkFile(this)" style="margin-top: 30px; width: 260px; float:left;" /> 
                                <input id="submitNoteAttachment" type="submit" value="上传" style="margin-top: 30px; width: 60px; float:left;"/>
                          </form>  	
                          <a id="fileA" target="_self"></a>
                          <iframe name="message" style="display: none"></iframe>
				     </td>
				 </tr>
		    </table>
		</div>
	</div>
	
	<div id="dialogKeyWord" style="display: none;">
		<div id="keyWords" style="overflow-y:scroll; margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;"></div>
	</div>
	
	<script>
		var isCommitted = false; // 表单是否已经提交标识，默认为 false
		// 防止表单重复提交
		function doSubmit() {
			if (isCommitted == false) {
				isCommitted = true ; // 提交表单后，将表单是否已经提交标识设置为 true
				sweetAlert("提示", "文件上传成功！", "success");
				return true;  // 返回 true 让表单正常提交
			} else {
				sweetAlert("提示", "请勿重复提交！", "warning");
				return false;  // 返回 false 那么表单将不提交
			}
		}

		$("#addNote").click(function() {
			  $("#newNoteTitle").attr("value", "");
     	      $("#newNoteTitle").attr("readonly", false);
     	      document.getElementById("newNoteContent").value = "";       	      
     	      $("#newNoteContent").attr("readonly", false);
     	      $("#newNoteKeyWord").attr("value", "");
     	      $("#newNoteKeyWord").attr("readonly", false);
     	      $("#selectKeyWord").attr("disabled", false);
     	      document.getElementById("fileForm").style.display="block"; 
     	      document.getElementById("fileA").style.display="none"; 
     	      
			  addNoteDialog();
			  isCommitted = false; 
			  event.preventDefault();
		});

		function addNoteDialog() {
			$("#dialogNote").dialog({
				autoOpen : true,
				title : "添加新笔记",
				width : 500,
				height : 560,
				buttons : [ {
	       			text: "添加",
	       			click: function() {
	       	            var newNoteTitle = document.getElementById("newNoteTitle").value;   // 主题
	       	            if(newNoteTitle == "") {
	       	                sweetAlert("主题不能为空！");
	       	                return;
	       	            }
	       	            var newNoteContent = document.getElementById("newNoteContent").value.replace(/\n/g, '__');   // 内容
	       	            if(newNoteContent == "") {
	       	                sweetAlert("内容不能为空！");
	       	                return;
	       	            }
	       	            var newNoteKeyWord = document.getElementById("newNoteKeyWord").value;   // 关键字
	       	            if(newNoteKeyWord == "") {
	       	                sweetAlert("关键字不能为空！");
	       	                return;
	       	            }
	       	            
	       	            $.ajax({
	       	                type: "POST",
	       	                url: "<%=basePath%>addNote.do",
	       	                data : { 
	       	                	 newNoteTitle : newNoteTitle,
	       	                	 newNoteContent : newNoteContent,
	       	                	 newNoteKeyWord : newNoteKeyWord
	       	                }, 
	       	                success: function () {
	       	                	   sweetAlert("添加新笔记成功！", "success");
	       	                	   window.location.href = "<%=basePath%>loadNotesList.do";
	                        },
	   						error : function(e) {
	   								sweetAlert("添加新笔记失败：", e, "error");
	   						}
	   				    });
	   				    $(this).dialog("close");
	   				   }
	   			 },{
					text : "关闭",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}

		function checkFile(obj) {
			var array = new Array('pdf', 'txt', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'jpg', 'jpeg', 'png', 'bmp', 'gif'); // 可以上传的文件类型
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
				sweetAlert("提示", "上传文件类型需为 pdf, txt, doc, docx, xls, xlsx, ppt, pptx, jpg, jpeg, png, bmp, gif！", "warning");
				return false;
			}
			return false;
		}
		
		// 选择关键字
	    $("#selectKeyWord").click(function(){
	    	  keyWordDialog();
	    	  event.preventDefault();
	    	  $("#keyWords").empty(); 	
	    	  $.ajax({
	               type: "POST",
	               url: "<%=basePath%>searchKeyWords.do",	
	               success: function (msg) {
	            	   var msgRes = JSON.parse(msg);  
	             	   var keyWordsHtml = "";
	             	   $.each(msgRes.keyWordsSet,function(i,result){            		  
	             		  keyWordsHtml += "<input type=\"checkbox\" name=\"keyWordChoice\" value="+result+" \/><span>"+result+"</span><br>";
	             	   });
	            	   document.getElementById("keyWords").innerHTML=keyWordsHtml;
	               },
				   error : function(e) {
					    sweetAlert("加载关键字信息失败：", e, "error");
				   }
			 });    	
		  });
		
	    function keyWordDialog() {
			$("#dialogKeyWord").dialog({
				autoOpen : true,
				title : "选择关键字",
				width : 280,
				height : 380,
				buttons : [ {
					text : "确定",
					click : function() {
						  var obj = document.getElementsByName("keyWordChoice");
				    	  var keyWordStr = "";
				    	  for(k in obj){
				    			if(obj[k].checked==true){     				
				    				if (""==keyWordStr) {
				    					keyWordStr += obj[k].value;
				    				} else {
				    					keyWordStr += "," + obj[k].value ;
				    				}					
				    			} 			 
				    	  }
				    	  document.getElementById("newNoteKeyWord").value = keyWordStr;
				    	  $(this).dialog("close");
					}
				} , {
	  				text : "取消",
	  				click : function() {
	  						$(this).dialog("close");
	  				}
	  			} ]
			});
		}
	    
	     function viewNote(noteID) {
	    	 viewNoteDialog(noteID);
	   	     event.preventDefault();
	     }
		 
		 function viewNoteDialog(noteID) {
	   	      $(function(){
	                $.ajax({
	           	          type: "POST",
	                      url : "<%=basePath%>getNoteByID.do",
	                      data : { noteID: noteID },
	                      success : function(msg) {
	                   	      var msgRes = JSON.parse(msg);  // 返回 JSON 对象
	                   	      $("#newNoteTitle").attr("value", msgRes.noteTitle);
	                   	      $("#newNoteTitle").attr("readonly", true);
	                   	      document.getElementById("newNoteContent").value = msgRes.noteContent.replace(new RegExp("<br>","g"),'\n');       	      
	                   	      $("#newNoteContent").attr("readonly", true);
	                   	      $("#newNoteKeyWord").attr("value", msgRes.noteKeyWord);
	                   	      $("#newNoteKeyWord").attr("readonly", true);
	                   	      $("#selectKeyWord").attr("disabled", true);
	                   	      document.getElementById("fileA").style.display="inline"; 
	                   	      $("#fileA").text(msgRes.noteAttachment);
	                   	      $("#fileA").attr("href", '<%=basePath%>downloadAttachment.do?fileName=' + msgRes.noteAttachment);
	                   	      document.getElementById("fileForm").style.display="none"; 
	                      },
	                      error : function(e) {    
	                   	      sweetAlert("初始化笔记信息失败：", e, "error");
	                      }
	                });
	         });
	   	  
		     $("#dialogNote").dialog({
		    	   title: "查看笔记",
		    	   autoOpen: true,
		    	   width : 500,
				   height : 560,
		      	   buttons: [ {
		  				text : "关闭",
		  				click : function() {
		  						$(this).dialog("close");
		  				}
		  			} ]
		  	    });
		 }
		 
		 function updateNote(noteID) {
			 updateNoteDialog(noteID);
	   	     event.preventDefault();
	     }
		 
		 function updateNoteDialog(noteID) {
	   	      $(function(){
	                $.ajax({
	           	          type: "POST",
	                      url : "<%=basePath%>getNoteByID.do",
	                      data : { noteID: noteID },
	                      success : function(msg) {
	                   	      var msgRes = JSON.parse(msg);  // 返回 JSON 对象
	                   	      $("#newNoteTitle").attr("value", msgRes.noteTitle);
	                   	      $("#newNoteTitle").attr("readonly", false);
	                   	      document.getElementById("newNoteContent").value = msgRes.noteContent.replace(new RegExp("<br>","g"),'\n');       	       
	                   	      $("#newNoteContent").attr("readonly", false);
	                   	      $("#newNoteKeyWord").attr("value", msgRes.noteKeyWord);
	                   	      $("#newNoteKeyWord").attr("readonly", false);
	                   	      $("#selectKeyWord").attr("disabled", false);
	                   	      document.getElementById("fileA").style.display="inline"; 
	                   	      $("#fileA").text(msgRes.noteAttachment);
	                   	      $("#fileA").attr("href", '<%=basePath%>downloadAttachment.do?fileName=' + msgRes.noteAttachment);
	                   	      document.getElementById("fileForm").style.display="none"; 
	                      },
	                      error : function(e) {    
	                   	      sweetAlert("初始化笔记信息失败：", e, "error");
	                      }
	                });
	         });
	   	  
		     $("#dialogNote").dialog({
		    	   title: "修改笔记",
		    	   autoOpen: true,
		    	   width : 500,
				   height : 560,
		      	   buttons: [ {
	 	      			text: "更新",
	 	      			click: function() {
	 	      				var newNoteTitle = document.getElementById("newNoteTitle").value;   // 主题
		       	            if(newNoteTitle == "") {
		       	                sweetAlert("主题不能为空！");
		       	                return;
		       	            }
		       	            var newNoteContent = document.getElementById("newNoteContent").value.replace(/\n/g, '__');   // 内容
		       	            if(newNoteContent == "") {
		       	                sweetAlert("内容不能为空！");
		       	                return;
		       	            }
		       	            var newNoteKeyWord = document.getElementById("newNoteKeyWord").value;   // 关键字
		       	            if(newNoteKeyWord == "") {
		       	                sweetAlert("关键字不能为空！");
		       	                return;
		       	            }
	 	      	         
	 	      	            $.ajax({
	 	      	                type: "POST",
	 	      	                url: "<%=basePath%>updateNote.do",
	 	      	                data : { 
	 	      	                	  noteID : noteID, 
	 	      	                	  newNoteTitle : newNoteTitle, 
	 	      	                	  newNoteContent : newNoteContent,
	 	      	                	  newNoteKeyWord : newNoteKeyWord
	 	      	                },
	 	      	                success: function () {
	 	      	                	   sweetAlert("更新笔记信息成功！", "success");
	 	      	                	   window.location.href = "<%=basePath%>loadNotesList.do";
	 	                        },
	 	  						error : function(e) {
	 	  								sweetAlert("更新笔记信息失败：", e, "error");
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