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
		    <label style="margin-left:2%; margin-top: 1%;">当前位置: 项目管理 >预研项目</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">项目编号：</label> 
					 <input id="projNumber" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" /> 					  
					 <label style="margin-top: 0.5%; margin-left:1%;">需求编号：</label>					 
					 <input id="projReqNum" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" />
					 <label style="margin-top: 0.5%; margin-left:1%;">项目名称：</label>
					 <input id="projName"  type="text" style="width: 12%; height: 24px; margin-top: 0.5%; " /> 
					 <label style="margin-top: 0.5%; margin-left:1%;">负责人：</label>
					 <input id="projPerInCharge" type="text" style="width: 10%; height: 24px; margin-top: 0.5%; margin-right:2%" /> 
					 <img id="projSearch" class="projSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newProj" type="button" class="btn btn-default btn-sm" style="background-color:#a6d2ff;margin-left:20px">新建项目</button>
				</div>
				
				<table id="projTabHead">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 2.5%">序号</td>
							<td style="width: 4.5%">项目编号</td>
							<td style="width: 4.5%">需求编号</td>
							<td style="width: 15%">项目（任务）名称</td>
							<td style="width: 4.5%">立项时间</td>
							<td style="width: 4.5%">计划结束时间</td>						
							<td style="width: 3%">目前状态</td>
							<td style="width: 3%">主/辅办</td>
							<td style="width: 3%">负责人</td>
							<td style="display: none">对口业务</td>
							<td style="display: none">备注</td>
							<td style="width: 2.8%">更多详情</td>							
							<td style="width: 2.5%">更新</td>
							<td style="width: 2.5%">删除</td>
							<td style="display: none">主键ID</td>
							<td style="display: none">其他成员</td>														
						</tr>
				</table>

				<div id="projListTable">
					<table id="projTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 0px; ">
							<td style="width: 2.5%"></td>
							<td style="width: 4.5%"></td>
							<td style="width: 4.5%"></td>
							<td style="width: 15%"></td>
							<td style="width: 4.5%"></td>							
							<td style="width: 4.5%"></td>	
							<td style="width: 3%"></td>
							<td style="width: 3%"></td>
							<td style="width: 3%"></td>					
							<td style="display: none"></td>
							<td style="display: none"></td>
							<td style="width: 2.8%"></td>							
							<td style="width: 2.5%"></td>
							<td style="width: 2.5%"></td>
							<td style="display: none"></td>
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
    	 var projState = "0";
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchProjects.do?projNumber=&projReqNum=&projName=&projPerInCharge=&projState="+projState+"&pageNum=1",
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
                 $.each(msgRes.projDTOsList,function(i,result){                             	 
                     if (i%2==0){                    	 
                    	 projItem = "<tr style=\"background-color:#e0ffff;\">\
				               <td >" + result.sortIndex + "</td>\
				               <td >" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum+ "</td>\
				               <td >" + result.projName + "</td>\
				               <td >" + result.projStartDate + "</td>\
				               <td >" + result.projExpEndDate + "</td>\
				               <td >" + result.projCurState + "</td>\
				               <td >" + result.projOrganizeType + "</td>\
				               <td >" + result.projPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.projID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td>\
				               <td style=\"display:none\">" + result.projMember + "</td></tr>";
                         $("#projTab").append(projItem);                  
                     }
                     else{
                    	 projItem = "<tr style=\"background-color:#f5f5f5\">\
                    		   <td >" + result.sortIndex + "</td>\
				               <td >" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum+ "</td>\
				               <td >" + result.projName + "</td>\
				               <td >" + result.projStartDate + "</td>\
				               <td >" + result.projExpEndDate + "</td>\
				               <td >" + result.projCurState + "</td>\
				               <td >" + result.projOrganizeType + "</td>\
				               <td >" + result.projPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.projID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td>\
				               <td style=\"display:none\">" + result.projMember + "</td></tr>";
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
             var projState = "0";
             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchProjects.do?",
                 data:{
                	 projNumber : projNumber, projReqNum : projReqNum,
                	 projName : projName, projPerInCharge : projPerInCharge,
                	 projState : projState, pageNum : projPageNum 
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
                 $.each(msgRes.projDTOsList,function(i,result){                 	
                     if (i%2==0){                    	 
                    	 projItem = "<tr style=\"background-color:#e0ffff;\">\
                    		 <td >" + result.sortIndex + "</td>\
				               <td >" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum+ "</td>\
				               <td >" + result.projName + "</td>\
				               <td >" + result.projStartDate + "</td>\
				               <td >" + result.projExpEndDate + "</td>\
				               <td >" + result.projCurState + "</td>\
				               <td >" + result.projOrganizeType + "</td>\
				               <td >" + result.projPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.projID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td>\
				               <td style=\"display:none\">" + result.projMember + "</td></tr>";
                         $("#projTab").append(projItem);                  
                     }
                     else{
                    	 projItem = "<tr style=\"background-color:#f5f5f5\">\
                    		 <td >" + result.sortIndex + "</td>\
				               <td >" + result.projNumber  + "</td>\
				               <td >" + result.projReqNum+ "</td>\
				               <td >" + result.projName + "</td>\
				               <td >" + result.projStartDate + "</td>\
				               <td >" + result.projExpEndDate + "</td>\
				               <td >" + result.projCurState + "</td>\
				               <td >" + result.projOrganizeType + "</td>\
				               <td >" + result.projPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.projCouBusiness + "</td>\
				               <td style=\"display:none\">" + result.projRemark + "</td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.projID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.projID + "</td>\
				               <td style=\"display:none\">" + result.projMember + "</td></tr>";
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

	<div id="dialog" title="新建项目" style="display: none;">
		<div id="projInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
			  <table>
			   <tr>
			     <td>			   
					<label style="margin-top: 20px; margin-left: 20px; color: #696969;">项目编号<span style="color:red;">*</span>：</label> 
					<input id="newProjNumber" type="text" style="margin-top: 20px;margin-left: 14px; margin-right: 20px;width: 295px" />								
				 </td>
				 <td>
					<label style="margin-top: 20px; margin-left: 30px; color: #696969;">需求编号<span style="color:red;">*</span>：</label>
					<input id="newProjReqNum" type="text" style="margin-top: 20px;margin-left: 40px; margin-right: 15px;width: 220px;" />
					<img id="newProjReqNumSearch" src="<%=basePath%>static/img/mySelect.png" />															
				 </td>
			   </tr>
			   <tr>
			     <td colspan="2">
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 20px;color: #696969;">项目名称<span style="color:red;">*</span>：</label> 
					<input id="newProjName" type="text" style="margin-top: 20px;margin-left: 14px; width: 772px" />						
				 </td>				 
			  </tr>
			  <tr>
			     <td>				
					<label style="margin-top: 20px; margin-left: 20px; color: #696969;">立项时间：</label> 
					<input id="newProjStartDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px" />
			     </td>	
			     <td>
					<label style="margin-top: 20px; margin-left: 30px; color: #696969;">计划结束时间：</label> 
					<input id="newProjExpEndDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px" />
				 </td>				 
              </tr>
               <tr>                  
	              <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">目前状态：</label> 	
	                <select id = "newProjCurState" style="margin-top: 20px;margin-left: 19px;height:28px; width: 295px;">
	                    <option value = "">------请选择------</option>
	                    <option value = "01">预研中</option>
	                    <option value = "02">已完成预研</option>                    
	                </select>			
				  </td>
				  <td>                
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 30px; color: #696969;">主/辅办：</label> 
	                <select id="newProjOrganizeType" style="margin-top: 20px;margin-left: 60px; height:28px; width: 295px;">
	                    <option value = "">------请选择------</option>
	                    <option value = "1">主办</option>
	                    <option value = "2">辅办</option> 
	                </select>									
				  </td>
				</tr>
				<tr>
				  <td>
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">负责人：</label> 				
					<input id="newProjPerInCharge" type="text" style="margin-top: 20px;margin-left: 34px; width: 295px;" />
				  </td>
				  <td>
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 30px; color: #696969;">对口业务：</label> 				
					<input id="newProjCouBusiness" type="text" style="margin-top: 20px;margin-left: 50px; width: 295px;" />
				  </td>
				</tr>				
				<tr>
				  <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 20px; color: #696969;">其他成员：</label> 
					<input id="newProjMember" type="text" style="margin-top: 20px;margin-left: 20px;  heigt:120px;width: 772px;" />
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 22px; color: #696969;vertical-align: top;">备注：</label> 
					<textarea id="newProjRemark" rows = "2" style="margin-top: 20px;margin-left: 49px; width: 772px" ></textarea>					
				  </td>
				</tr>
			   </table>
			</div>
		</div>
	</div>
	
		<div id="dialogUpdate" title="更新项目" style="display: none;">
		<div id="projInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
		      <table>
			   <tr>
			     <td>					
					<label style="margin-top: 30px; margin-left: 10px; color: #696969;">项目编号<span style="color:red;">*</span>：</label> 
					<input id="updateProjNumber" type="text" style="margin-top: 20px;margin-left: 25px; width: 295px" disabled/>
									
				 </td>
				 <td>
					<label style="margin-top: 30px; margin-left: 50px; color: #696969;">需求编号<span style="color:red;">*</span>：</label> 				
					<input id="updateProjReqNum" type="text" style="margin-top: 20px;margin-left: 46px;margin-right: 13px;  width: 220px" />
					<img id="updateProjReqNumSearch" src="<%=basePath%>static/img/mySelect.png" />						
				 </td>
				</tr>
				<tr>
				  <td colspan ="2">	
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 10px;color: #696969;">项目名称<span style="color:red;">*</span>：</label> 
					<input id="updateProjName" type="text" style="margin-top: 20px;margin-left: 25px; width: 776px" />						
				  </td>
				</tr>
				<tr>				
				  <td>			
					<label style="margin-top: 20px; margin-left: 10px; color: #696969;">立项时间：</label> 
					<input id="updateProjStartDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 32px;height:30px; width: 295px;" />
				  </td>
				  <td>
					<label style="margin-top: 20px; margin-left: 50px; color: #696969;">计划结束时间：</label> 
					<input id="updateProjExpEndDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 20px;height:30px; width: 295px;" />
				  </td>
				</tr>
				<tr>				  
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">目前状态：</label> 									
					<select id="updateProjCurState" style="margin-top: 20px;margin-left: 31px;height:28px; width: 200px;">
					    <option value = "">------请选择------</option>
	                    <option value = "11">设计中</option>
	                    <option value = "12">开发中</option>
	                    <option value = "13">联调中</option>
	                    <option value = "14">ST测试</option>
	                    <option value = "15">UAT测试</option>
	                    <option value = "16">已完成开发</option>
	                    <option value = "17">等待上线</option>
	                    <option value = "21">暂缓</option>
	                    <option value = "01">预研中</option>
	                    <option value = "02">已完成预研</option>                    
	                </select>               
	              </td>
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 50px; color: #696969;">主/辅办：</label> 
	                <select id="updateProjOrganizeType" style="margin-top: 20px;margin-left: 59px; height:28px;width: 295px;">
	                    <option value = "">------请选择------</option>
	                	<option value = "1">主办</option>
	                    <option value = "2">辅办</option>
	                </select>									
				  </td>
				</tr>
				<tr>
				  <td> 	
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">负责人：</label> 				
					<input id="updateProjPerInCharge" type="text" style="margin-top: 20px;margin-left: 45px; width: 295px;" />
				  </td>				  
				  <td> 
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 50px; color: #696969;">对口业务：</label> 				
					<input id="updateProjCouBusiness" type="text" style="margin-top: 20px;margin-left: 52px; width: 295px;" />
				  </td>
				</tr>				
				<tr>
				  <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">其他成员：</label> 
					<input id="updateProjMember" type="text" style="margin-top: 20px;margin-left: 29px;  heigt:120px;width: 778px;" />
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">					
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;vertical-align: top;">备注：</label> 
					<textarea id="updateProjRemark" rows = "2" style="margin-top: 20px;margin-left: 62px; width: 778px" ></textarea>					
				  </td>
				</tr>
			  </table>
			</div>
		</div>
	</div>
    <div id="projDetails" title="项目详情" style="display: none;">
		<div id="projInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
		      <table>
			   <tr>
			     <td>					
					<label style="margin-top: 30px; margin-left: 10px; color: #696969;">项目编号*：</label> 
					<input id="detailProjNumber" type="text" style="margin-top: 20px;margin-left: 25px; width: 295px " disabled/>				
				 </td>
				 <td>
					<label style="margin-top: 30px; margin-left: 50px; color: #696969;">需求编号*：</label> 				
					<input id="detailProjReqNum" type="text" style="margin-top: 20px;margin-left: 46px; width: 295px" disabled/>						
				 </td>
				</tr>
				<tr>
				  <td colspan="2">	
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 10px;color: #696969;">项目名称*：</label> 
					<input id="detailProjName" type="text" style="margin-top: 20px;margin-left: 25px; width: 778px" disabled/>						
				  </td>
				</tr>
				<tr>
				  <td>			
					<label style="margin-top: 20px; margin-left: 10px; color: #696969;">立项时间：</label> 
					<input id="detailProjStartDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 32px;height:30px; width: 295px;" disabled/>
				  </td>
				  <td>
					<label style="margin-top: 20px; margin-left: 50px; color: #696969;">计划结束时间：</label> 
					<input id="detailProjExpEndDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 25px;height:30px; width: 295px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">目前状态：</label> 
	                <input id="detailProjCurState" type="text" style="margin-top: 20px;margin-left: 30px; width: 295px;" disabled/>														               
	              </td>
				  <td> 
	                <label style="margin-top: 20px; margin-bottom: 10px; margin-left: 50px; color: #696969;">主/辅办：</label> 
	                <input id="detailProjOrganizeType" type="text" style="margin-top: 20px;margin-left: 64px; width: 295px;" disabled/>	                								
				  </td>
				</tr>
				<tr>
				  <td> 	
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">负责人：</label> 				
					<input id="detailProjPerInCharge" type="text" style="margin-top: 20px;margin-left: 45px; width: 295px;" disabled/>
				  </td>
				  <td> 
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 50px; color: #696969;">对口业务：</label> 				
					<input id="detailProjCouBusiness" type="text" style="margin-top: 20px;margin-left: 55px; width: 295px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">其他成员：</label> 
					<input id="detailProjMember" type="text" style="margin-top: 20px;margin-left: 31px;  heigt:120px;width: 778px;" disabled/>
				  </td>
				</tr>
				<tr>
				  <td colspan = "2">					
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;vertical-align: top;">备注：</label> 
					<textarea id="detailProjRemark" rows = "2" style="margin-top: 20px;margin-left: 63px; width: 778px" disabled></textarea>					
				  </td>
				</tr>
			  </table>
			</div>
		</div>
	</div>
	<div id="projReqNumCheck" title="选择需求编号" style="display: none;">
		<div id="projInfo" style="overflow-y:visible;margin: 3px 40px;background: #f5f5f5; width: 98%; height: 96%;">
			<div >
		      <table>
		          <tr>
		              <td style="margin-top: 20px; margin-bottom: 20px;font-weight:bold;">
		                  <div style="margin-left: 20px;margin-right: 100px;">可选择编号</div></td>
		              <td><div style="margin-left: 80px;margin-right: 80px;"></div></td>
		              <td style="margin-top: 20px; margin-bottom: 20px; margin-left: 30px;font-weight:bold;">
		                  <div style="margin-left: 20px;margin-right: 100px;">已选择编号</div></td>
		          </tr>
		          <tr>
		          	<td style="overflow-y:scroll;border:1px solid #617775;background-color:#fff;vertical-align:top;">		          	     
		          	     <div style="margin-bottom: 20px; margin-left: 20px;margin-right: 100px;height:450px;" id = choiceOption ></div>
		          	</td>
		          	<td ><p style="height:50px;margin-left:40px;"><input id = addReq type = "button" value = "添加&gt;&gt;" onclick="addReqNum()" /></p>
		          	    <p style="height:50px;margin-left:40px;"><input id = deleteReq type = "button" value = "&lt;&lt;删除" onclick="deleteReqNum()" /><p>
		          	</td>
		          	<td style="overflow-y:scroll;border:1px solid #617775;background-color:#fff;vertical-align:top;">		          	    
		          	    <div style="margin-bottom: 10px; margin-left: 20px;margin-right: 100px;height:450px;" id = selectedOption></div>
		          	</td>
		          </tr>
		      </table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		 	  
	//新建项目 加载需求编号
	  $("#newProj").click(function(){
		  $("#dialog").dialog("open");
    	  event.preventDefault();
	  });
	    
      $("#dialog").dialog({
    	   autoOpen: false,
    	   width: 1050,
    	   height: 600,
    	   buttons: [
    		 {
    			text: "创建",
    			click: function() {
    	            var newProjNumber = document.getElementById("newProjNumber").value;   // 项目编号
    	            if(newProjNumber.trim() == "") {
    	                sweetAlert("项目编号不能为空！");
    	                return;
    	            }
    	            if(newProjNumber!=null&&newProjNumber.trim()!=""&&(!(/(P|T){1}[0-9]{7}$/g).test(newProjNumber.trim()))){
   	            	 sweetAlert("提示", "项目编号格式不正确！\n正确格式如：T1111111或P1111111", "warning");
   	            	 return;
   	               }
    	            var newProjReqNum = document.getElementById("newProjReqNum").value;   // 需求编号
    	            if(newProjReqNum.trim() == "") {
    	                sweetAlert("需求编号不能为空！");
    	                return;
    	            } 
    	            var newProjName = document.getElementById("newProjName").value;   // 项目名
    	            if(newProjName == "") {
    	                sweetAlert("项目名不能为空！");
    	                return;
    	            }    	            
    	            var newProjStartDate = document.getElementById("newProjStartDate").value;   // 立项时间
    	            var newProjExpEndDate = document.getElementById("newProjExpEndDate").value;   // 计划结束时间    	            
    	            var newProjCurState = document.getElementById("newProjCurState").value;   // 状态
    	            if(newProjCurState == "") {
    	                sweetAlert("请选择项目状态！");
    	                return;
    	            }
    	            var newProjOrganizeType = document.getElementById("newProjOrganizeType").value;   //主辅办
    	            var newProjPerInCharge = document.getElementById("newProjPerInCharge").value;   // 负责人
    	            var newProjCouBusiness = document.getElementById("newProjCouBusiness").value;   // 对口业务
    	            var newProjMember = document.getElementById("newProjMember").value;   // 其他成员
    	            var newProjRemark = document.getElementById("newProjRemark").value.replace(/\n/g, '<br>');   // 备注
    	            $.ajax({
    	                type: "POST",
    	                url: "<%=basePath%>createProject.do?",
    	                data:{
    	                	newProjNumber :  newProjNumber, newProjReqNum :  newProjReqNum,
    	                	newProjName :  newProjName, newProjStartDate :  newProjStartDate,
    	                	newProjExpEndDate :  newProjExpEndDate, newProjCurStat :  newProjCurState,
    	                	newProjOrganizeType :  newProjOrganizeType, newProjPerInCharge :  newProjPerInCharge,
	                		newProjCouBusiness :  newProjCouBusiness, newProjMember :  newProjMember,
	                		newProjRemark :  newProjRemark
    	                },
    	                success: function () {
    	                	   sweetAlert("创建项目成功！", "success");
    	                	   window.location.href = "<%=basePath%>loadProjectBeforehand.do";
                        },
						error : function(e) {
								sweetAlert("创建项目失败：", e, "error");
						}
				    });
				    $(this).dialog("close");
				   }
			}, {
				text : "重置",
				click : function() {
						document.getElementById("newProjNumber").value = "";
					    document.getElementById("newProjReqNum").value = "";
					    document.getElementById("newProjName").value = "";
					    document.getElementById("newProjStartDate").value = "";
					    document.getElementById("newProjExpEndDate").value = "";			    
					    document.getElementById("newProjPerInCharge").value = "";
					    document.getElementById("newProjCouBusiness").value = "";
					    document.getElementById("newProjMember").value = "";
					    document.getElementById("newProjRemark").value = "";
					    document.getElementById("newProjCurState")[0].selected = true;
					    document.getElementById("newProjOrganizeType")[0].selected = true;					    					    
				}
			}, {
				text : "取消",
				click : function() {
						$(this).dialog("close");
				}
			} ]
	 });
      
      //选择需求编号
      $("#newProjReqNumSearch").click(function(){
    	  $("#projReqNumCheck").dialog("open");
    	  event.preventDefault();
    	  $("#choiceOption").empty();
    	  $("#selectedOption").empty();    	  
    	  $.ajax({
              type: "POST",
              url: "<%=basePath%>serchProjReqNum.do",
              success: function (msg) {
            	  var msgRes = JSON.parse(msg);  
            	  var htmld = "";
            	  $.each(msgRes.ProjReqNums,function(i,result){            		  
            		  htmld += "<input type=\"checkbox\"  name = \"myChoice\" value="+result+"><span>"+result+"</span><br>";
            	  });
            	  document.getElementById("choiceOption").innerHTML=htmld;
              },
				error : function(e) {
						sweetAlert("加载需求编号失败：", e, "error");
				}
		    });    	      	  
	  });
      
     //更新需求编号
     $("#updateProjReqNumSearch").click(function(){
    	  $("#projReqNumCheck").dialog("open");
    	  event.preventDefault();
    	  $("#choiceOption").empty();
    	  $("#selectedOption").empty();    	  
    	  $.ajax({
              type: "POST",
              url: "<%=basePath%>serchProjReqNum.do",
              success: function (msg) {
            	  var msgRes = JSON.parse(msg);  
            	  var htmld = "";
            	  $.each(msgRes.ProjReqNums,function(i,result){            		  
            		  htmld += "<input type=\"checkbox\"  name = \"myChoice\" value="+result+"><span>"+result+"</span><br>";
            	  });
            	  document.getElementById("choiceOption").innerHTML=htmld;
              },
				error : function(e) {
						sweetAlert("加载需求编号失败：", e, "error");
				}
		    });    	      	  
	  });
            
      //添加需求编号
      function addReqNum(){
    	  var obj = document.getElementsByName("myChoice");
    	  var htmld = "";
    	  for(k in obj){
    			if(obj[k].checked==true){     				
   					htmld += "<input type=\"checkbox\"  name =\"myselected\" value="+obj[k].value+"><span>"+obj[k].value+"</span><br>";     					
    			} 				 
    	  }
    	  document.getElementById("selectedOption").innerHTML=htmld;
      }
      //删除需求编号
      function deleteReqNum(){
    	  var obj = document.getElementsByName("myChoice");
    	  var obj2 = document.getElementsByName("myselected");    	  
    	  var htmld ="";
    	  for(k in obj2){
  			if(obj2[k].checked==false){
  				htmld += "<input type=\"checkbox\"  name = \"myselected\" value="+obj2[k].value+"><span>"+obj2[k].value+"</span><br>";
  			}else if(obj2[k].checked ==true){
  				for(i in obj){
  					if(obj[i].value==obj2[k].value){
  						obj[i].checked = false;
  					}
  				}
  			}
  		}
    	  document.getElementById("selectedOption").innerHTML=htmld;
      }
      
      $("#projReqNumCheck").dialog({
   	   autoOpen: false,
   	   width: 800,
   	   height: 650,
   	   buttons: [
   		 {
   			text: "确定",
   			click: function() {
   				    var obj = document.getElementsByName("myselected");
   				    var htmld = "";
   				    for(k in obj){
   				    	if(obj[k].type=="checkbox")
   	   						htmld += obj[k].value+";";				 
   	    	        }
   				    htmld = htmld.substring(0,htmld.length-1);
   	    	        document.getElementById("newProjReqNum").value = htmld;
   	    	        document.getElementById("updateProjReqNum").value = document.getElementById("updateProjReqNum").value+";"+htmld;   	    	     
				    $(this).dialog("close");
		    }
		}, {
				text : "重置",
				click : function() {
					   var obj = document.getElementsByName("myChoice");
					   for(k in obj){
				  			if(obj[k].checked==true){
				  				obj[k].checked = false; 				
				  			} 				 
				  		  }
					   $("#selectedOption").empty();					    					    					    
				}
		}, {
				text : "取消",
				click : function() {
						$(this).dialog("close");
				}
			} ]
	 });
     
      function delete_method(deleteProjID){ 
    	  swal({
    		  title:"提示",
              text:"您确定要删除该条项目吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
    	  },function(){
    		  $.ajax({
                  type: "POST",
                  url: "<%=basePath%>deleteProject.do?",
                  data:{
                	  deleteProjID : deleteProjID
                  },
                  success: function () {
                  	   window.location.href = "<%=basePath%>loadProjectBeforehand.do";
                  },
   				error : function(e) {
   						swal("OMG", "删除操作失败了!",  "error");
   				}
   		    });
    	  });    	   	
	  };
	  
	  function update_method(obj){
		  var tr = obj.parent().parent().children("td");
		  var projNumber = tr.eq(1).text();
		  var projID = tr.eq(14).text();
		  $(function(){
              $.ajax({
         	          type: "POST",
                    url : "<%=basePath%>searchProject.do",
                    data : { projNumber: projNumber },
                    success : function(msg) {
                 	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                 	       
                 	      document.getElementById("updateProjNumber").value = msgRes.projNumber;
                		  document.getElementById("updateProjReqNum").value = msgRes.projReqNum;
                		  document.getElementById("updateProjName").value = msgRes.projName;
                		  document.getElementById("updateProjStartDate").value = msgRes.projStartDate;
                		  document.getElementById("updateProjExpEndDate").value = msgRes.projExpEndDate;
                		  var projCurState = msgRes.projCurState;
                	 	  if(projCurState.trim()=="设计中"){
                			  document.getElementById("updateProjCurState")[1].selected = true;
                		  }else if(projCurState.trim()=="开发中"){
                			  document.getElementById("updateProjCurState")[2].selected = true;
                		  }else if(projCurState.trim()=="联调中"){
                			  document.getElementById("updateProjCurState")[3].selected = true;
                		  }else if(projCurState.trim()=="ST测试"){
                			  document.getElementById("updateProjCurState")[4].selected = true;
                		  }else if(projCurState.trim()=="UAT测试"){
                			  document.getElementById("updateProjCurState")[5].selected = true;
                		  }else if(projCurState.trim()=="已完成"){
                			  document.getElementById("updateProjCurState")[6].selected = true;
                		  }else if(projCurState.trim()=="等待上线"){
                			  document.getElementById("updateProjCurState")[7].selected = true;
                		  }else if(projCurState.trim()=="暂缓"){
                			  document.getElementById("updateProjCurState")[8].selected = true;
                		  }else if(projCurState.trim()=="预研中"){
                			  document.getElementById("updateProjCurState")[9].selected = true;
                		  }else if(projCurState.trim()=="已完成预研"){
                			  document.getElementById("updateProjCurState")[10].selected = true;
                		  } else {
                			  document.getElementById("updateProjCurState")[0].selected = true;
                		  }
                		  
                		  		  		  		  
                		  if(msgRes.projOrganizeType.trim()=="主办"){
                			  document.getElementById("updateProjOrganizeType")[1].selected = true;
                		  }else if(msgRes.projOrganizeType.trim()=="辅办"){
                			  document.getElementById("updateProjOrganizeType")[2].selected = true;
                		  }else{
                			  document.getElementById("updateProjOrganizeType")[0].selected = true;
                		  } 			
                		  document.getElementById("updateProjPerInCharge").value = msgRes.projPerInCharge;
                		  document.getElementById("updateProjCouBusiness").value = msgRes.projCouBusiness;
                		  document.getElementById("updateProjMember").value = msgRes.projMember;
                		  document.getElementById("updateProjRemark").value = msgRes.projRemark.replace(new RegExp("<br>","g"),'\n');             	                      		              	        	                    	      
                    },
                    error : function(e) {    
                 	      sweetAlert("初始化项目失败：", e, "error");
                    }
              });
          });
		  
    	  $("#dialogUpdate").dialog({
    	   	   autoOpen: true,
    	   	   width: 1050,
    	   	   height: 600,
    	   	   buttons: [
    	   		 {
    	   			text: "更新",
    	   			click: function() {
    	   	            var updateProjNumber = document.getElementById("updateProjNumber").value;   // 程序名   	   	         
    	   	            if(updateProjNumber.trim() == "") {
    	   	                sweetAlert("项目编号不能为空！");
    	   	                return;
    	   	            }
    	   	            if(updateProjNumber!=null&&updateProjNumber.trim()!=""&&(!(/(P|T){1}[0-9]{7}$/g).test(updateProjNumber.trim()))){
    	            	    sweetAlert("提示", "项目编号格式不正确！\n正确格式如：T1111111或P1111111", "warning");
    	            	    return;
    	                }
    	   	            var updateProjReqNum = document.getElementById("updateProjReqNum").value;   // 项目编号   	   	             
    	   	            if(updateProjReqNum.trim() == "") {
    	   	                sweetAlert("需求编号不能为空！");
    	   	                return;
    	   	            }
    	   	            var updateProjName = document.getElementById("updateProjName").value;   // 项目编号   	   	             
 	   	                if(updateProjName == "") {
 	   	                sweetAlert("项目名不能为空！");
 	   	                return;
 	   	                }
    	   	            
	 	   	            var updateProjStartDate = document.getElementById("updateProjStartDate").value;   // 立项时间
	    	            var updateProjExpEndDate = document.getElementById("updateProjExpEndDate").value;   // 计划结束时间
	    	            var updateProjCurState = document.getElementById("updateProjCurState").value;   // 状态
	    	            if(updateProjCurState == "") {
	    	                sweetAlert("请选择项目状态！");
	    	                return;
	    	            }
	    	            var updateProjOrganizeType = document.getElementById("updateProjOrganizeType").value;   //主辅办
	    	            var updateProjPerInCharge = document.getElementById("updateProjPerInCharge").value;   // 负责人
	    	            var updateProjCouBusiness = document.getElementById("updateProjCouBusiness").value;   // 对口业务
	    	            var updateProjMember = document.getElementById("updateProjMember").value;   // 备注
	    	            var updateProjRemark = document.getElementById("updateProjRemark").value.replace(/\n/g, '<br>');   // 备注
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>updateProject.do?",    	   	                	   	            
	    	   	            data:{
	    	   	            	updateProjNumber :  updateProjNumber, updateProjReqNum : updateProjReqNum,
	    	   	            	updateProjName :  updateProjName, updateProjStartDate :  updateProjStartDate,
	    	   	            	updateProjExpEndDate :  updateProjExpEndDate, updateProjCurState :  updateProjCurState,
	    	   	            	updateProjOrganizeType :  updateProjOrganizeType, updateProjPerInCharge :  updateProjPerInCharge,
	    	   	            	updateProjCouBusiness :  updateProjCouBusiness, updateProjMember :  updateProjMember,
	    	   	            	updateProjRemark :  updateProjRemark, projID :  projID
	    	   	            }, 	   	              	   	            
    	   	                success: function () {
    	   	                	   sweetAlert("更新项目信息成功！", "success");
    	   	                	   window.location.href = "<%=basePath%>loadProjectBeforehand.do";
    	                       },
    							error : function(e) {
    									sweetAlert("更新项目信息失败：", e, "error");
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
		  var projNumber = tr.eq(1).text();
		  var projReqNum = tr.eq(2).html();
		  var projName = tr.eq(3).text();
		  var projStartDate = tr.eq(4).text();
		  var projExpEndDate = tr.eq(5).text();
		  var projCurState = tr.eq(6).text();
		  var projOrganizeType = tr.eq(7).text();
		  var projPerInCharge = tr.eq(8).text();
		  var projCouBusiness = tr.eq(9).text();
		  var projRemark = tr.eq(10).html();
		  var projID = tr.eq(14).text();
		  var projMember = tr.eq(15).text();
		  document.getElementById("detailProjNumber").value = projNumber;
		  document.getElementById("detailProjReqNum").value = projReqNum.replace(new RegExp("<br>","g"),';');
		  document.getElementById("detailProjName").value = projName;
		  document.getElementById("detailProjStartDate").value = projStartDate;		  
		  document.getElementById("detailProjCurState").value = projCurState;
		  document.getElementById("detailProjOrganizeType").value = projOrganizeType;		  		  	  		  		 		  		
		  document.getElementById("detailProjPerInCharge").value = projPerInCharge;
		  document.getElementById("detailProjExpEndDate").value = projExpEndDate;
		  document.getElementById("detailProjCouBusiness").value = projCouBusiness;
		  document.getElementById("detailProjRemark").value = projRemark.replace(new RegExp("<br>","g"),'\n').replace(RegExp("&nbsp;","g"),' ').replace(RegExp("&amp;","g"),'&');
		  document.getElementById("detailProjMember").value = projMember;
    	  $("#projDetails").show();		  
    	  $("#projDetails").dialog({
    	   	   autoOpen: true,
    	   	   width: 1050,
    	   	   height: 550,
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