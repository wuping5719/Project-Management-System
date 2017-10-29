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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>事项追踪</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/event-track.css" rel="stylesheet" type="text/css" />

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
					<div class="hg_sch">
						 <a id="userName" href="#" ><%=session.getAttribute("_name")%></a>
					     <a id="a_logout" href="<%=basePath%>logout.do">注销</a>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div id="menu"><ul id="treeMenu" class="ztree" ></ul></div>
			<div id="local">
		    <label style="margin-left:2%; margin-top: 1%;">当前位置: 事项追踪 >未解决</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">需求名称：</label> 
					 <input id="eveTraReqName" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" /> 					  
					 <label style="margin-top: 0.5%; margin-left:1%;">状态：</label>					 
					 <input id="eveTraState" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" />					 
					 <label style="margin-top: 0.5%; margin-left:1%;">负责人：</label>
					 <input id="eveTraPerInCharge" type="text" style="width: 10%; height: 24px; margin-top: 0.5%; margin-right:1%" /> 
					 <img id="eveTraSearch" class="eveTraSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newEveTra" type="button" class="btn btn-default btn-sm" style="background-color:#a6d2ff;margin-left:1%">新建事项</button>
				</div>
                <table id="eveTraTabHead">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 3.5%">序号</td>
							<td style="width: 15%">需求名称</td>
							<td style="width: 22%">主要内容</td>
							<td style="width: 3%">状态</td>
							<td style="width: 12%">进展</td>
							<td style="width: 5%">负责人</td>
							<td style="width: 3.5%">详情</td>
							<td style="width: 3.5%">修改</td>
							<td style="width: 3.5%">删除</td>
							<td style="display: none">主键ID</td>													
						</tr>
			    </table>
				<div id="eveTraListTable" >				    				
					<table id="eveTraTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 0px;">
							<td style="width: 3.5% ;"></td>
							<td style="width: 15% ;"></td>
							<td style="width: 22% ;"></td>
							<td style="width: 3% ;"></td>
							<td style="width: 12% ;"></td>
							<td style="width: 5% ;"></td>
							<td style="width: 3.5%;"></td>
							<td style="width: 3.5% ;"></td>
							<td style="width: 3.5% ;"></td>
							<td style="display: none"></td>													
						</tr>
					</table>
                 </div>
                 <div >
					<table id="eveTraPage">
						<tr style="height: 5px;">	
						    <td style="width: 20px;"></td>						
							<td style="width: 50px;"></td>
							<td id="eveTraFirst" class="eveTraSkip" style="width: 30px;">首页
							      <img src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 30px;">上一页
							      <img id="eveTraPrevious" class="eveTraSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="eveTraCenterBar" style="width: 60px;">
							      <input id="eveTraCurPageNum" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>/</label> 
							      <input id="eveTraTotalPage" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 30px;">下一页
							      <img id="eveTraNext" class="eveTraSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 20px;">尾页
							      <img id="eveTraEnd" class="eveTraSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="eveTraCurNo" style="width: 40px;text-align:center;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 30px;">
							     <img id="eveTraJumpN" class="eveTraSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
             url : "<%=basePath%>searchEventTracks.do?eveTraReqName=&eveTraState=&eveTraPerInCharge=&pageNum=1",
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("eveTraPage").rows[0].cells[1].innerHTML = "总计"+msgRes.eveTraTotalNum+"条记录";
                 $("#eveTraCurPageNum").attr("value", 1);       //设置备选属性的值，即设置eveTraCurPageNum的值为1，也就是当前默认显示第一页
                 $("#eveTraTotalPage").attr("value", msgRes.eveTraTotalPage);
                 $("#eveTraCurNo").attr("value", 1);

                 //清空table
                 var eveTraTB = document.getElementById("eveTraTab");
                 var rowNum = eveTraTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 eveTraTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var eveTraItem;                  
                 $.each(msgRes.eveTraDTOsList,function(i,result){                	              	    
                     if (i%2==0){                    	 
                    	 eveTraItem = "<tr style=\"background-color:#e0ffff;\">\
				               <td >" + result.sortIndex + "</td>\
				               <td >" + result.eveTraReqName + "</td>\
				               <td align=\"left\">" + result.eveTraContent + "</td>\
				               <td >" + result.eveTraState + "</td>\
				               <td align=\"left\">" + result.eveTraProgress + "</td>\
				               <td >" + result.eveTraPerInCharge + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.eveTraID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.eveTraID + "</td></tr>";
                         $("#eveTraTab").append(eveTraItem);                  
                     }
                     else{
                    	 eveTraItem = "<tr style=\"background-color:#f5f5f5\">\
                    		 <td >" + result.sortIndex + "</td>\
				               <td >" + result.eveTraReqName + "</td>\
				               <td align=\"left\">" + result.eveTraContent + "</td>\
				               <td >" + result.eveTraState + "</td>\
				               <td align=\"left\">" + result.eveTraProgress + "</td>\
				               <td >" + result.eveTraPerInCharge + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.eveTraID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.eveTraID + "</td></tr>";
                       $("#eveTraTab").append(eveTraItem);
                     }
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".eveTraSkip").click(function(){
          var eveTraCurPageNum = Number(document.getElementById("eveTraCurPageNum").value);  //当前页码
          var eveTraPageNum = 1;  // 将要跳转的页码
          var eveTraTotalPage = Number(document.getElementById("eveTraTotalPage").value);  //页码总数
          if (this.id == "eveTraFirst") {   // 首页
        	  eveTraPageNum = 1;
          } else if (this.id == "eveTraPrevious") {  //上一页
                 if (eveTraCurPageNum > 1 && eveTraCurPageNum <= eveTraTotalPage) {
                	 eveTraPageNum = Number(eveTraCurPageNum) - 1;
                 } else {
                	 eveTraPageNum = 1;
                 }
          } else if (this.id == "eveTraNext") { // 下一页
                 if (eveTraCurPageNum < eveTraTotalPage){
                	 eveTraPageNum = Number(eveTraCurPageNum) + 1;
                 }else {
                	 eveTraPageNum = eveTraTotalPage;
                 }
          } else if (this.id == "eveTraEnd") {  // 末页
            	 eveTraPageNum = eveTraTotalPage;
          } else if (this.id == "eveTraSearch") {  // 查询
            	 eveTraPageNum = 1;
          } else if (this.id == "eveTraJumpN") {
	        	 var eveTraCurNo = document.getElementById("eveTraCurNo").value;
		     	 if(eveTraCurNo==""){
		     	     sweetAlert("提示", "跳转页不能为空！", "warning");
		     	     return;
		     	 } 
	     	     if(!(/^\d+$/g).test(eveTraCurNo.trim())){
	     	    	 sweetAlert("提示", "请输入正整数！", "warning");
	     	    	 return;
	     	     }
	             eveTraCurNo = Number(document.getElementById("eveTraCurNo").value.trim());
                 if (eveTraCurNo > eveTraTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 eveTraPageNum = Number(eveTraCurNo);
          }
             
             // 查询条件
             var eveTraReqName = document.getElementById("eveTraReqName").value;  
             var eveTraState = document.getElementById("eveTraState").value;   
             var eveTraPerInCharge = document.getElementById("eveTraPerInCharge").value;              

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchEventTracks.do?",
                 data:{
                	 eveTraReqName : eveTraReqName, eveTraState : eveTraState,
                	 eveTraPerInCharge : eveTraPerInCharge, pageNum : eveTraPageNum
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("eveTraPage").rows[0].cells[1].innerHTML = "总计"+msgRes.eveTraTotalNum+"条记录";
                     $("#eveTraCurPageNum").attr("value", eveTraPageNum);
                     $("#eveTraTotalPage").attr("value", msgRes.eveTraTotalPage);
                     $("#eveTraCurNo").attr("value", eveTraPageNum);

                     // 清空 table
                     var eveTraTB = document.getElementById("eveTraTab");
                     var rowNum = eveTraTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 eveTraTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var eveTraItem;                    
                     $.each(msgRes.eveTraDTOsList,function(i,result){                   	 
                         if (i%2==0){
                        	 eveTraItem = "<tr style=\"background-color:#e0ffff\">\
                        	   <td >" + result.sortIndex + "</td>\
  				               <td >" + result.eveTraReqName + "</td>\
  				               <td align=\"left\">" + result.eveTraContent + "</td>\
  				               <td >" + result.eveTraState + "</td>\
  				               <td align=\"left\">" + result.eveTraProgress + "</td>\
  				               <td >" + result.eveTraPerInCharge + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
  				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
  				               <td ><a href=\"#\" onclick=\"delete_method("+result.eveTraID+")\">删除</a></td>\
  				               <td style=\"display:none\">" + result.eveTraID + "</td></tr>";
                           $("#eveTraTab").append(eveTraItem);
                         }
                         else{
                        	 eveTraItem = "<tr style=\"background-color:#f5f5f5\">\
                        	   <td >" + result.sortIndex + "</td>\
  				               <td >" + result.eveTraReqName + "</td>\
  				               <td align=\"left\">" + result.eveTraContent + "</td>\
  				               <td >" + result.eveTraState + "</td>\
  				               <td align=\"left\">" + result.eveTraProgress + "</td>\
  				               <td >" + result.eveTraPerInCharge + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
  				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
  				               <td ><a href=\"#\" onclick=\"delete_method("+result.eveTraID+")\">删除</a></td>\
  				               <td style=\"display:none\">" + result.eveTraID + "</td></tr>";
                         $("#eveTraTab").append(eveTraItem);
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
               {"id":1, "pId":0, "name":"未解决", "url":"<%=basePath%>loadEventTrack.do" ,"target":"_self"},               
               {"id":2, "pId":0, "name":"已解决", "url":"<%=basePath%>pages/event_track_finish.jsp" ,"target":"_self"}
     ];

      var tree = $("#treeMenu");  
      $(function() {   
          tree = $.fn.zTree.init(tree, setting, treeNodes); 
          tree.expandAll(true); 
      });  
	</script>

	<div id="dialog" title="新建事项" style="display: none;">
		<div id="eveTraInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
				<label style="margin-top: 20px; margin-left: 10px; color: #696969;">需求名字<span style="color:red;">*</span>：</label> 
				<input id="newEveTraReqName" type="text" style="margin-top: 20px;margin-left: 18px; width: 550px" />
				
				<label style="margin-top: 20px; margin-left: 10px; color: #696969; vertical-align: top;">主要内容 ：</label> 				
				<textarea id="newEveTraContent" rows = "6" style="margin-top: 20px;margin-left: 20px; width: 550px" ></textarea>
				
				<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">状态  ：</label> 				
				<input id="newEveTraState" type="text" style="margin-top: 20px;margin-left: 39px; width: 550px;" />	
							
				<label style="margin-top: 20px; margin-left: 20px; color: #696969;vertical-align: top;">进展 ：</label> 
				<textarea id="newEveTraProgress" rows = "3" style="margin-top: 20px;margin-left: 39px; width: 550px" ></textarea>
				
				<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 13px; color: #696969;">负责人 ：</label> 
				<input id="newEveTraPerInCharge" type="text" style="margin-top: 20px;margin-left: 30px; width: 550px; " />
			</div>
		</div>
	</div>
	
	<div id="dialogUpdate" title="更新事项" style="display: none;">
		<div id="eveTraInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
				<label style="margin-top: 20px; margin-left: 10px; color: #696969;">需求名字<span style="color:red;">*</span>：</label> 
				<input id="updateEveTraReqName" type="text" style="margin-top: 20px;margin-left: 18px; width: 550px" />

				<label style="margin-top: 20px; margin-left: 10px; color: #696969;vertical-align: top;">主要内容  ：</label> 								
				<textarea id="updateEveTraContent" rows="6" style="margin-top: 20px;margin-left: 20px; width: 550px" ></textarea>
					
				<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">状态  ：</label> 				
				<input id="updateEveTraState" type="text" style="margin-top: 20px;margin-left: 39px; width: 550px;" />	
							
				<label style="margin-top: 20px; margin-left: 20px; color: #696969;vertical-align: top;">进展 ：</label> 	
				<textarea id="updateEveTraProgress" rows = "3" style="margin-top: 20px;margin-left: 39px; width: 550px" ></textarea>
				
				<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;">负责人 ：</label> 
				<input id="updateEveTraPerInCharge" type="text" style="margin-top: 20px;margin-left: 32px;  width: 550px; " />
			</div>
		</div>
	</div>

	<div id="dialogDetail" title="追踪详情" style="display: none;">
		<div id="eveTraInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
				<label style="margin-top: 20px; margin-left: 10px; color: #696969;">需求名字<span style="color:red;">*</span>：</label> 
				<input id="detailEveTraReqName" type="text" style="margin-top: 20px;margin-left: 18px; width: 550px;" disabled/>

				<label style="margin-top: 20px; margin-left: 10px; color: #696969;vertical-align: top;">主要内容  ：</label> 								
				<textarea id="detailEveTraContent" rows="6" style="margin-top: 20px;margin-left: 20px; width: 550px;" disabled></textarea>
					
				<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">状态  ：</label> 				
				<input id="detailEveTraState" type="text" style="margin-top: 20px;margin-left: 39px; width: 550px;" disabled/>	
							
				<label style="margin-top: 20px; margin-left: 20px; color: #696969;vertical-align: top;">进展 ：</label> 	
				<textarea id="detailEveTraProgress" rows = "3" style="margin-top: 20px;margin-left: 39px; width: 550px;" disabled></textarea>
				
				<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;">负责人 ：</label> 
				<input id="detailEveTraPerInCharge" type="text" style="margin-top: 20px;margin-left: 32px;  width: 550px; " disabled/>
			</div>
		</div>
	</div>

	<script type="text/javascript">	  		  
      $("#newEveTra").click(function(){
    	  $("#dialog").dialog("open");
    	  event.preventDefault();
	  });
    
      $("#dialog").dialog({
    	   autoOpen: false,
    	   width: 750,
    	   height: 570,
    	   buttons: [
    		 {
    			text: "创建",
    			click: function() {
    	            var newEveTraReqName = document.getElementById("newEveTraReqName").value;   // 需求名称
    	            if(newEveTraReqName == "") {
    	                sweetAlert("需求名称不能为空！");
    	                return;
    	            }
    	            
    	            var newEveTraContent = document.getElementById("newEveTraContent").value.replace(/\n/g, '__');   // 内容,对&和换行符进行处理   	            
    	            var newEveTraState = document.getElementById("newEveTraState").value;   // 状态
    	            var newEveTraProgress = document.getElementById("newEveTraProgress").value.replace(/\n/g, '__');   // 进展
    	            var newEveTraPerInCharge = document.getElementById("newEveTraPerInCharge").value;   // 负责人  	           
    	            $.ajax({
    	                type: "POST",
    	                url: "<%=basePath%>createEventTrack.do?",
    	                data:{
    	                	newEveTraReqName : newEveTraReqName, newEveTraContent : newEveTraContent,
	                		newEveTraState : newEveTraState, newEveTraProgress : newEveTraProgress,
	                		newEveTraPerInCharge : newEveTraPerInCharge	                
    	                },
    	                success: function () {
    	                	   sweetAlert("创建追踪事件成功！", "success");
    	                	   window.location.href = "<%=basePath%>loadEventTrack.do";
                        },
						error : function(e) {
								sweetAlert("创建冲突程序失败：", e, "error");
						}
				    });
				    $(this).dialog("close");
				   }
			}, {
				text : "重置",
				click : function() {
					document.getElementById("newEveTraReqName").value = "";
					document.getElementById("newEveTraContent").value = "";
					document.getElementById("newEveTraState").value = "";															   
				    document.getElementById("newEveTraProgress").value = "";
				    document.getElementById("newEveTraPerInCharge").value = "";				
				}
			}, {
				text : "取消",
				click : function() {
						$(this).dialog("close");
				}
			} ]
	 });
     
      function delete_method(deleteEveTraID){  
    	  swal({
    		  title:"提示",
              text:"您确定要删除该条追踪事项吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
    	  },function(){
    		  $.ajax({
                  type: "POST",
                  url: "<%=basePath%>deleteEventTrack.do?",
                  data:{
                	  deleteEveTraID : deleteEveTraID
                	  },
                  success: function () {
                  	   window.location.href = "<%=basePath%>loadEventTrack.do";
                  },
   				error : function(e) {
   						swal("OMG", "删除操作失败了!",  "error");
   				}
   		    });
    	  });    	   	
	  };
	  
	  function update_method(obj){
		  var tr = obj.parent().parent().children("td");		  
		  var eveTraReqName = tr.eq(1).text();
		  var eveTraContent = tr.eq(2).html().replace(new RegExp("__","g"),'\n').replace(new RegExp("&lt;","g"),'<').replace(new RegExp("&gt;","g"),'>').replace(new RegExp("&amp;","g"),'&');
		  var eveTraState = tr.eq(3).text();
		  var eveTraProgress = tr.eq(4).html().replace(new RegExp("__","g"),'\n').replace(new RegExp("&lt;","g"),'<').replace(new RegExp("&gt;","g"),'>').replace(new RegExp("&amp;","g"),'&');
		  var eveTraPerInCharge = tr.eq(5).text();		  
		  var eveTraID = tr.eq(9).text();		  
		  document.getElementById("updateEveTraReqName").value = eveTraReqName;
		  document.getElementById("updateEveTraContent").value = eveTraContent;
		  document.getElementById("updateEveTraState").value = eveTraState;
		  document.getElementById("updateEveTraProgress").value = eveTraProgress;
		  document.getElementById("updateEveTraPerInCharge").value = eveTraPerInCharge;
    	  $("#dialogUpdate").show();
		  
    	  $("#dialogUpdate").dialog({
    	   	   autoOpen: true,
    	   	   width: 750,
    	   	   height: 570,
    	   	   buttons: [
    	   		 {
    	   			text: "更新",
    	   			click: function() {
    	   	            var updateEveTraReqName = document.getElementById("updateEveTraReqName").value;   // 需求名称  	   	         
    	   	            if(updateEveTraReqName == "") {
    	   	                sweetAlert("需求名称不能为空！");
    	   	                return;
    	   	            }
    	   	            var updateEveTraContent = document.getElementById("updateEveTraContent").value.replace(/\n/g, '__');   // 内容
    	   	            var updateEveTraState = document.getElementById("updateEveTraState").value;   // 状态	   	           
    	   	            var updateEveTraProgress = document.getElementById("updateEveTraProgress").value.replace(/\n/g, '__');  // 进展
    	   	            var updateEveTraPerInCharge = document.getElementById("updateEveTraPerInCharge").value;   // 负责人
    	   	            $.ajax({
    	   	                type: "POST",
    	   	                url: "<%=basePath%>updateEventTrack.do?",
    	   	                data:{ eveTraID : eveTraID,
    	   	                	updateEveTraReqName : updateEveTraReqName, updateEveTraContent : updateEveTraContent,
    	   	                	updateEveTraState : updateEveTraState, updateEveTraProgress : updateEveTraProgress,
    	   	                	updateEveTraPerInCharge : updateEveTraPerInCharge
                     		
    	   	                },
    	   	                success: function () {
    	   	                	   sweetAlert("更新事项成功！", "success");
    	   	                	   window.location.href = "<%=basePath%>loadEventTrack.do";
    	                       },
    							error : function(e) {
    									sweetAlert("更新事项失败：", e, "error");
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
    	  
	  };
	  
	  function check_details(obj){
		  var tr = obj.parent().parent().children("td");		  
		  var eveTraReqName = tr.eq(1).text();
		  var eveTraContent = tr.eq(2).html().replace(new RegExp("__","g"),'\n').replace(new RegExp("&lt;","g"),'<').replace(new RegExp("&gt;","g"),'>').replace(new RegExp("&amp;","g"),'&');		 		 
		  var eveTraState = tr.eq(3).text();
		  var eveTraProgress = tr.eq(4).html().replace(new RegExp("__","g"),'\n').replace(new RegExp("&lt;","g"),'<').replace(new RegExp("&gt;","g"),'>').replace(new RegExp("&amp;","g"),'&');
		  var eveTraPerInCharge = tr.eq(5).text();		  
		  var eveTraID = tr.eq(9).text();
		  document.getElementById("detailEveTraReqName").value = eveTraReqName;
		  document.getElementById("detailEveTraContent").value = eveTraContent;
		  document.getElementById("detailEveTraState").value = eveTraState;
		  document.getElementById("detailEveTraProgress").value = eveTraProgress;
		  document.getElementById("detailEveTraPerInCharge").value = eveTraPerInCharge;
		  $("#dialogDetail").show();
		  $("#dialogDetail").dialog({
   	   	   autoOpen: true,
   	   	   width: 750,
   	   	   height: 570,
   	   	   buttons: [
   	   		  {
   					text : "确定",
   					click : function() {
   							$(this).dialog("close");
   					}
   				} ]
   		 });
	  }
	  
	</script>
</body>
</html>