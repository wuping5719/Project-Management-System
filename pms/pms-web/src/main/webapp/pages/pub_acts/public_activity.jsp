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
<title>公共活动</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/activity-layout.css" rel="stylesheet" type="text/css" />

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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 公共活动->活动列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">活动名：</label> 
					 <input id="actContent" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">负责人：</label>
					 <input id="actPerInCharge"  type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">进展情况：</label>
					 <input id="actProgress" type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="actsSearch" class="actsSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newAct" type="button" class="btn btn-default btn-sm" >新建公共活动</button>
				</div>

				<div id="actsListTable">
					<table id="actsTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 160px">公共活动及任务</td>
							<td style="width: 80px">负责人</td>
							<td style="width: 100px">进展情况</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="actsPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="actsFirst" class="actsSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="actsPrevious" class="actsSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="actsCenterBar" style="width: 60px;">
							      <input id="actsCurPageNum" style="width: 30px; background-color: #eee; " readonly="readonly" />
							      <label>/</label> 
							      <input id="actsTotalPage" style="width: 30px; background-color: #eee; " readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="actsNext" class="actsSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="actsEnd" class="actsSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="actsCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="actsJumpN" class="actsSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
    	 // 异步加载公共活动列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchPublicActivities.do",
             data : { 
            	  actContent : null,
            	  actPerInCharge : null,
            	  actProgress : null,
            	  pageNum : 1
             },
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("actsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.actsTotalNum+"条记录";
                 $("#actsCurPageNum").attr("value", 1);
                 $("#actsTotalPage").attr("value", msgRes.actsTotalPage);
                 $("#actsCurNo").attr("value", 1);

                 //清空table
                 var actsTB = document.getElementById("actsTab");
                 var rowNum = actsTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 actsTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var actsItem;
                 $.each(msgRes.actDTOsList,function(i,result){
                     if (i % 2 == 0){
                    	 actsItem = "<tr style=\"background-color:#e0ffff\">\
				               <td >" + result.sortIndex + "</td>\
				               <td >" + result.actContent + "</td>\
				               <td >" + result.actPerInCharge + "</td>\
				               <td >" + result.actProgress + "</td>\
				               <td ><a href=\"#\" onclick=\"updateAct(" + result.actID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteAct(" + result.actID + ")  \">\
        		                     <font>删除</font></a></td>\
				               <td style=\"display:none\">" + result.actID + "</td></tr>";
                         $("#actsTab").append(actsItem);
                     }
                     else{
                    	 actsItem = "<tr style=\"background-color:#f5f5f5\">\
                    		   <td >" + result.sortIndex + "</td>\
				               <td >" + result.actContent + "</td>\
				               <td >" + result.actPerInCharge + "</td>\
				               <td >" + result.actProgress + "</td>\
				               <td ><a href=\"#\" onclick=\"updateAct(" + result.actID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteAct(" + result.actID + ")  \">\
        		                     <font>删除</font></a></td>\
				               <td style=\"display:none\">" + result.actID + "</td></tr>";
                       $("#actsTab").append(actsItem);
                     }
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".actsSkip").click(function(){
          var actsCurPageNum = Number(document.getElementById("actsCurPageNum").value);  //当前页码
          var actsPageNum = 1;  // 将要跳转的页码
          var actsTotalPage = Number(document.getElementById("actsTotalPage").value);  //页码总数
          if (this.id == "actsFirst") {   // 首页
        	  actsPageNum = 1;
          } else if (this.id == "actsPrevious") {  //上一页
                 if (actsCurPageNum > 1 && actsCurPageNum <= actsTotalPage) {
                	 actsPageNum = Number(actsCurPageNum) - 1;
                 } else {
                	 actsPageNum = 1;
                 }
             } else if (this.id == "actsNext") { // 下一页
                 if (actsCurPageNum < actsTotalPage){
                	 actsPageNum = Number(actsCurPageNum) + 1;
                 }else {
                	 actsPageNum = actsTotalPage;
                 }
             } else if (this.id == "actsEnd") {  // 末页
            	 actsPageNum = actsTotalPage;
             } else if (this.id == "actsSearch") {  // 查询
            	 actsPageNum = 1;
             } else if (this.id == "actsJumpN") {
                 var actsCurNo = Number(document.getElementById("actsCurNo").value);
                 if(actsCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(actsCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (actsCurNo > actsTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 actsPageNum = Number(actsCurNo);
             }
             
             // 查询条件
             var actContent = document.getElementById("actContent").value;   
             var actPerInCharge = document.getElementById("actPerInCharge").value;  
             var actProgress = document.getElementById("actProgress").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchPublicActivities.do",
                 data : { 
                      actContent : actContent,
                      actPerInCharge : actPerInCharge,
                      actProgress : actProgress,
                      pageNum : actsPageNum
                 }, 
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("actsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.actsTotalNum+"条记录";
                     $("#actsCurPageNum").attr("value", actsPageNum);
                     $("#actsTotalPage").attr("value", msgRes.actsTotalPage);
                     $("#actsCurNo").attr("value", actsPageNum);

                     // 清空 table
                     var actsTB = document.getElementById("actsTab");
                     var rowNum = actsTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 actsTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var actsItem;
                     $.each(msgRes.actDTOsList,function(i,result){
                         if (i % 2 == 0){
                        	 actsItem = "<tr style=\"background-color:#e0ffff\">\
  				               <td >" + result.sortIndex + "</td>\
  				               <td >" + result.actContent + "</td>\
  				               <td >" + result.actPerInCharge + "</td>\
  				               <td >" + result.actProgress + "</td>\
  				               <td ><a href=\"#\" onclick=\"updateAct(" + result.actID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteAct(" + result.actID + ")  \">\
        		                     <font>删除</font></a></td>\
  				               <td style=\"display:none\">" + result.actID + "</td></tr>";
                           $("#actsTab").append(actsItem);
                         }
                         else{
                        	 actsItem = "<tr style=\"background-color:#f5f5f5\">\
                      		   <td >" + result.sortIndex + "</td>\
  				               <td >" + result.actContent + "</td>\
  				               <td >" + result.actPerInCharge + "</td>\
  				               <td >" + result.actProgress + "</td>\
  				               <td ><a href=\"#\" onclick=\"updateAct(" + result.actID + ")  \">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"deleteAct(" + result.actID + ")  \">\
        		                     <font>删除</font></a></td>\
  				               <td style=\"display:none\">" + result.actID + "</td></tr>";
                         $("#actsTab").append(actsItem);
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
      
      function deleteAct(actID) {
          swal({
              title:"提示",
              text:"您确定要删除该条公共活动吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deletePublicActivity.do",
                   data : { actID : actID }, 
              }).done(function() {
                     window.location.href = "<%=basePath%>loadPublicActivity.do";
              }).error(function() {
                   swal("OMG", "删除操作失败了!",  "error");
              });
          });
      }
	</script>

	<div id="dialog" style="display: none;">
		<div id="actInfo" style="margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 40px; margin-left: 10px; color: #ff0000;">活动内容及任务*：</label> 
				<input id="newActContent" type="text" style="margin-top: 40px; width: 280px" />
				<label style="margin-top: 40px; margin-left: 20px; color: #ff0000;">负责人*：</label> 
				<input id="newActPerInCharge" type="text" style="margin-top: 40px; width: 332px" />
				<label style="margin-top: 40px; margin-bottom: 20px; margin-left: 20px; color: #ff0000;">进展情况*：</label> 
				<select id="newActProgress" style="margin-top: 40px; width: 315px; height:30px; ">
                     <option id="newActProgress_Op1">进行中</option>
                     <option id="newActProgress_Op2">已结束</option>
                </select>
			</div>
		</div>
	</div>

	<script type="text/javascript">
      $("#newAct").click(function(){
    	  // 清空缓存
	      $("#newActContent").attr("value", "");
	      $("#newActPerInCharge").attr("value", "");
	      
	      var sap = document.getElementById("newActProgress")
	      sap.options[sap.selectedIndex].removeAttribute("selected");
	      $("#newActProgress_Op1").attr("selected", "selected");
	      
	      newActDialog();
    	  event.preventDefault();
	  });
    
      function newActDialog() {
    	  $("#dialog").dialog({
       	    autoOpen: true,
       	    title: "新建公共活动",
       	    width: 500,
       	    height: 380,
       	    buttons: [
       		 {
       			text: "创建",
       			click: function() {
       	            var newActContent = document.getElementById("newActContent").value;   // 活动内容及任务
       	            if(newActContent == "") {
       	                sweetAlert("活动内容及任务不能为空！");
       	                return;
       	            }
       	            var newActPerInCharge = document.getElementById("newActPerInCharge").value;   // 负责人
       	            if(newActPerInCharge == "") {
       	                sweetAlert("负责人不能为空！");
       	                return;
       	            }
       	            var newActProgress = document.getElementById("newActProgress").value;   // 进展情况
       	            if(newActProgress == "") {
       	                sweetAlert("进展情况不能为空！");
       	                return;
       	            }
       	            
       	            $.ajax({
       	                type: "POST",
       	                url: "<%=basePath%>createPublicActivity.do",
       	                data : { 
       	                	 newActContent : newActContent,
       	                	 newActPerInCharge : newActPerInCharge,
       	                	 newActProgress : newActProgress
       	                }, 
       	                success: function () {
       	                	   sweetAlert("创建公共活动成功！", "success");
       	                	   window.location.href = "<%=basePath%>loadPublicActivity.do";
                        },
   						error : function(e) {
   								sweetAlert("创建公共活动失败：", e, "error");
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
      
      function updateAct(actID) {
 		    updateActDialog(actID);
    	    event.preventDefault();
      }
 	 
 	 function updateActDialog(actID) {
    	      $(function(){
                 $.ajax({
            	       type: "POST",
                       url : "<%=basePath%>getPublicActivityByID.do",
                       data : { actID: actID },
                       success : function(msg) {
                    	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                    	       $("#newActContent").attr("value", msgRes.actContent);
                    	       $("#newActPerInCharge").attr("value", msgRes.actPerInCharge);
                    	    
                    	       var sap = document.getElementById("newActProgress")
                    	       sap.options[sap.selectedIndex].removeAttribute("selected");
                    	       if (msgRes.actProgress == '已结束') {
                    	    	   $("#newActProgress_Op2").attr("selected", "selected");
                    	       } else {
                    	    	   $("#newActProgress_Op1").attr("selected", "selected");
                    	       }
                       },
                       error : function(e) {    
                    	      sweetAlert("初始化公共活动失败：", e, "error");
                       }
                 });
          });
    	  
 	     $("#dialog").dialog({
 	    	   title: "修改公共活动",
 	    	   autoOpen: true,
 	    	   width: 500,
 	       	   height: 380,
 	      	   buttons: [
 	      		 {
 	      			text: "更新",
 	      			click: function() {
 	      				var newActContent = document.getElementById("newActContent").value;   // 活动内容及任务
 	       	            if(newActContent == "") {
 	       	                sweetAlert("活动内容及任务不能为空！");
 	       	                return;
 	       	            }
 	       	            var newActPerInCharge = document.getElementById("newActPerInCharge").value;   // 负责人
 	       	            if(newActPerInCharge == "") {
 	       	                sweetAlert("负责人不能为空！");
 	       	                return;
 	       	            }
 	       	            var newActProgress = document.getElementById("newActProgress").value;   // 进展情况
 	       	            if(newActProgress == "") {
 	       	                sweetAlert("进展情况不能为空！");
 	       	                return;
 	       	            }
 	      	         
 	      	            $.ajax({
 	      	                type: "POST",
 	      	                url: "<%=basePath%>updatePublicActivity.do",
 	      	                data : { actID : actID, 
 	      	                	  newActContent : newActContent, 
 	      	                	  newActPerInCharge : newActPerInCharge,
 	      	                	  newActProgress : newActProgress
 	      	                },
 	      	                success: function () {
 	      	                	   sweetAlert("更新公共活动成功！", "success");
 	      	                	   window.location.href = "<%=basePath%>loadPublicActivity.do";
 	                        },
 	  						error : function(e) {
 	  								sweetAlert("更新公共活动失败：", e, "error");
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