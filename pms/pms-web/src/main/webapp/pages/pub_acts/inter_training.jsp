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
<title>内部培训</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/training-layout.css" rel="stylesheet" type="text/css" />

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
					<div class="hg_sch" style="text-align:left;">
						<a id="userName" href="#"><%=session.getAttribute("_name")%></a> 
						<a id="a_logout" href="<%=basePath%>logout.do" >注销</a>
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="menu"><ul id="treeMenu" class="ztree" ></ul></div>
			<div id="local">
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 公共活动->内部培训</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">主讲人：</label> 
					 <input id="traSpeaker" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">培训时间：</label>
					 <input id="traTime" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})"
			                              style="margin-top:0.5%; height:24px; width:180px;"></input>
					 <label style="margin-top: 0.5%;">培训内容：</label>
					 <input id="traContent" type="text" style="width: 150px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="trasSearch" class="trasSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newTranining" type="button" class="btn btn-default btn-sm" >新建内部培训</button>
				</div>

				<div id="trasListTable">
					<table id="trasTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 100px">节次</td>
							<td style="width: 100px">培训时间</td>
							<td style="width: 120px">培训内容</td>
							<td style="width: 90px">主讲人</td>
							<td style="width: 100px">参与人</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="trasPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="trasFirst" class="trasSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="trasPrevious" class="trasSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="trasCenterBar" style="width: 60px;">
							      <input id="trasCurPageNum" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>/</label> 
							      <input id="trasTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="trasNext" class="trasSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="trasEnd" class="trasSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="trasCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="trasJumpN" class="trasSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
    	 // 异步加载内部培训列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchInterTrainings.do",
             data : { traSpeaker : null, traTime : null, traContent : null, pageNum : 1 },
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("trasPage").rows[0].cells[1].innerHTML = "总计"+msgRes.trasTotalNum+"条记录";
                 $("#trasCurPageNum").attr("value", 1);
                 $("#trasTotalPage").attr("value", msgRes.trasTotalPage);
                 $("#trasCurNo").attr("value", 1);

                 //清空table
                 var trasTB = document.getElementById("trasTab");
                 var rowNum = trasTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 trasTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var trasItem;
                 $.each(msgRes.traDTOsList,function(i,result){
                     if (i % 2 == 0){
                    	 trasItem = "<tr style=\"background-color:#e0ffff\">\
				               <td >" + result.sortIndex + "</td>\
				               <td >" + result.traSegment + "</td>\
				               <td >" + result.traTime + "</td>\
				               <td >" + result.traContent + "</td>\
				               <td >" + result.traSpeaker + "</td>\
				               <td >" + result.traParticipant + "</td>\
				               <td ><a href=\"#\" onclick=\"updateInterTrain(" + result.traID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteInterTrain(" + result.traID + ")  \">\
        		                     <font>删除</font></a></td>\
				               <td style=\"display:none\">" + result.traID + "</td></tr>";
                         $("#trasTab").append(trasItem);
                     }
                     else{
                    	 trasItem = "<tr style=\"background-color:#f5f5f5\">\
                    		   <td >" + result.sortIndex + "</td>\
				               <td >" + result.traSegment + "</td>\
				               <td >" + result.traTime + "</td>\
				               <td >" + result.traContent + "</td>\
				               <td >" + result.traSpeaker + "</td>\
				               <td >" + result.traParticipant + "</td>\
				               <td ><a href=\"#\" onclick=\"updateInterTrain(" + result.traID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteInterTrain(" + result.traID + ")  \">\
        		                     <font>删除</font></a></td>\
				               <td style=\"display:none\">" + result.traID + "</td></tr>";
                       $("#trasTab").append(trasItem);
                     }
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".trasSkip").click(function(){
          var trasCurPageNum = Number(document.getElementById("trasCurPageNum").value);  //当前页码
          var trasPageNum = 1;  // 将要跳转的页码
          var trasTotalPage = Number(document.getElementById("trasTotalPage").value);  //页码总数
          if (this.id == "trasFirst") {   // 首页
        	  trasPageNum = 1;
          } else if (this.id == "trasPrevious") {  //上一页
                 if (trasCurPageNum > 1 && trasCurPageNum <= trasTotalPage) {
                	 trasPageNum = Number(trasCurPageNum) - 1;
                 } else {
                	 trasPageNum = 1;
                 }
             } else if (this.id == "trasNext") { // 下一页
                 if (trasCurPageNum < trasTotalPage){
                	 trasPageNum = Number(trasCurPageNum) + 1;
                 }else {
                	 trasPageNum = trasTotalPage;
                 }
             } else if (this.id == "trasEnd") {  // 末页
            	 trasPageNum = trasTotalPage;
             } else if (this.id == "trasSearch") {  // 查询
            	 trasPageNum = 1;
             } else if (this.id == "trasJumpN") {
                 var trasCurNo = Number(document.getElementById("trasCurNo").value);
                 if(trasCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(trasCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (trasCurNo > trasTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 trasPageNum = Number(trasCurNo);
             }
             
             // 查询条件
             var actContent = document.getElementById("actContent").value;   
             var actPerInCharge = document.getElementById("actPerInCharge").value;  
             var actProgress = document.getElementById("actProgress").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchInterTrainings.do",
                 data : { 
                	  traSpeaker : traSpeaker, 
                	  traTime : traTime, 
                	  traContent : traContent, 
                	  pageNum : trasPageNum 
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("trasPage").rows[0].cells[1].innerHTML = "总计"+msgRes.trasTotalNum+"条记录";
                     $("#trasCurPageNum").attr("value", trasPageNum);
                     $("#trasTotalPage").attr("value", msgRes.trasTotalPage);
                     $("#trasCurNo").attr("value", trasPageNum);

                     // 清空 table
                     var trasTB = document.getElementById("trasTab");
                     var rowNum = trasTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 trasTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var trasItem;
                     $.each(msgRes.traDTOsList,function(i, result){
                         if (i % 2 == 0){
                        	 trasItem = "<tr style=\"background-color:#e0ffff\">\
                        		 <td >" + result.sortIndex + "</td>\
  				                 <td >" + result.traSegment + "</td>\
  				                 <td >" + result.traTime + "</td>\
  				                 <td >" + result.traContent + "</td>\
  				                 <td >" + result.traSpeaker + "</td>\
  				                 <td >" + result.traParticipant + "</td>\
  				                 <td ><a href=\"#\" onclick=\"updateInterTrain(" + result.traID + ")  \">修改</a></td>\
				                 <td ><a href=\"#\" onclick=\"deleteInterTrain(" + result.traID + ")  \">\
        		                        <font>删除</font></a></td>\
  				                 <td style=\"display:none\">" + result.traID + "</td></tr>";
                           $("#trasTab").append(trasItem);
                         }
                         else{
                        	 trasItem = "<tr style=\"background-color:#f5f5f5\">\
                        		 <td >" + result.sortIndex + "</td>\
  				                 <td >" + result.traSegment + "</td>\
  				                 <td >" + result.traTime + "</td>\
  				                 <td >" + result.traContent + "</td>\
  				                 <td >" + result.traSpeaker + "</td>\
  				                 <td >" + result.traParticipant + "</td>\
  				                 <td ><a href=\"#\" onclick=\"updateInterTrain(" + result.traID + ")  \">修改</a></td>\
				                 <td ><a href=\"#\" onclick=\"deleteInterTrain(" + result.traID + ")  \">\
        		                       <font>删除</font></a></td>\
  				                 <td style=\"display:none\">" + result.traID + "</td></tr>";
                         $("#trasTab").append(trasItem);
                         }
                     });
                 },
                 error:function(e){
                     sweetAlert("网页发生错误：", e, "error");
                 }
          });
     });
     
     var setting = {
    		data: {
    			simpleData: {
    				 enable: true,
    				 idKey: "id",
    				 pIdKey: "pId",
    				 rootPId: 0
    			}
    	    }
    };

     var treeNodes = [
               {"id":1, "pId":0, "name":"公共活动", "url":"<%=basePath%>loadPublicActivity.do","target":"_self"},       
               {"id":2, "pId":0, "name":"内部培训", "url":"<%=basePath%>loadInterTraining.do","target":"_self"}
     ];

      var tree = $("#treeMenu");  
      $(function() {   
           tree = $.fn.zTree.init(tree, setting, treeNodes); 
           tree.expandAll(true); 
      });  
      
      function deleteInterTrain(traID) {
          swal({
              title:"提示",
              text:"您确定要删除该条内部培训吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteInterTraining.do",
                   data : { traID : traID } 
              }).done(function() {
                     window.location.href = "<%=basePath%>loadInterTraining.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
	</script>

	<div id="dialog" style="display: none;">
		<div id="traInfo" style="margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">节次*：</label> 
				<input id="newTraSegment" type="text" style="margin-top: 30px; width: 329px" />
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">培训时间*：</label>
				<input id="newTraTime" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', readOnly:true})"
			                              style="margin-top: 30px; width: 298px; height:30px; "></input> 
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">培训内容*：</label> 
				<input id="newTraContent" type="text" style="margin-top: 30px; width: 298px; " />
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">主讲人*：</label> 
				<input id="newTraSpeaker" type="text" style="margin-top: 30px; width: 315px; " />
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">参与人*：</label> 
				<input id="newTraParticipant" type="text" style="margin-top: 30px; width: 315px; " />
			</div>
		</div>
	</div>

	<script type="text/javascript">
	  $("#newTranining").click(function(){
  	       // 清空缓存
	      $("#newTraSegment").attr("value", "");
	      $("#newTraTime").attr("value", "");
	      $("#newTraContent").attr("value", "");
	      $("#newTraSpeaker").attr("value", "");
	      $("#newTraParticipant").attr("value", "");
	      
	      newTraniningDialog();
  	      event.preventDefault();
	 });

	  function newTraniningDialog() {
		  $("#dialog").dialog({
			   title: "新建内部培训",
	    	   autoOpen: true,
	    	   width: 500,
	    	   height: 460,
	    	   buttons: [
	    		 {
	    			text: "创建",
	    			click: function() {
	    	            var newTraSegment = document.getElementById("newTraSegment").value;   // 节次
	    	            if(newTraSegment == "") {
	    	                sweetAlert("节次不能为空！");
	    	                return;
	    	            }
	    	            var newTraTime = document.getElementById("newTraTime").value;   // 培训时间
	    	            if(newTraTime == "") {
	    	                sweetAlert("培训时间不能为空！");
	    	                return;
	    	            }
	    	            var newTraContent = document.getElementById("newTraContent").value;   // 培训内容
	    	            if(newTraContent == "") {
	    	                sweetAlert("培训内容不能为空！");
	    	                return;
	    	            }
	    	            var newTraSpeaker = document.getElementById("newTraSpeaker").value;   // 主讲人
	    	            if(newTraSpeaker == "") {
	    	                sweetAlert("主讲人不能为空！");
	    	                return;
	    	            }
	    	            var newTraParticipant = document.getElementById("newTraParticipant").value;   // 参与人
	    	            if(newTraParticipant == "") {
	    	                sweetAlert("参与人不能为空！");
	    	                return;
	    	            }
	    	            
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>createInterTraining.do",
	    	                data : { 
	    	                	 newTraSegment : newTraSegment,
	    	                	 newTraTime : newTraTime,
	    	                	 newTraContent : newTraContent,
	    	                	 newTraSpeaker : newTraSpeaker,
	    	                	 newTraParticipant : newTraParticipant
	    	                },
	    	                success: function () {
	    	                	   sweetAlert("创建内部培训成功！", "success");
	    	                	   window.location.href = "<%=basePath%>loadInterTraining.do";
	                        },
							error : function(e) {
									sweetAlert("创建内部培训失败：", e, "error");
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
      
	  function updateInterTrain(traID) {
		   updateTraniningDialog(traID);
  	       event.preventDefault();
      }
	 
	  function updateTraniningDialog(traID) {
  	      $(function(){
               $.ajax({
          	       type: "POST",
                     url : "<%=basePath%>getInterTrainingByID.do",
                     data : { traID: traID },
                     success : function(msg) {
                  	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                  	       $("#newTraSegment").attr("value", msgRes.traSegment);
               	           $("#newTraTime").attr("value", msgRes.traTime);
               	           $("#newTraContent").attr("value", msgRes.traContent);
               	           $("#newTraSpeaker").attr("value", msgRes.traSpeaker);
               	           $("#newTraParticipant").attr("value", msgRes.traParticipant);
                     },
                     error : function(e) {    
                  	      sweetAlert("初始化内部培训失败：", e, "error");
                     }
               });
         });
  	  
	     $("#dialog").dialog({
	    	   title: "修改内部培训",
	    	   autoOpen: true,
	    	   width: 500,
	       	   height: 460,
	      	   buttons: [
	      		 {
	      			text: "更新",
	      			click: function() {
	      				var newTraSegment = document.getElementById("newTraSegment").value;   // 节次
	    	            if(newTraSegment == "") {
	    	                sweetAlert("节次不能为空！");
	    	                return;
	    	            }
	    	            var newTraTime = document.getElementById("newTraTime").value;   // 培训时间
	    	            if(newTraTime == "") {
	    	                sweetAlert("培训时间不能为空！");
	    	                return;
	    	            }
	    	            var newTraContent = document.getElementById("newTraContent").value;   // 培训内容
	    	            if(newTraContent == "") {
	    	                sweetAlert("培训内容不能为空！");
	    	                return;
	    	            }
	    	            var newTraSpeaker = document.getElementById("newTraSpeaker").value;   // 主讲人
	    	            if(newTraSpeaker == "") {
	    	                sweetAlert("主讲人不能为空！");
	    	                return;
	    	            }
	    	            var newTraParticipant = document.getElementById("newTraParticipant").value;   // 参与人
	    	            if(newTraParticipant == "") {
	    	                sweetAlert("参与人不能为空！");
	    	                return;
	    	            }
	      	         
	      	            $.ajax({
	      	                type: "POST",
	      	                url: "<%=basePath%>updateInterTraining.do",
	      	                data : { traID : traID, 
	      	                	  newTraSegment : newTraSegment, newTraTime : newTraTime,
	      	                	  newTraContent : newTraContent, newTraSpeaker : newTraSpeaker,
	      	                	  newTraParticipant : newTraParticipant
	      	                },
	      	                success: function () {
	      	                	   sweetAlert("更新内部培训成功！", "success");
	      	                	   window.location.href = "<%=basePath%>loadInterTraining.do";
	                        },
	  						error : function(e) {
	  								sweetAlert("更新内部培训失败：", e, "error");
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