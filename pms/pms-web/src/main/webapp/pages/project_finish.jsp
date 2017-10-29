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
<title>项目管理</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/project.css" rel="stylesheet" type="text/css" />

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
						<a id="userName" href="#" ><%=session.getAttribute("_name")%></a>
					    <a id="a_logout" href="<%=basePath%>logout.do">注销</a>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div id="menu"><ul id="treeMenu" class="ztree" ></ul></div>
			<div id="local">
		    <label style="margin-left:2%; margin-top: 1%;">当前位置: 项目管理 >已完成</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="height:8%;text-align: left;">
				<table style="margin-left:2%">
				   <tr>
				     <td>
					 <label style="margin-top: 0.5%;">项目编号：</label> 
					 </td>
					 <td>
					 <input id="projNumber" type="text"  style="width: 100%; height: 24px; margin-top: 0.5%;" /> 
					 </td>
					 <td style="margin-left: 2%;">					  
					 <label style="margin-top: 0.5%; margin-left:20px;">需求编号：</label>
					 </td>
					 <td>					 
					 <input id="projReqNum" type="text"  style="width: 100%; height: 24px; margin-top: 0.5%;" />
					 </td>
					 <td style="margin-left: 2%;">
					 <label style="margin-top: 0.5%; margin-left:20px;">项目名称：</label>
					 </td>
					 <td colspan="2">
					 <input id="projName"  type="text" style="width: 100%; height: 24px; margin-top: 0.5%;" /> 
					 </td>
					 <td>
					</tr>
					<tr style="margin-top: 5%;">
					 <td>
					 <label style="margin-top: 0.5%; margin-left:2%;">负责人：</label>
					 </td>
					 <td>
					 <input id="projPerInCharge"  type="text" style="width: 100%; height: 24px; margin-top: 5px;" /> 
					 </td>
					 <td style="margin-left: 2%;">
					 <label style="margin-top: 5px;margin-left:20px;">上线时间：</label>
					 </td>
					 <td colspan="3">
					 <input id="projOnlineStart"  type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="width: 110px; height: 24px; margin-top: 0.5%;" /> 
					 <label >~</label>
					 <input id="projOnlineEnd" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="width: 110px; height: 24px; margin-top: 0.5%;margin-right:30px" /> 					 
					 </td>
					 <td>
					 <img style="margin-top: 5%;margin-left:60%;" id="projSearch" class="projSkip" src="<%=basePath%>static/img/search.png" /> 
					 </td>
					</tr>
				</table>					 
				</div>
                <table id="projTabHead">
					<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
						<td style="width: 2%">序号</td>
						<td style="width: 4%">项目编号</td>
						<td style="width: 4%">需求编号</td>
						<td style="width: 14%">项目名称</td>
						<td style="width: 4%">立项时间</td>
						<td style="width: 4%">计划上线时间</td>							
						<td style="width: 3%">目前状态</td>
						<td style="width: 3%">主/辅办</td>
						<td style="width: 3%">负责人</td>							
						<td style="width: 6%">对口业务</td>														
						<td style="display: none">ST结束时间</td>
						<td style="display: none">程序版本关系</td>
						<td style="display: none">功能点估算</td>
						<td style="display: none">备注</td>
						<td style="width: 2%">详情</td>
						<td style="display: none">主键ID</td>														
					</tr>
				</table>
				<div id="projListTable" style="height: 82%;">
					<table id="projTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 0px; ">
							<td style="width: 2%"></td>
							<td style="width: 4%"></td>
							<td style="width: 4%"></td>
							<td style="width: 14%"></td>
							<td style="width: 4%"></td>
							<td style="width: 4%"></td>							
							<td style="width: 3%"></td>
							<td style="width: 3%"></td>
							<td style="width: 3%"></td>							
							<td style="width: 6%"></td>														
							<td style="display: none"></td>
							<td style="display: none"></td>
							<td style="display: none"></td>
							<td style="display: none"></td>
							<td style="width: 2%"></td>
							<td style="display: none"></td>														
						</tr>
					</table>
                </div>
                 <div>
					<table id="projPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="projFirst" class="projSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="projPrevious" class="projSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="projCenterBar" style="width: 60px;">
							      <input id="projCurPageNum" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>/</label> 
							      <input id="projTotalPage" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="projNext" class="projSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="projEnd" class="projSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="projCurNo" style="width: 40px;text-align:center;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="projJumpN" class="projSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
             url : "<%=basePath%>searchFinishProjects.do?projNumber=&projReqNum=&projName=&projPerInCharge=&projOnlineDate=&projOnlineStart=&projOnlineEnd=&pageNum=1",
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("projPage").rows[0].cells[1].innerHTML = "总计"+msgRes.projTotalNum+"条记录";
                 $("#projCurPageNum").attr("value", 1);       //设置备选属性的值，即设置projCurPageNum的值为1，也就是当前默认显示第一页
                 $("#projTotalPage").attr("value", msgRes.projTotalPage);
                 $("#projCurNo").attr("value", 1);

                 //清空table
                 var projTB = document.getElementById("projTab");
                 var rowNum = projTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 projTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var projItem; 
                 var Colorflag = 1;
                 var dispalyProjNumFlag = 1;                 
                 var num = "";
                 var index = 1;
                 var indexDisplay = index;
                 var visiFlag ="visible";
                 $.each(msgRes.projDTOsList,function(i,result){                 	 
               		 if(i==0){num = result.projNumber;}
                	 if(result.projNumber!=num){
                		 Colorflag = 1-Colorflag;
                		 num = result.projNumber;
                		 dispalyProjNumFlag = 1;
                		 index++;
                		 indexDisplay = index;
                	 }else{
                		 dispalyProjNumFlag = 0;
                	 }
                	 visiFlag ="visible";
                	 if(i&&!dispalyProjNumFlag){
                		 visiFlag ="hidden";
                		 indexDisplay = "";
                	 }
                	 
                     if (Colorflag){                    	 
                    	 projItem = "<tr style=\"background-color:#e0ffff;\">\
				               <td >" + indexDisplay + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projName + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projStartDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOnlineDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCurState + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOrganizeType + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projPerInCharge + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projSTEndDate + "</td>\
				               <td style=\"display:none\">" + result.projDependID + "</td>\
				               <td style=\"display:none\">" + result.projFuncPoint + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td></tr>";
                         $("#projTab").append(projItem);                  
                     }
                     else{
                    	 projItem = "<tr style=\"background-color:#f5f5f5\">\
                    		   <td >" + indexDisplay + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projName + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projStartDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOnlineDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCurState + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOrganizeType + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projPerInCharge + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projSTEndDate + "</td>\
				               <td style=\"display:none\">" + result.projDependID + "</td>\
				               <td style=\"display:none\">" + result.projFuncPoint + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td></tr>";
                       $("#projTab").append(projItem);
                     }             		                	 
                 });  
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".projSkip").click(function(){
          var projCurPageNum = Number(document.getElementById("projCurPageNum").value);  //当前页码
          var projPageNum = 1;  // 将要跳转的页码
          var projTotalPage = Number(document.getElementById("projTotalPage").value);  //页码总数
          if (this.id == "projFirst") {   // 首页
        	  projPageNum = 1;
          } else if (this.id == "projPrevious") {  //上一页
                 if (projCurPageNum > 1 && projCurPageNum <= projTotalPage) {
                	 projPageNum = Number(projCurPageNum) - 1;
                 } else {
                	 projPageNum = 1;
                 }
          } else if (this.id == "projNext") { // 下一页
                 if (projCurPageNum < projTotalPage){
                	 projPageNum = Number(projCurPageNum) + 1;
                 }else {
                	 projPageNum = projTotalPage;
                 }
          } else if (this.id == "projEnd") {  // 末页
            	 projPageNum = projTotalPage;
          } else if (this.id == "projSearch") {  // 查询
            	 projPageNum = 1;
          } else if (this.id == "projJumpN") {
	        	 var projCurNo = document.getElementById("projCurNo").value;
	     	     if(projCurNo==""){
	     	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
	     	    	 return;
	     	     } 
	     	     if(!(/^\d+$/g).test(projCurNo.trim())){
	     	    	 sweetAlert("提示", "请输入正整数！", "warning");
	     	    	 return;
	     	     }
                 projCurNo = Number(document.getElementById("projCurNo").value.trim());
                 if (projCurNo > projTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 projPageNum = Number(projCurNo);
          }
             
             // 查询条件
	         var projNumber = document.getElementById("projNumber").value;
	         if(projNumber!=null&&projNumber.trim()!=""&&(!(/(P|T){1}[0-9]{7}$/g).test(projNumber.trim()))){
	         	sweetAlert("提示", "项目编号格式不正确！\n正确格式如：T1111111或P1111111", "warning");
	         	return;
	         }
	         var projReqNum = document.getElementById("projReqNum").value;
	         if(projReqNum!=null&&projReqNum.trim()!=""&&(!(/R{1}[0-9]{6}$/g).test(projReqNum.trim()))){
	         	 sweetAlert("提示", "需求编号格式不正确！\n正确格式如：R111111", "warning");
	         	 return;
	         }             
             var projName = document.getElementById("projName").value;  
             var projPerInCharge = document.getElementById("projPerInCharge").value;  
             var projOnlineStart = document.getElementById("projOnlineStart").value;  
             var projOnlineEnd = document.getElementById("projOnlineEnd").value;             
             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchFinishProjects.do?",
                 data:{
                	 projNumber : projNumber, projReqNum : projReqNum,
                	 projName : projName, projPerInCharge : projPerInCharge,
                	 projOnlineStart : projOnlineStart, projOnlineEnd : projOnlineEnd,
                	 pageNum : projPageNum 
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("projPage").rows[0].cells[1].innerHTML = "总计"+msgRes.projTotalNum+"条记录";
                     $("#projCurPageNum").attr("value", projPageNum);
                     $("#projTotalPage").attr("value", msgRes.projTotalPage);
                     $("#projCurNo").attr("value", projPageNum);

                     // 清空 table
                     var projTB = document.getElementById("projTab");
                     var rowNum = projTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 projTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                    var projItem; 
                    var Colorflag = 1;
                    var dispalyProjNumFlag = 1;                 
                    var num = "";
                    var index = 1;
                    var indexDisplay = index;
                    var visiFlag ="visible";
                     
                 $.each(msgRes.projDTOsList,function(i,result){ 
                	 if(i==0){num = result.projNumber;}
                	 if(result.projNumber!=num){
                		 Colorflag = 1-Colorflag;
                		 num = result.projNumber;
                		 dispalyProjNumFlag = 1;
                		 index++;
                		 indexDisplay = index;
                	 }else{
                		 dispalyProjNumFlag = 0;
                	 }
                	 visiFlag ="visible";
                	 if(i&&!dispalyProjNumFlag){
                		 visiFlag ="hidden";
                		 indexDisplay = "";
                	 }
                     if (Colorflag){                    	 
                    	 projItem = "<tr style=\"background-color:#e0ffff;\">\
                    		 <td >" + indexDisplay + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projName + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projStartDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOnlineDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCurState + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOrganizeType + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projPerInCharge + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projSTEndDate + "</td>\
				               <td style=\"display:none\">" + result.projDependID + "</td>\
				               <td style=\"display:none\">" + result.projFuncPoint + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td></tr>";
                         $("#projTab").append(projItem);                  
                     }
                     else{
                    	 projItem = "<tr style=\"background-color:#f5f5f5\">\
                    		 <td >" + indexDisplay + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projName + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projStartDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOnlineDate + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCurState + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projOrganizeType + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projPerInCharge + "</td>\
				               <td style=\"visibility:"+visiFlag+"\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projSTEndDate + "</td>\
				               <td style=\"display:none\">" + result.projDependID + "</td>\
				               <td style=\"display:none\">" + result.projFuncPoint + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				             <td style=\"display:none\">" + result.projID + "</td></tr>";
                       $("#projTab").append(projItem);
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
               {"id":1, "pId":0, "name":"开发中项目", "url":"<%=basePath%>loadProject.do","target":"_self" },               
               {"id":2, "pId":0, "name":"已完成项目", "url":"<%=basePath%>loadProjectFinish.do" ,"target":"_self"},
               {"id":3, "pId":0, "name":"预研项目", "url":"<%=basePath%>loadProjectBeforehand.do" ,"target":"_self"}
     ];

      var tree = $("#treeMenu");  
      $(function() {   
          tree = $.fn.zTree.init(tree, setting, treeNodes); 
          tree.expandAll(true); 
      });  
	</script>	
	
	<div id="projDetails" title="项目详情" style="display: none;">
		<div id="projInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
		      <table>
			   <tr>
			     <td>					
					<label style="margin-top: 20px; margin-left: 20px; color: #696969;">项目编号*：</label> 
					<input id="detailProjNumber" type="text" style="margin-top: 20px;margin-left: 30px; width: 295px " disabled/>				
				 </td>
				 <td>
					<label style="margin-top: 20px; margin-left: 50px; color: #696969;">需求编号*：</label> 				
					<input id="detailProjReqNum" type="text" style="margin-top: 20px;margin-left: 13px; width: 295px" disabled/>						
				 </td>
				</tr>
				<tr>
				  <td>	
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 20px;color: #696969;">项目名称*：</label> 
					<input id="detailProjName" type="text" style="margin-top: 20px;margin-left: 30px; width: 295px" disabled/>						
				  </td>
				  <td>			
					<label style="margin-top: 20px; margin-left: 50px; color: #696969;">立项时间：</label> 
					<input id="detailProjStartDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label style="margin-top: 20px; margin-left: 20px; color: #696969;">ST结束时间：</label> 
					<input id="detailProjSTEndDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px;" disabled/>
				  </td>
				  <td>
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 50px; color: #696969;">上线时间：</label> 
					<input id="detailProjOnlineDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px;" disabled/>
	              </td>
				</tr>
				<tr>
				  <td>
	                <label style="margin-top: 20px; margin-bottom: 20px; margin-left: 22px; color: #696969;">程序版本关系：</label> 				
					<input id="detailProjDependID" type="text" style="margin-top: 20px;margin-left: 4px; width: 295px;"disabled/>	
	              </td>
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 52px; color: #696969;">目前状态：</label> 
	                <input id="detailProjCurState" type="text" style="margin-top: 20px;margin-left: 19px; width: 295px;" disabled/>														               
	              </td>
				</tr>
				<tr>
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 22px; color: #696969;">主/辅办：</label> 
	                <input id="detailProjOrganizeType" type="text" style="margin-top: 20px;margin-left: 44px; width: 295px;" disabled/>	                								
				  </td>
				  <td> 	
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 52px; color: #696969;">负责人：</label> 				
					<input id="detailProjPerInCharge" type="text" style="margin-top: 20px;margin-left: 34px; width: 295px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td>
				    <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 22px; color: #696969;">功能点估算：</label> 				
					<input id="detailProjFuncPoint" type="text" style="margin-top: 20px;margin-left: 19px; width: 295px;"  disabled/>
				  </td>
				  <td> 
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 52px; color: #696969;">对口业务：</label> 				
					<input id="detailProjCouBusiness" type="text" style="margin-top: 20px;margin-left: 20px; width: 295px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 22px; color: #696969;">其他成员：</label> 
					<input id="detailProjMember" type="text" style="margin-top: 20px;margin-left: 34px;  heigt:120px;width: 752px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">					
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 20px; color: #696969;vertical-align: top;">备注：</label>
					<textarea id="detailProjRemark" rows = "2" style="margin-top: 20px;margin-left: 67px; width: 752px" disabled></textarea> 				
				  </td>
				</tr>
			  </table>
			</div>
		</div>
	</div>
			
	<script type="text/javascript">   
	  //查看详情
	  function check_details(obj){
		  var tr = obj.parent().parent().children("td");
		  var projNumber = tr.eq(1).text();
		  var projReqNum = tr.eq(2).text();
		  var projName = tr.eq(3).text();
		  var projStartDate = tr.eq(4).text();
		  var projOnlineDate = tr.eq(5).text();		  
		  var projCurState = tr.eq(6).text();
		  var projOrganizeType = tr.eq(7).text();
		  var projPerInCharge = tr.eq(8).text();
		  var projCouBusiness = tr.eq(9).text();
		  var projSTEndDate = tr.eq(10).text();
		  var projDependID = tr.eq(11).text();
		  var projFuncPoint = tr.eq(12).text();		  
		  var projRemark = tr.eq(13).html();
		  var projID = tr.eq(16).text();
		  //var projMember = tr.eq(17).text();
		  document.getElementById("detailProjNumber").value = projNumber;
		  document.getElementById("detailProjReqNum").value = projReqNum;
		  document.getElementById("detailProjName").value = projName;
		  document.getElementById("detailProjStartDate").value = projStartDate;
		  document.getElementById("detailProjOnlineDate").value = projOnlineDate;		  
		  document.getElementById("detailProjCurState").value = projCurState;
		  document.getElementById("detailProjOrganizeType").value = projOrganizeType;		  		  	  		  		 		  		
		  document.getElementById("detailProjPerInCharge").value = projPerInCharge;
		  document.getElementById("detailProjSTEndDate").value = projSTEndDate;
		  document.getElementById("detailProjDependID").value = projDependID;
		  document.getElementById("detailProjFuncPoint").value = projFuncPoint;
		  document.getElementById("detailProjCouBusiness").value = projCouBusiness;
		  document.getElementById("detailProjRemark").value = projRemark.replace(new RegExp("<br>","g"),'\n').replace(RegExp("&nbsp;","g"),' ').replace(RegExp("&amp;","g"),'&');
		  //document.getElementById("detailProjMember").value = projMember;
    	  $("#projDetails").show();		  
    	  $("#projDetails").dialog({
    	   	   autoOpen: true,
    	   	   width: 1050,
    	   	   height: 600,
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