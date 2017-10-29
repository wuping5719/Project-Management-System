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
<title>程序冲突</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/program-conflict.css" rel="stylesheet" type="text/css" />

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
		    <label style="margin-left:2%; margin-top: 1%;">当前位置: 冲突程序 >未解决冲突程序</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">程序名：</label> 
					 <input id="conProName" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" /> 					  
					 <label style="margin-top: 0.5%; margin-left:1%;">项目编号：</label>					 
					 <input id="conProID" type="text"  style="width: 10%; height: 24px; margin-top: 0.5%;" />
					 <label style="margin-top: 0.5%; margin-left:1%;">项目名称：</label>
					 <input id="conProjName"  type="text" style="width: 12%; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%; margin-left:1%;">负责人：</label>
					 <input id="conPerInCharge" type="text" style="width: 10%; height: 24px; margin-top: 0.5%; margin-right:1%" /> 
					 <img id="consSearch" class="consSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newCon" type="button" class="btn btn-default btn-sm" style="background-color:#a6d2ff;margin-left:20px">新建冲突程序</button>
				</div>
                <table id="consTabHead">
					<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
						<td style="width: 1.5%">序号</td>
						<td style="width: 4.4%">程序名</td>
						<td style="width: 3.7%">项目编号</td>
						<td style="width: 11%">项目名称</td>
						<td style="width: 2%">负责人</td>
						<td style="display: none">ST开始时间</td>
						<td style="display: none">UAT开始时间</td>
						<td style="width: 4.2%">预计上线时间</td>
						<td style="width: 7%">解决方案</td>
						<td style="width: 1.8%">修改</td>
						<td style="width: 1.8%">详情</td>
						<td style="width: 1.8%">删除</td>
						<td style="display: none">主键ID</td>												
					</tr>
			    </table>
				<div id="consListTable">
					<table id="consTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 0px; ">
							<td style="width: 1.5%"></td>
							<td style="width: 4.4%"></td>
							<td style="width: 3.7%"></td>
							<td style="width: 11%"></td>
							<td style="width: 2%"></td>
							<td style="display: none"></td>
							<td style="display: none"></td>
							<td style="width: 4.2%"></td>
							<td style="width: 7%"></td>
							<td style="width: 1.8%"></td>
							<td style="width: 1.8%"></td>
							<td style="width: 1.8%"></td>
							<td style="display: none"></td>												
						</tr>
					</table>
                  </div>
                  <div>
					<table id="consPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="consFirst" class="consSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="consPrevious" class="consSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="consCenterBar" style="width: 60px;">
							      <input id="consCurPageNum" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>/</label> 
							      <input id="consTotalPage" style="width: 30px;text-align:center;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="consNext" class="consSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="consEnd" class="consSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="consCurNo" style="width: 40px;text-align:center;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="consJumpN" class="consSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
             url : "<%=basePath%>searchProgramConflicts.do?conProName=&conProID=&conProjName=&conPerInCharge=&conSolution=&conSTStaTime=&conUATStaTime=&conExOnlineDate=&pageNum=1",
             success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("consPage").rows[0].cells[1].innerHTML = "总计"+msgRes.consTotalNum+"条记录";
                 $("#consCurPageNum").attr("value", 1);       //设置备选属性的值，即设置consCurPageNum的值为1，也就是当前默认显示第一页
                 $("#consTotalPage").attr("value", msgRes.consTotalPage);
                 $("#consCurNo").attr("value", 1);

                 //清空table
                 var consTB = document.getElementById("consTab");
                 var rowNum = consTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 consTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var consItem; 
                 var Colorflag = 1;
                 var dispalyProNameFlag = 1;                
                 var myStr = "rowspan = ";
                 var name = "";
                 var index = 1;
                 var indexDisplay = index;
                 $.each(msgRes.conDTOsList,function(i,result){
                	 if(i==0){name = result.conProName;}
                	 if(result.conProName!=name){
                		 Colorflag = 1-Colorflag;
                		 name = result.conProName;
                		 dispalyProNameFlag = 1;
                		 index++;
                		 indexDisplay = index;
                	 }else{
                		 dispalyProNameFlag = 0;
                	 }
                	 myStr = "rowspan ="+"\""+result.nameCount+"\"";                	 
                	 if(i!=0&&!dispalyProNameFlag){
                		 myStr = "style =\"display:none\"";   
                		 indexDisplay = "";
                	 }          
                     if (Colorflag){                    	 
                    	 consItem = "<tr style=\"background-color:#e0ffff;\">\
				               <td " + myStr+">" + indexDisplay + "</td>\
				               <td " + myStr+">" + result.conProName + "</td>\
				               <td >" + result.conProID + "</td>\
				               <td >" + result.conProjName + "</td>\
				               <td >" + result.conPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.conSTStaTime + "</td>\
				               <td style=\"display:none\">" + result.conUATStaTime + "</td>\
				               <td >" + result.conExOnlineDate + "</td>\
				               <td " + myStr+">" + result.conSolution + "</td>\
				               <td " + myStr+"><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.conID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.conID + "</td></tr>";
                         $("#consTab").append(consItem);                  
                     }
                     else{
                    	 consItem = "<tr style=\"background-color:#f5f5f5\">\
                    		   <td " + myStr+">" + indexDisplay + "</td>\
				               <td " + myStr+">" + result.conProName + "</td>\
				               <td >" + result.conProID + "</td>\
				               <td >" + result.conProjName + "</td>\
				               <td >" + result.conPerInCharge + "</td>\
				               <td style=\"display:none\">" + result.conSTStaTime + "</td>\
				               <td style=\"display:none\">" + result.conUATStaTime + "</td>\
				               <td >" + result.conExOnlineDate + "</td>\
				               <td " + myStr+">" + result.conSolution + "</td>\
				               <td " + myStr+"><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.conID+")\">删除</a></td>\
				               <td style=\"display:none\">" + result.conID + "</td></tr>";
                       $("#consTab").append(consItem);
                     }
                 });
                 
                 
                 
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".consSkip").click(function(){
          var consCurPageNum = Number(document.getElementById("consCurPageNum").value);  //当前页码
          var consPageNum = 1;  // 将要跳转的页码
          var consTotalPage = Number(document.getElementById("consTotalPage").value);  //页码总数
          if (this.id == "consFirst") {   // 首页
        	  consPageNum = 1;
          } else if (this.id == "consPrevious") {  //上一页
                 if (consCurPageNum > 1 && consCurPageNum <= consTotalPage) {
                	 consPageNum = Number(consCurPageNum) - 1;
                 } else {
                	 consPageNum = 1;
                 }
          } else if (this.id == "consNext") { // 下一页
                 if (consCurPageNum < consTotalPage){
                	 consPageNum = Number(consCurPageNum) + 1;
                 }else {
                	 consPageNum = consTotalPage;
                 }
          } else if (this.id == "consEnd") {  // 末页
            	 consPageNum = consTotalPage;
          } else if (this.id == "consSearch") {  // 查询
            	 consPageNum = 1;
          } else if (this.id == "consJumpN") {
	        	 var consCurNo = document.getElementById("consCurNo").value;
	     	     if(consCurNo==""){
	     	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
	     	    	 return;
	     	     } 
	     	     if(!(/^\d+$/g).test(consCurNo.trim())){
	     	    	 sweetAlert("提示", "请输入正整数！", "warning");
	     	    	 return;
	     	     }
                 consCurNo = Number(document.getElementById("consCurNo").value.trim());
                 if (consCurNo > consTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 consPageNum = Number(consCurNo);
          }
             
             // 查询条件
             var conProName = document.getElementById("conProName").value;  
             var conProID = document.getElementById("conProID").value; 
             if(conProID!=null&&conProID.trim()!=""&&(!(/(P|T){1}[0-9]{7}$/g).test(conProID.trim()))){
	         	 sweetAlert("提示", "项目编号格式不正确！\n正确格式如：T1111111或P1111111", "warning");
	         	 return;
	         }
             var conProjName = document.getElementById("conProjName").value;  
             var conPerInCharge = document.getElementById("conPerInCharge").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchProgramConflicts.do?",
                 data:{
                	 conProName : conProName, conProID : conProID,
                	 conProjName : conProjName, conPerInCharge : conPerInCharge,
                     pageNum : consPageNum 
                 },
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("consPage").rows[0].cells[1].innerHTML = "总计"+msgRes.consTotalNum+"条记录";
                     $("#consCurPageNum").attr("value", consPageNum);
                     $("#consTotalPage").attr("value", msgRes.consTotalPage);
                     $("#consCurNo").attr("value", consPageNum);

                     // 清空 table
                     var consTB = document.getElementById("consTab");
                     var rowNum = consTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 consTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var consItem;
                     var Colorflag = 1;
                     var dispalyProNameFlag = 1;                
                     var myStr = "rowspan = ";
                     var name = "";
                     var index = 1;
                     var indexDisplay = index;
                     $.each(msgRes.conDTOsList,function(i,result){
                    	 if(i==0){name = result.conProName;}
                    	 if(result.conProName!=name){
                    		 Colorflag = 1-Colorflag;
                    		 name = result.conProName;
                    		 dispalyProNameFlag = 1;
                    		 index++;
                    		 indexDisplay = index;
                    	 }else{
                    		 dispalyProNameFlag = 0;
                    	 }
                    	 myStr = "rowspan ="+"\""+result.nameCount+"\"";                	 
                    	 if(i!=0&&!dispalyProNameFlag){
                    		 myStr = "style =\"display:none\"";   
                    		 indexDisplay = "";
                    	 }
                         if (Colorflag){
                        	 consItem = "<tr style=\"background-color:#e0ffff\">\
                        	   <td " + myStr+">" + indexDisplay + "</td>\
                        	   <td " + myStr+">" + result.conProName + "</td>\
  				               <td >" + result.conProID + "</td>\
  				               <td >" + result.conProjName + "</td>\
  				               <td >" + result.conPerInCharge + "</td>\
  				               <td style=\"display:none\">" + result.conSTStaTime + "</td>\
  				               <td style=\"display:none\">" + result.conUATStaTime + "</td>\
  				               <td >" + result.conExOnlineDate + "</td>\
  				               <td " + myStr+">" + result.conSolution + "</td>\
  				               <td " + myStr+"><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
  				               <td ><a href=\"#\" onclick=\"delete_method("+result.conID+")\">删除</a></td>\
  				               <td style=\"display:none\">" + result.conID + "</td></tr>";
                           $("#consTab").append(consItem);
                         }
                         else{
                        	 consItem = "<tr style=\"background-color:#f5f5f5\">\
                        	   <td " + myStr+">" + indexDisplay + "</td>\
                        	   <td " + myStr+">" + result.conProName + "</td>\
   				               <td >" + result.conProID + "</td>\
   				               <td >" + result.conProjName + "</td>\
   				               <td >" + result.conPerInCharge + "</td>\
   				               <td style=\"display:none\">" + result.conSTStaTime + "</td>\
   				               <td style=\"display:none\">" + result.conUATStaTime + "</td>\
   				               <td >" + result.conExOnlineDate + "</td>\
   				               <td " + myStr+">" + result.conSolution + "</td>\
   				               <td " + myStr+"><a href=\"#\" onclick=\"update_method($(this))\">修改</a></td>\
				               <td ><a href=\"#\" onclick=\"check_details($(this))\">详情</a></td>\
				               <td ><a href=\"#\" onclick=\"delete_method("+result.conID+")\">删除</a></td>\
  				               <td style=\"display:none\">" + result.conID + "</td></tr>";
                         $("#consTab").append(consItem);
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
               {"id":1, "pId":0, "name":"冲突程序", "url":"<%=basePath%>loadProgramConflict.do" ,"target":"_self"},               
               {"id":2, "pId":0, "name":"已解决冲突", "url":"<%=basePath%>loadProgramConflict.do" ,"target":"_self"}
     ];

      var tree = $("#treeMenu");  
      $(function() {   
          tree = $.fn.zTree.init(tree, setting, treeNodes); 
          tree.expandAll(true); 
      });  
	</script>

	<div id="dialog" title="新建冲突程序" style="display: none;">
		<div id="conInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
			    <table>
			      <tr>
			       <td>
					<label style="margin-top: 40px; margin-bottom: 10px; margin-left: 10px; color: #696969;">程序名<span style="color:red;">*</span>：</label> 
					<input id="newConProName" type="text" style="margin-top: 20px;margin-left: 37px; width: 295px" />
				   </td>
				   <td>
					<label style="margin-top: 40px; margin-bottom: 10px; margin-left: 70px; color: #696969;">项目编号<span style="color:red;">*</span>：</label> 					
					<input id="newConProID"  style="margin-top: 20px;margin-left: 22px;margin-right: 25px; width: 220px; height:28px" />
					<img class="projNumSearch" src="<%=basePath%>static/img/mySelect.png" />
				   </td>
				  </tr>
				  <tr>
				   <td colspan = "2">
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 10px; color: #696969;vertical-align: top;">解决方案：</label> 					
					<textarea id="newConSolution" rows = "3" style="margin-top: 20px;margin-left: 28px;margin-right: 22px; width: 698px" ></textarea>
					<img style = "margin-top:30px;vertical-align: top;" class="conAutoSolution" src="<%=basePath%>static/img/autoSolution.png" />
				   </td>
				  </tr>
			   </table>
			   <table style = "margin-top:20px;margin-button:0px;border: 0px dashed #617775;border-top-width:1px;width:100%">
			      <tr><td><div><label style = "margin-left:5px;border: 0px solid #617775;">项目详情查看：</label>
			              <select id="selectedConProID"  style="margin-top: 20px;margin-left: 4px;margin-right: 25px; width: 200px; height:28px" ></select>
					      <img class="projSearch" src="<%=basePath%>static/img/search.png" /></div>
			          <td>
			      </tr>			      
				  <tr>
			       <td colspan = "2">			        
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 12px;color: #696969;">项目名  ：</label> 
					<input id="newConProjName" type="text" style="margin-top: 20px;margin-left: 39px; width: 775px" disabled/>
				   </td>
				  </tr>
				  <tr>
				   <td>
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 12px; color: #696969;">负责人  ：</label> 				
					<input id="newConPerInCharge" type="text" style="margin-top: 20px;margin-left: 38px; width: 295px;" disabled/>	
				   </td>				  
			       <td>			
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 27px; color: #696969;">ST开始时间：</label> 
					<input id="newConSTStaTime" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;margin-left: 12px;height:30px; width: 295px" disabled/>
				   </td>
				  </tr>
				  <tr>
				   <td>
					<label style="margin-top: 30px; margin-bottom: 20px;margin-left: 10px; color: #696969;">UAT开始时间：</label> 
					<input id="newConUATStaTime" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;height:30px; width: 295px" disabled/>
				   </td>				  
			       <td>
					<label style="margin-top: 30px; margin-bottom: 20px; margin-left: 27px; color: #696969;">预计上线时间：</label> 
					<input id="newConExOnlineDate" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})" style="margin-top: 20px;height:30px; width: 295px;" disabled/>
				   </td>
				  </tr>				  
			   </table>
			</div>
		</div>
	</div>
	
	<div id="dialogUpdate" title="更新冲突程序" style="display: none;">
		<div id="conInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
				<table>
				  <tr>
				   <td>
					<label style="margin-top: 40px;margin-bottom: 10px; margin-left: 10px; color: #696969;">程序名：</label> 
					<input id="updateConProName" type="text" style="margin-top: 20px;margin-left: 44px; width: 295px" disabled/>
				   </td>
				   <td>				   
					<label style="margin-top: 40px;margin-bottom: 10px; margin-left: 70px; color: #696969;">项目编号：</label> 				
					<input id="updateConProID" type="text" style="margin-top: 20px;margin-left: 29px; width: 295px" disabled/>
				   </td>
				  </tr>	
				  <tr>
				   <td colspan = "2">
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;vertical-align: top;">解决方案：</label>  
					<textarea id="updateConSolution" rows = "3" style="margin-top: 20px;margin-left: 29px; width: 776px" ></textarea>					
				   </td>
				  </tr>
				</table>
				<table style = "margin-top:40px;margin-button:20px;border: 0px dashed #617775;border-top-width:1px;width:100%">
				  <tr><td colspan = "2"><div><label style = "margin-left:5px;margin-top:35px;">新增冲突项目：</label>
				          <input id="updateNewConProID"  style="margin-top: 20px;margin-left: 5px;margin-right: 25px; width: 680px; height:28px" />
					      <img class="projNumSearch" src="<%=basePath%>static/img/mySelect.png" /></div>
			          <td>
			      </tr>
			    </table>
			    <table style = "margin-top:40px;margin-button:20px;border: 0px dashed #617775;border-top-width:1px;width:100%">
			      <tr><td><label style = "margin-left:5px;border: 0px solid #617775;">新增项目详情查看：</label>
			           <select id="updateSelectedConProID"  style="margin-top: 20px;margin-left: 10px;margin-right: 25px; width: 200px; height:28px" ></select>
					  <img class="projSearch" src="<%=basePath%>static/img/search.png" /><td>
			      </tr>
				  <tr>
				   <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px;color: #696969;">项目名  ：</label> 
					<input id="updateConProjName" type="text" style="margin-top: 20px;margin-left: 37px; width: 778px" disabled/>
				   </td>
				  </tr>
				  <tr>
				   <td>
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">负责人  ：</label> 				
					<input id="updateConPerInCharge" type="text" style="margin-top: 20px;margin-left: 37px; width: 295px;" disabled/>	
				   </td>
				   <td>					   			
					<label style="margin-top: 20px; margin-bottom: 20px;margin-left: 10px; color: #696969;">ST开始时间：</label> 
					<input id="updateConSTStaTime" type="text" style="margin-top: 20px;margin-left: 12px;height:30px; width: 295px" disabled/>
				   </td>
				  </tr>	
				  <tr>
				   <td>	
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;">UAT开始时间：</label> 
					<input id="updateConUATStaTime" type="text"  style="margin-top: 20px;height:30px; width: 295px" disabled/>
				   </td>
				   <td>
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;">预计上线时间：</label>  
					<input id="updateConExOnlineDate" type="text" style="margin-top: 20px;height:30px; width: 295px;" disabled/>
				   </td>
				  </tr>				  
				</table>
			</div>
		</div>
	</div>
	
	<div id="dialogDetails" title="冲突项目详情" style="display: none;">
		<div id="conInfo" style="margin: 3px 2px; border: 1px solid #617775; background: #f5f5f5; width: 100%; height: 100%;">
			<div >
				<table>
				  <tr>
				   <td>
					<label style="margin-top: 40px;margin-bottom: 10px; margin-left: 10px; color: #696969;">程序名：</label> 
					<input id="detailConProName" type="text" style="margin-top: 20px;margin-left: 44px; width: 295px" disabled/>
				   </td>
				   <td>				   
					<label style="margin-top: 40px;margin-bottom: 10px; margin-left: 40px; color: #696969;">项目编号：</label> 				
					<input id="detailConProID" type="text" style="margin-top: 20px;margin-left: 29px; width: 295px" disabled/>
				   </td>
				  </tr>	
				  <tr>
				   <td colspan = "2">			
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px;color: #696969;">项目名  ：</label> 
					<input id="detailConProjName" type="text" style="margin-top: 20px;margin-left: 37px; width: 745px" disabled/>
				   </td>
				  </tr>
				  <tr>
				   <td>
					<label style="margin-top: 20px; margin-bottom: 10px; margin-left: 12px; color: #696969;">负责人  ：</label> 				
					<input id="detailConPerInCharge" type="text" style="margin-top: 20px;margin-left: 37px; width: 295px;" disabled/>	
				   </td>
				   <td>					   			
					<label style="margin-top: 20px; margin-bottom: 20px;margin-left: 40px; color: #696969;">ST开始时间：</label> 
					<input id="detailConSTStaTime" type="text" style="margin-top: 20px;margin-left: 12px;height:30px; width: 295px" disabled/>
				   </td>
				  </tr>	
				  <tr>
				   <td>	
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;">UAT开始时间：</label> 
					<input id="detailConUATStaTime" type="text"  style="margin-top: 20px;height:30px; width: 295px" disabled/>
				   </td>
				   <td>
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 40px; color: #696969;">预计上线时间：</label>  
					<input id="detailConExOnlineDate" type="text" style="margin-top: 20px;height:30px; width: 295px;" disabled/>
				   </td>
				  </tr>
				  <tr>
				   <td colspan = "2">
					<label style="margin-top: 20px; margin-bottom: 20px; margin-left: 10px; color: #696969;vertical-align: top;">解决方案：</label> 
					<textarea id="detailConSolution" rows = "3" style="margin-top: 20px;margin-left: 30px; width: 748px" disabled></textarea>	 				
				   </td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
	<div id="conProjNumCheck" title="选择项目编号" style="display: none;">
		<div id="conInfo" style="overflow-y:visible;margin: 3px 40px;background: #f5f5f5; width: 98%; height: 96%;">
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
	  //选择项目编号
      $(".projNumSearch").click(function(){
    	  $("#conProjNumCheck").dialog("open");
    	  event.preventDefault();
    	  $("#choiceOption").empty();
    	  $("#selectedOption").empty();    	  
    	  $.ajax({
              type: "POST",
              url: "<%=basePath%>serchConProjNumber.do",
              success: function (msg) {
            	  var msgRes = JSON.parse(msg);  
            	  var htmld = "";
            	  $.each(msgRes.conProjNumber,function(i,result){            		  
            		  htmld += "<input type=\"checkbox\" name=\"myChoice\" value="+result+"><span>"+result+"</span><br>";
            	  });
            	  document.getElementById("choiceOption").innerHTML=htmld;
              },
				error : function(e) {
						sweetAlert("加载项目编号失败：", e, "error");
				}
		    });    	      	  
	  });
    //添加项目编号
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
      //删除项目编号
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
      //
      $("#conProjNumCheck").dialog({
      	   autoOpen: false,
      	   width: 800,
      	   height: 650,
      	   buttons: [
      		 {
      			text: "确定",
      			click: function() {
      				   $("#selectedConProID").empty(); 
      				   $("#updateSelectedConProID").empty();      				 
	      	      	   $("#selectedConProID").append("<option value =\"\">------请选择------</option>");
	      	      	   $("#updateSelectedConProID").append("<option value =\"\">------请选择------</option>");
      				    var obj = document.getElementsByName("myselected");
      				    var htmld = "";
      				    for(k in obj){
      				    	if(obj[k].type=="checkbox"){
      				    		htmld += obj[k].value+";";	
      				    		$("#selectedConProID").append("<option value ="+obj[k].value+">"+obj[k].value+"</option>");
      				    		$("#updateSelectedConProID").append("<option value ="+obj[k].value+">"+obj[k].value+"</option>");
      				    	}     	   									 
      	    	        }
      				    htmld = htmld.substring(0,htmld.length-1);
      	    	        document.getElementById("newConProID").value = htmld;
      	    	        document.getElementById("updateNewConProID").value = htmld;         	    	        		      	    			      	      	
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
      
	  //根据选择的项目自动现充剩余项目信息
	  $(".projSearch").click(function(){
		  var conProID = document.getElementById("selectedConProID").value;
		  var updateNewConProID = document.getElementById("updateSelectedConProID").value;
		  if(conProID == ""){
			  conProID = updateNewConProID;
		  }
		  if(conProID == "") {
              sweetAlert("项目编号不能为空！");
              return;
          }
		  
		  $.ajax({
              type : "POST",
              url : "<%=basePath%>searchConProject.do?",
              data:{
            	  conProID : conProID
              },
              success : function(msg) {
                  var msgRes = JSON.parse(msg);//返回json对象
                  if(conProID == updateNewConProID){  
                	  document.getElementById("updateConProjName").value = msgRes.conProjName;
                	  document.getElementById("updateConPerInCharge").value = msgRes.conPerInCharge;
                	  document.getElementById("updateConSTStaTime").value = msgRes.conSTStaTime;
                	  document.getElementById("updateConUATStaTime").value = msgRes.conUATStaTime;
                	  document.getElementById("updateConExOnlineDate").value = msgRes.conExOnlineDate;
                  }else{
                	  document.getElementById("newConProjName").value = msgRes.conProjName;
                	  document.getElementById("newConPerInCharge").value = msgRes.conPerInCharge;
                	  document.getElementById("newConSTStaTime").value = msgRes.conSTStaTime;
                	  document.getElementById("newConUATStaTime").value = msgRes.conUATStaTime;
                	  document.getElementById("newConExOnlineDate").value = msgRes.conExOnlineDate;
                  }
              },
              error:function(e){
                  sweetAlert("数据库查询发生错误：", e, "error");
              }
          });  		  
	  });
	  //自动生成解决方案
	  $(".conAutoSolution").click(function(){   	  
    	  var conProjNumber = document.getElementById("newConProID").value;   // 项目编号
    	  if(conProjNumber == "") {
              sweetAlert("项目编号不能为空！");
              return;
          }
    	  $.ajax({
              type: "POST",
              url: "<%=basePath%>getAutoSolution.do?",
              data:{
            	  conProjNumber : conProjNumber  
              },
              success: function (msg) {
            	  var msgRes = JSON.parse(msg);  
            	  document.getElementById("newConSolution").value = msgRes.solution;
              },
				error : function(e) {
						sweetAlert("加载项目编号失败：", e, "error");
				}
		    });    	      	  
	  });
   
      $("#newCon").click(function(){
    	  $("#dialog").dialog("open");    	  
    	  event.preventDefault();
    	  document.getElementById("newConProID").value = "";
    	  document.getElementById("newConProjName").value = "";
    	  document.getElementById("newConPerInCharge").value = "";
    	  document.getElementById("newConSTStaTime").value = "";
    	  document.getElementById("newConUATStaTime").value = "";
    	  document.getElementById("newConExOnlineDate").value = "";
    	  document.getElementById("newConSolution").value = "";
    	  $("#selectedConProID").empty();   
    	  $("#selectedConProID").append("<option value =\"\">------请选择------</option>");
    	  
	  });
    
      $("#dialog").dialog({
    	   autoOpen: false,
    	   width: 1000,
    	   height: 600,
    	   buttons: [
    		 {
    			text: "创建",
    			click: function() {
    	            var newConProName = document.getElementById("newConProName").value;   // 程序名
    	            if(newConProName == "") {
    	                sweetAlert("程序名不能为空！");
    	                return;
    	            }
    	            var newConProID = document.getElementById("newConProID").value;   // 项目编号
    	            if(newConProID == "") {
    	                sweetAlert("项目编号不能为空！");
    	                return;
    	            } 
    	            var newConSolution = document.getElementById("newConSolution").value.replace(/\n/g, ';');   // 解决方案
    	            $.ajax({
    	                type: "POST",
    	                url: "<%=basePath%>createProgramConflict.do?",
    	                data:{
    	                	newConProName : newConProName, newConProID : newConProID,
    	                	newConSolution : newConSolution
    	                },
    	                success: function () {
    	                	   sweetAlert("创建冲突程序成功！", "success");
    	                	   window.location.href = "<%=basePath%>loadProgramConflict.do";
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
						document.getElementById("newConProName").value = "";
					    document.getElementById("newConProjName").value = "";					    
					    document.getElementById("newConPerInCharge").value = "";
					    document.getElementById("newConSTStaTime").value = "";
					    document.getElementById("newConUATStaTime").value = "";
					    document.getElementById("newConExOnlineDate").value = "";					    
					    document.getElementById("newConSolution").value = "";					   
					    document.getElementById("newConProID")[0].selected = true;

				}
			}, {
				text : "取消",
				click : function() {					    
						$(this).dialog("close");
				}
			} ]
	 });
      
      
      
      $("#newConProID").change(function(){
    	  $("#selectedConProID").empty();   
    	  $("#selectedConProID").append("<option value =\"\">------请选择------</option>");
    	  var selectedProjNum = document.getElementById("newConProID").value;	
    	  var result=selectedProjNum.split(';');
    	  for(var i=0;i<result.length;i++){
    		  $("#selectedConProID").append("<option value ="+result[i]+">"+result[i]+"</option>");    	 
    	  }
      });
      $("#updateNewConProID").change(function(){
    	  $("#updateSelectedConProID").empty();   
    	  $("#updateSelectedConProID").append("<option value =\"\">------请选择------</option>");
    	  var selectedProjNum = document.getElementById("updateNewConProID").value;	
    	  var result=selectedProjNum.split(';');
    	  for(var i=0;i<result.length;i++){
    		  $("#updateSelectedConProID").append("<option value ="+result[i]+">"+result[i]+"</option>");    	 
    	  }
      });
      
       
      function delete_method(deleteConID){  
    	  swal({
    		  title:"提示",
              text:"您确定要删除该条冲突程序吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
    	  },function(){
    		  $.ajax({
                  type: "POST",
                  url: "<%=basePath%>deleteProgramConflict.do?",
                  data:{
                	  deleteConID : deleteConID  
                  },
                  success: function () {
                  	   window.location.href = "<%=basePath%>loadProgramConflict.do";
                  },
   				error : function(e) {
   						swal("OMG", "删除操作失败了!",  "error");
   				}
   		    });
    	  });
	  };
	  
	  function update_method(obj){
		  var tr = obj.parent().parent().children("td");
		  var conProName = tr.eq(1).text().trim();
		  var conProID = tr.eq(2).text().trim();
		  var conSolution = tr.eq(8).html().trim();
		  var conID = tr.eq(12).text();
		  var nexttr = obj.parent().parent().next("tr");
		  while(nexttr.children("td").eq(1).text().trim()==conProName){
			  conProID =conProID+";"+nexttr.children("td").eq(2).text().trim();
			  nexttr = nexttr.next("tr");
		  }
		  document.getElementById("updateConProName").value = conProName;
		  document.getElementById("updateConProID").value = conProID;
		  document.getElementById("updateConSolution").value = conSolution.replace(new RegExp("<br>","g"),'\n').replace(RegExp("&amp;","g"),'&');	
		  
		  document.getElementById("updateConProjName").value = "";
		  document.getElementById("updateConPerInCharge").value = "";
		  document.getElementById("updateConSTStaTime").value = "";		  
		  document.getElementById("updateConUATStaTime").value = "";
		  document.getElementById("updateConExOnlineDate").value = "";

    	  $("#dialogUpdate").show();
    	  document.getElementById("updateNewConProID").value = "";	   	  
    	  $("#updateSelectedConProID").empty();      				 
	      $("#updateSelectedConProID").append("<option value =\"\">------请选择------</option>");
    	  $("#dialogUpdate").dialog({
    	   	   autoOpen: true,
    	   	   width: 1000,
    	   	   height: 680,
    	   	   buttons: [
    	   		 {
    	   			text: "更新",
    	   			click: function() {
    	   	            var updateConProName = document.getElementById("updateConProName").value;   // 程序名   	   	         
    	   	            if(updateConProName == "") {
    	   	                sweetAlert("程序名不能为空！");
    	   	                return;
    	   	            }
    	   	            var updateConProID = document.getElementById("updateConProID").value;   // 项目编号   	   	             
    	   	            if(updateConProID == "") {
    	   	                sweetAlert("项目编号不能为空！");
    	   	                return;
    	   	            }
    	   	            var updateNewConProID = document.getElementById("updateNewConProID").value;  //该程序下新添加的冲突项目    	   	  
    	   	            var updateConSolution = document.getElementById("updateConSolution").value.replace(/\n/g, '<br>');   // 解决方案   	
    	   	            $.ajax({
    	   	                type: "POST",
    	   	                url: "<%=basePath%>updateProgramConflict.do?",
    	   	                data:{
    	   	                	updateConProName : updateConProName, updateConProID : updateConProID,
    	   	                	updateConSolution : updateConSolution, updateNewConProID : updateNewConProID,
    	   	                	conID : conID
    	   	                },
    	   	                success: function () {
    	   	                	   sweetAlert("更新冲突程序成功！", "success");
    	   	                	   window.location.href = "<%=basePath%>loadProgramConflict.do";
    	                       },
    							error : function(e) {
    									sweetAlert("更新冲突程序失败：", e, "error");
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
		  var conProName = tr.eq(1).text();
		  var conProID = tr.eq(2).text();
		  var conProjName = tr.eq(3).text();
		  var conPerInCharge = tr.eq(4).text();
		  var conSTStaTime = tr.eq(5).text();
		  var conUATStaTime = tr.eq(6).text();
		  var conExOnlineDate = tr.eq(7).text();
		  var conSolution = tr.eq(8).html().trim();
		  var conID = tr.eq(12).text();
		  document.getElementById("detailConProName").value = conProName;
		  document.getElementById("detailConProID").value = conProID;
		  document.getElementById("detailConProjName").value = conProjName;
		  document.getElementById("detailConPerInCharge").value = conPerInCharge;
		  document.getElementById("detailConSTStaTime").value = conSTStaTime;
		  document.getElementById("detailConUATStaTime").value = conUATStaTime;
		  document.getElementById("detailConExOnlineDate").value = conExOnlineDate;
		  document.getElementById("detailConSolution").value = conSolution.replace(new RegExp("<br>","g"),'\n').replace(RegExp("&amp;","g"),'&');
    	  $("#dialogDetails").show();		  
    	  $("#dialogDetails").dialog({
    	   	   autoOpen: true,
    	   	   width: 1050,
    	   	   height: 510,
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