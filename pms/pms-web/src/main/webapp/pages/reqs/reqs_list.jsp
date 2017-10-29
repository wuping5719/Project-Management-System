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
<title>需求列表</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/reqs-layout.css" rel="stylesheet" type="text/css" />

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
						<a id="userName" href="#"><%=session.getAttribute("_name")%></a> 
						<a id="a_logout" href="<%=basePath%>logout.do" >注销</a>
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="menu"><ul id="treeMenu" class="ztree" ></ul></div>
			<div id="local">
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 需求管理->需求列表</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">需求编号：</label> 
					 <input id="reqNum" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">需求名称：</label>
					 <input id="reqName"  type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">负责人：</label>
					 <input id="reqPerInCharge" type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" />
					 <label style="margin-top: 0.5%; ">评估日期：</label>
					 <input id="assessmentDateStart"  type="text" class="Wdate" style="width: 110px; height: 24px; margin-top: 0.5%;"
					     onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true, maxDate:'#F{$dp.$D(\'assessmentDateEnd\')}'})" /> 
					 <label style="margin-top: 0.5%; ">~</label>
					 <input id="assessmentDateEnd" type="text" class="Wdate" style="width: 110px; height: 24px; margin-top: 0.5%;"
					       onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true, minDate:'#F{$dp.$D(\'assessmentDateStart\')}'})" /> 					 
					 <img id="reqsSearch" class="reqsSkip" src="<%=basePath%>static/img/search.png" /> 
					 <button id="newReq" type="button" class="btn btn-default btn-sm" >新建需求</button>
				</div>

				<div id="reqsListTable">
					<table id="reqsTab">
						<tr style="font-weight: bold; background-color: #e1ebf5; text-align: center; height: 40px; ">
							<td style="width: 50px">序号</td>
							<td style="width: 70px">需求评估日期</td>
							<td style="width: 60px">需求编号</td>
							<td style="width: 150px">需求名称</td>
							<td style="width: 60px">状态</td>
							<td style="width: 70px">计划启动日期</td>
							<td style="width: 100px">主要内容/评估结果</td>
							<td style="width: 60px">需求提交人</td>
						    <td style="width: 80px">业务部门</td>
						    <td style="width: 80px">备注</td>
						    <td style="width: 40px">查看</td>
							<td style="width: 40px">修改</td>
							<td style="width: 40px">删除</td>
							<td style="display: none">主键ID</td>
						</tr>
					</table>

					<table id="reqsPage">
						<tr style="height: 5px;">
							<td style="width: 20px;"></td>
							<td style="width: 50px;"></td>
							<td style="width: 40px;">
							      <img id="reqsFirst" class="reqsSkip" src="<%=basePath%>static/img/first.png" />
							</td>
							<td style="width: 40px;">
							      <img id="reqsPrevious" class="reqsSkip" src="<%=basePath%>static/img/left.png" />
							</td>
							<td id="reqsCenterBar" style="width: 60px;">
							      <input id="reqsCurPageNum" style="width: 30px; background-color: #eee; " readonly="readonly" />
							      <label>/</label> 
							      <input id="reqsTotalPage" style="width: 30px; background-color: #eee;" readonly="readonly" />
							      <label>页</label>
							</td>
							<td style="width: 40px;">
							      <img id="reqsNext" class="reqsSkip" src="<%=basePath%>static/img/right.png" />
							 </td>
							<td style="width: 40px;">
							      <img id="reqsEnd" class="reqsSkip" src="<%=basePath%>static/img/end.png" />
							</td>
							<td style="width: 60px;">
							     <label>跳转到</label> 
							     <input id="reqsCurNo" style="width: 40px;" type="text" /> 
							     <label>页</label>
							</td>
							<td style="width: 40px;">
							     <img id="reqsJumpN" class="reqsSkip" src="<%=basePath%>static/img/sureBtn.png" />
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
    	 // 异步加载需求列表
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchReqs.do",
             data : { 
            	  reqNum : null,
            	  reqName : null,
            	  reqPerInCharge : null,
            	  assessmentDateStart : null,
                  assessmentDateEnd : null,
                  pageNum : 1
        	 }, 
            success : function(msg) {
                 var msgRes = JSON.parse(msg);   //返回json对象
                 //更新记录总数
                 document.getElementById("reqsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.reqsTotalNum+"条记录";
                 $("#reqsCurPageNum").attr("value", 1);
                 $("#reqsTotalPage").attr("value", msgRes.reqsTotalPage);
                 $("#reqsCurNo").attr("value", 1);

                 // 清空 table
                 var reqsTB = document.getElementById("reqsTab");
                 var rowNum = reqsTB.rows.length;
                 for (var i=1; i<rowNum; i++){
                	 reqsTB.deleteRow(i);
                     rowNum = rowNum-1;
                     i = i-1;
                 }

                 //插入行数据
                 var reqsItem;
                 $.each(msgRes.reqDTOsList,function(i, result){
                    	 reqsItem = "<tr style=\"background-color:"+ result.backgroundColor +"\">\
                    	          <td >" + result.sortIndex + "</td>\
				                  <td >" + result.reqAssessmentDate + "</td>\
				                  <td >" + result.reqNum + "</td>\
				                  <td >" + result.reqName + "</td>\
				                  <td >" + result.reqState + "</td>\
				                  <td >" + result.reqScheduleStartDate + "</td>\
				                  <td >" + result.reqContent + "</td>\
				                  <td >" + result.reqAuthor + "</td>\
				                  <td >" + result.reqBusDepart + "</td>\
				                  <td >" + result.reqComment + "</td>\
				                  <td ><a href=\"#\" onclick=\"viewReq("+ result.reqID +")  \">\
		                               <font>查看</font></a></td>\
				                  <td ><a href=\"#\" onclick=\"updateReq("+ result.reqID +")  \">修改</a></td>\
				                  <td ><a href=\"#\" onclick=\"deleteReq("+ result.reqID +",'"+ result.reqNum +"')  \">\
        		                       <font>删除</font></a></td>\
				                  <td style=\"display:none\">"+ result.reqID +"</td></tr>";
                       $("#reqsTab").append(reqsItem);
                 });
             },
             error:function(e){
                 sweetAlert("网页发生错误：", e, "error");
             }
        });
	 });
	 
     /*首页、下一页、上一页、末页按钮*/
     $(".reqsSkip").click(function(){
          var reqsCurPageNum = Number(document.getElementById("reqsCurPageNum").value);  //当前页码
          var reqsPageNum = 1;  // 将要跳转的页码
          var reqsTotalPage = Number(document.getElementById("reqsTotalPage").value);  //页码总数
          if (this.id == "reqsFirst") {   // 首页
        	  reqsPageNum = 1;
          } else if (this.id == "reqsPrevious") {  //上一页
                 if (reqsCurPageNum > 1 && reqsCurPageNum <= reqsTotalPage) {
                	 reqsPageNum = Number(reqsCurPageNum) - 1;
                 } else {
                	 reqsPageNum = 1;
                 }
             } else if (this.id == "reqsNext") { // 下一页
                 if (reqsCurPageNum < reqsTotalPage){
                	 reqsPageNum = Number(reqsCurPageNum) + 1;
                 }else {
                	 reqsPageNum = reqsTotalPage;
                 }
             } else if (this.id == "reqsEnd") {  // 末页
            	 reqsPageNum = reqsTotalPage;
             } else if (this.id == "reqsSearch") {  // 查询
            	 reqsPageNum = 1;
             } else if (this.id == "reqsJumpN") {
                 var reqsCurNo = Number(document.getElementById("reqsCurNo").value);
                 if(reqsCurNo == ""){
        	    	 sweetAlert("提示", "跳转页不能为空！", "warning");
        	    	 return;
        	     } 
        	     if(!(/^\d+$/g).test(reqsCurNo)){
        	    	 sweetAlert("提示", "请输入正整数！", "warning");
        	    	 return;
        	     }
                 if (reqsCurNo > reqsTotalPage) {
                     sweetAlert("提示", "所选页号超过总页数！", "warning");
                     return;
                 }
                 reqsPageNum = Number(reqsCurNo);
             }
             
             // 查询条件
             var reqNum = document.getElementById("reqNum").value;   
             if(reqNum != null && reqNum.trim() != "" && (!(/R{1}[0-9]{6}$/g).test(reqNum.trim()))){
            	 sweetAlert("提示", "需求编号格式不正确！\n 正确格式如：R171525", "warning");
            	 return;
             }
             var reqName = document.getElementById("reqName").value;  
             var reqPerInCharge = document.getElementById("reqPerInCharge").value;  
             var assessmentDateStart = document.getElementById("assessmentDateStart").value;  
             var assessmentDateEnd = document.getElementById("assessmentDateEnd").value;  
             
             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchReqs.do",
                 data : { 
                      reqNum : reqNum,
                      reqName : reqName,
                      reqPerInCharge : reqPerInCharge,
                      assessmentDateStart : assessmentDateStart,
                      assessmentDateEnd : assessmentDateEnd,
                      pageNum : reqsPageNum
                 }, 
                 success : function(msg) {
                     var msgRes = JSON.parse(msg);//返回json对象
                     //更新记录总数
                     document.getElementById("reqsPage").rows[0].cells[1].innerHTML = "总计"+msgRes.reqsTotalNum+"条记录";
                     $("#reqsCurPageNum").attr("value", reqsPageNum);
                     $("#reqsTotalPage").attr("value", msgRes.reqsTotalPage);
                     $("#reqsCurNo").attr("value", reqsPageNum);

                     // 清空 table
                     var reqsTB = document.getElementById("reqsTab");
                     var rowNum = reqsTB.rows.length;
                     for (var i=1; i<rowNum; i++){
                    	 reqsTB.deleteRow(i);
                         rowNum = rowNum-1;
                         i = i-1;
                     }

                     // 插入行数据
                     var reqsItem;
                     $.each(msgRes.reqDTOsList,function(i, result){
                    	 reqsItem = "<tr style=\"background-color: "+ result.backgroundColor +"\">\
                   	              <td >" + result.sortIndex + "</td>\
				                  <td >" + result.reqAssessmentDate + "</td>\
				                  <td >" + result.reqNum + "</td>\
				                  <td >" + result.reqName + "</td>\
				                  <td >" + result.reqState + "</td>\
				                  <td >" + result.reqScheduleStartDate + "</td>\
				                  <td >" + result.reqContent + "</td>\
				                  <td >" + result.reqAuthor + "</td>\
				                  <td >" + result.reqBusDepart + "</td>\
				                  <td >" + result.reqComment + "</td>\
				                  <td ><a href=\"#\" onclick=\"viewReq("+ result.reqID +")  \">\
		                                <font>查看</font></a></td>\
				                  <td ><a href=\"#\" onclick=\"updateReq("+ result.reqID +")  \">修改</a></td>\
				                  <td ><a href=\"#\" onclick=\"deleteReq("+ result.reqID +",'"+ result.reqNum +"')  \">\
       		                           <font>删除</font></a></td>\
				                 <td style=\"display:none\">"+ result.reqID +"</td></tr>";
                        $("#reqsTab").append(reqsItem);
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
               {"id":1, "pId":0, "name":"需求管理", "url":"<%=basePath%>loadReqsList.do","target":"_self"},
               {"id":11, "pId":1, "name":"预研需求", "url":"<%=basePath%>loadPreResearchReqs.do","target":"_self"},
               {"id":12, "pId":1, "name":"意向性需求", "url":"<%=basePath%>loadIntentionalityReqs.do","target":"_self"},
               {"id":13, "pId":1, "name":"待完善需求", "url":"<%=basePath%>loadWaitPerfectReqs.do","target":"_self"},
               {"id":14, "pId":1, "name":"评估中需求", "url":"<%=basePath%>loadEstimatingReqs.do","target":"_self"},
               {"id":15, "pId":1, "name":"排期开发需求", "url":"<%=basePath%>loadSchedulDevReqs.do","target":"_self"},
               {"id":16, "pId":1, "name":"暂缓需求", "url":"<%=basePath%>loadDeferReqs.do","target":"_self"},
               {"id":17, "pId":1, "name":"开发中需求", "url":"<%=basePath%>loadDevelopingReqs.do","target":"_self"},
               {"id":18, "pId":1, "name":"已上线需求", "url":"<%=basePath%>loadOnLinedReqs.do","target":"_self"}
     ];

      var tree = $("#treeMenu");  
      $(function() {   
          tree = $.fn.zTree.init(tree, setting, treeNodes); 
          tree.expandAll(true); 
      });  
      
      function deleteReq(reqID, reqNum) {
          swal({
              title:"提示",
              text:"您确定要删除该条需求吗？",
              type:"warning",
              showConfirmButton:"true",
              showCancelButton:"true",
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              animation:"slide-from-top"
          }, function() {
              $.ajax({
                   type : "POST",
                   url : "<%=basePath%>deleteReq.do",
                   data : { reqID : reqID, reqNum : reqNum }, 	   
              }).done(function(msg) {
            	  if (msg == "1") {
            		  alert("该条需求已关联项目, 无法删除!");
            	  } else {
            		  window.location.href = "<%=basePath%>loadReqsList.do";
            	  } 
              }).error(function() {
            	  alert("OMG, 删除操作失败了!");
              });
          });
      }
	</script>

	<div id="dialog" style="display: none;">
		<div id="ReqInfo" style="margin: 5px 2px; border: 1px solid #617775; background: #f5f5f5; width: 98%; height: 96%;">
			<div >
				<label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">需求编号*：</label> 
				<input id="newReqNum" type="text" style="margin-top: 30px; width: 225px" />
			    <label style="margin-top: 30px; margin-left: 53px; color: #ff0000;">状态*：</label> 
			    <select id="newReqState" style="margin-top:30px; height:30px; width:225px;">
                     <option id="newReqState_Op1">预研</option>
                     <option id="newReqState_Op2">意向性</option>
                     <option id="newReqState_Op3">待完善</option>
                     <option id="newReqState_Op4">评估中</option>
                     <option id="newReqState_Op5">排期开发</option>
                     <option id="newReqState_Op6">暂缓</option>
                     <option id="newReqState_Op7">开发中</option>
                     <option id="newReqState_Op8">已上线</option>
                </select>
                <label style="margin-top: 30px; margin-left: 20px; color: #ff0000;">需求名称*：</label> 
				<input id="newReqName" type="text" style="margin-top: 30px; width: 568px" />
                <label style="margin-top: 30px; margin-left: 15px; color: #ff0000;">需求评估日期*：</label> 
				<input id="newReqAssessmentDate" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})"
			                              style="margin-top:30px; height:30px; width:200px;"></input>
			    <label style="margin-top: 30px; margin-left: 20px; ">计划启动日期：</label> 
				<input id="newReqScheduleStartDate" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})"
			                              style="margin-top:30px; height:30px; width:200px;"></input>
                <label style="margin-top: 30px; margin-left: 60px; ">排期：</label> 
				<input id="newReqScheduleDate" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})"
			                              style="margin-top:30px; height:30px; width:225px;"></input>
			    <label style="margin-top: 30px; margin-left: 30px; ">立项时间：</label> 
				<input id="newReqStartDate" type="text" class="Wdate"  onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd', readOnly:true})"
			                              style="margin-top:30px; height:30px; width:220px;"></input>
                <label style="margin-top: 30px; margin-left: 55px; ">主/辅办：</label> 
			    <select id="newReqOrganizeType" style="margin-top:30px; height:30px; width:210px;">
                     <option id="newReqOrganizeType_Z">主办</option>
                     <option id="newReqOrganizeType_F">辅办</option>
                </select>
                <label style="margin-top: 30px; margin-left: 40px; ">优先级：</label> 
			    <select id="newReqPriority" style="margin-top:30px; height:30px; width:225px;">
                     <option id="newReqPriority_A">A</option>
                     <option id="newReqPriority_B">B</option>
                     <option id="newReqPriority_C">C</option>
                </select>
                <label style="margin-top: 30px; margin-left: 25px; ">主要内容：</label> 
			    <input id="newReqContent" type="text" style="margin-top: 30px; width: 570px" />
                <label style="margin-top: 30px; margin-left: 35px; color: #ff0000;">负责人*：</label> 
			    <input id="newReqPerInCharge" type="text" style="margin-top: 30px; width: 225px" />
			    <label style="margin-top: 30px; margin-left: 28px; ">其他成员：</label> 
			    <input id="newReqMember" type="text" style="margin-top: 30px; width: 225px" />
			    <label style="margin-top: 30px; margin-left: 28px; ">评估意见：</label> 
			    <input id="newReqAssessment" type="text" style="margin-top: 30px; width: 225px" />
			    <label style="margin-top: 30px; margin-left: 20px;">需求提交人：</label> 
			    <input id="newReqAuthor" type="text" style="margin-top: 30px; width: 215px" />
			    <label style="margin-top: 30px; margin-left: 25px;">业务部门：</label> 
			    <input id="newReqBusDepart" type="text" style="margin-top: 30px; width: 225px" />
			    <label style="margin-top: 30px; margin-left: 50px; ">备注：</label> 
			    <input id="newReqComment" type="text" style="margin-top: 30px; width: 236px" />
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#newReq").click(function() {
	       // 清空缓存
	      $("#newReqNum").attr("value", "");
	      $("#newReqNum").attr("readonly", false);
	      $("#newReqName").attr("value", "");
	      $("#newReqName").attr("readonly", false);
	      
	      var rss = document.getElementById("newReqState");
  	      rss.options[rss.selectedIndex].removeAttribute("selected");
	      $("#newReqState_Op1").attr("selected", "selected");
	      $("#newReqState").attr("disabled", false);
	      
	      $("#newReqAssessmentDate").attr("value", "");
	      $("#newReqAssessmentDate").attr("disabled", false);
	      $("#newReqScheduleStartDate").attr("value", "");
	      $("#newReqScheduleStartDate").attr("disabled", false);
	      $("#newReqScheduleDate").attr("value", "");
	      $("#newReqScheduleDate").attr("disabled", false);
	      $("#newReqStartDate").attr("value", "");
	      $("#newReqStartDate").attr("disabled", false);
	      
	      var rots = document.getElementById("newReqOrganizeType");
  	      rots.options[rots.selectedIndex].removeAttribute("selected");
	      $("#newReqOrganizeType_Z").attr("selected", "selected");
	      $("#newReqOrganizeType").attr("disabled", false);
	      
	      var rps = document.getElementById("newReqPriority");
  	      rps.options[rps.selectedIndex].removeAttribute("selected");
	      $("#newReqPriority_A").attr("selected", "selected");
	      $("#newReqPriority").attr("disabled", false);
	      
	      $("#newReqContent").attr("value", "");
	      $("#newReqContent").attr("readonly", false);
	      $("#newReqPerInCharge").attr("value", "");
	      $("#newReqPerInCharge").attr("readonly", false);
	      $("#newReqMember").attr("value", "");
	      $("#newReqMember").attr("readonly", false);
	      $("#newReqAssessment").attr("value", "");
	      $("#newReqAssessment").attr("readonly", false);
	      $("#newReqAuthor").attr("value", "");
	      $("#newReqAuthor").attr("readonly", false);
	      $("#newReqBusDepart").attr("value", "");
	      $("#newReqBusDepart").attr("readonly", false);
	      $("#newReqComment").attr("value", "");
	      $("#newReqComment").attr("readonly", false);
	      
	      newReqDialog();
	      event.preventDefault();
	  });
	
	 function newReqDialog() {
		 $("#dialog").dialog({
			   autoOpen: true,
	    	   title: "新建需求",
	    	   width: 800,
	    	   height: 700,
	    	   buttons: [
	    		 {
	    			text: "创建",
	    			click: function() {
	    	            var newReqNum = document.getElementById("newReqNum").value;   // 需求编号
	    	            if(newReqNum == "") {
	    	                sweetAlert("提示", "需求编号不能为空！", "warning");
	    	                return;
	    	            } else if (newReqNum != null && (!(/(R){1}[0-9]{6}$/g).test(newReqNum.trim()))){
	    	            	 sweetAlert("提示", "需求编号格式不正确！\n 正确格式如：R171525", "warning");
	    	            	 return;
	    	            }
	    	            // 需求编号判重校验
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>isHasReq.do",
	    	                data : { newReqNum : newReqNum },
	    	                success: function (msg) {
	    	                	   if (msg == "1") {
	    	                		   sweetAlert("提示", "该需求编号已被暂用，请重新输入！", "warning");
	    	                		   return;
	    	                	   } else {
	    	                		    var newReqName = document.getElementById("newReqName").value;   // 需求名称
	    	   	    	                if(newReqName == "") {
	    	   	    	                     sweetAlert("提示","需求名称不能为空！", "warning");
	    	   	    	                     return;
	    	   	    	                }
	    	   	    	                var newReqState = document.getElementById("newReqState").value;    // 状态
	    	   	    	                if(newReqState == "") {
	    	   	    	                     sweetAlert("提示", "状态不能为空！", "warning");
	    	   	    	                     return;
	    	   	    	                }
	    	   	    	                var newReqAssessmentDate = document.getElementById("newReqAssessmentDate").value;   // 需求评估日期
	    	   	    	                if(newReqAssessmentDate == "") {
	    	   	    	                     sweetAlert("提示", "需求评估日期不能为空！", "warning");
	    	   	    	                     return;
	    	   	    	                }
	    	   	    	                var newReqScheduleStartDate = document.getElementById("newReqScheduleStartDate").value;   // 计划启动日期
	    	   	    	                var newReqScheduleDate = document.getElementById("newReqScheduleDate").value;   // 排期
	    	   	    	                var newReqStartDate = document.getElementById("newReqStartDate").value;   // 立项时间
	    	   	    	                var newReqOrganizeType = document.getElementById("newReqOrganizeType").value;   // 立项时间
	    	   	    	                var newReqPriority = document.getElementById("newReqPriority").value;   // 优先级
	    	   	    	                var newReqContent = document.getElementById("newReqContent").value;   // 主要内容
	    	   	    	                var newReqPerInCharge = document.getElementById("newReqPerInCharge").value;   // 负责人
	    	   	    	                if (newReqPerInCharge == "") {
	    	   	    	                    sweetAlert("提示", "负责人不能为空！", "warning");
	    	   	    	                    return;
	    	   	    	                }
	    	   	    	                var newReqMember = document.getElementById("newReqMember").value;   // 其他成员
	    	   	    	                var newReqAssessment = document.getElementById("newReqAssessment").value;   // 评估意见
	    	   	    	                var newReqAuthor = document.getElementById("newReqAuthor").value;   // 需求提交人
	    	   	    	                var newReqBusDepart = document.getElementById("newReqBusDepart").value;  // 业务部门
	    	   	    	                var newReqComment = document.getElementById("newReqComment").value;  // 备注
	    	   	    	            
	    	   	    	                $.ajax({
	    	   	    	                    type: "POST",
	    	   	    	                    url: "<%=basePath%>createReq.do",
	    	   	    	                    data : { 
	    	   	    	                	    newReqNum : newReqNum, newReqName : newReqName,
	    	   	    	                	    newReqState : newReqState, newReqAssessmentDate : newReqAssessmentDate,
	    	   	    	                	    newReqScheduleStartDate : newReqScheduleStartDate, newReqScheduleDate : newReqScheduleDate,
	    	   	    	                	    newReqStartDate : newReqStartDate, newReqOrganizeType : newReqOrganizeType,
	    	   	    	                	    newReqPriority : newReqPriority, newReqContent : newReqContent,
	    	   	    	                	    newReqPerInCharge : newReqPerInCharge, newReqMember : newReqMember,
	    	   	    	                	    newReqAssessment : newReqAssessment, newReqAuthor : newReqAuthor,
	    	   	    		      	            newReqBusDepart : newReqBusDepart, newReqComment : newReqComment
	    	   	    		      	       },
	    	   	    	                   success: function () {
	    	   	    	                	   sweetAlert("提示", "创建需求成功！", "success");
	    	   	    	                	   window.location.href = "<%=basePath%>loadReqsList.do";
	    	   	                           },
	    	   							   error : function(e) {
	    	   									sweetAlert("创建需求失败：", e, "error");
	    	   							   }
	    	   					        });
	    	                	   }
	                        },
							error : function(e) {
									sweetAlert("校验需求编号失败：", e, "error");
									return;
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
     
	 function updateReq(reqID) {
		 updateReqDialog(reqID);
   	     event.preventDefault();
     }
	 
	 function updateReqDialog(reqID) {
   	      $(function(){
                $.ajax({
           	          type: "POST",
                      url : "<%=basePath%>getReqByID.do",
                      data : { reqID: reqID },
                      success : function(msg) {
                   	       var msgRes = JSON.parse(msg); //返回 JSON 对象
                   	       $("#newReqNum").attr("value", msgRes.reqNum);
                   	       $("#newReqNum").attr("readonly", true);
                   	       $("#newReqName").attr("value", msgRes.reqName);
                   	       $("#newReqName").attr("readonly", false);
                   	       
                	       var rss = document.getElementById("newReqState");
             	           rss.options[rss.selectedIndex].removeAttribute("selected");
                	       if (msgRes.reqState == '01') {
             	    	        $("#newReqState_Op1").attr("selected", "selected");
             	           } else if (msgRes.reqState== '02') {
             	        	    $("#newReqNum").attr("readonly", false);
             	    	        $("#newReqState_Op2").attr("selected", "selected");
             	           } else if (msgRes.reqState== '03') {
             	    	        $("#newReqState_Op3").attr("selected", "selected");
             	           } else if (msgRes.reqState== '04') {
             	    	        $("#newReqState_Op4").attr("selected", "selected");
             	           } else if (msgRes.reqState== '05') {
             	    	        $("#newReqState_Op5").attr("selected", "selected");
             	           } else if (msgRes.reqState== '06') {
             	    	        $("#newReqState_Op6").attr("selected", "selected");
             	           } else if (msgRes.reqState== '07') {
             	    	        $("#newReqState_Op7").attr("selected", "selected");
             	           } else if (msgRes.reqState== '08') {
             	    	        $("#newReqState_Op8").attr("selected", "selected");
             	           }
                	       $("#newReqState").attr("disabled", false);
                	       
                	      $("#newReqAssessmentDate").attr("value", msgRes.reqAssessmentDate);
                	      $("#newReqAssessmentDate").attr("disabled", false);
           	              $("#newReqScheduleStartDate").attr("value", msgRes.reqScheduleStartDate);
           	              $("#newReqScheduleStartDate").attr("disabled", false);
           	              $("#newReqScheduleDate").attr("value", msgRes.reqScheduleDate);
           	              $("#newReqScheduleDate").attr("disabled", false);
           	              $("#newReqStartDate").attr("value", msgRes.reqStartDate);
           	              $("#newReqStartDate").attr("disabled", false);
           	      
           	               var rots = document.getElementById("newReqOrganizeType")
             	           rots.options[rots.selectedIndex].removeAttribute("selected");
           	               if (msgRes.reqOrganizeType == '2') {
           	        	       $("#newReqOrganizeType_F").attr("selected", "selected");
             	           } else {
             	    	       $("#newReqOrganizeType_Z").attr("selected", "selected");
             	           }
           	               $("#newReqOrganizeType").attr("disabled", false);
           	            
                	        var rps = document.getElementById("newReqPriority");
                	        rps.options[rps.selectedIndex].removeAttribute("selected");
                	        if (msgRes.reqPriority == 'B') {
                	    	     $("#newReqPriority_B").attr("selected", "selected");
                	        } else if (msgRes.reqPriority == 'C') {
                	    	     $("#newReqPriority_C").attr("selected", "selected");
                	        } else {
                	    	     $("#newReqPriority_A").attr("selected", "selected");
                	        }
                	       $("#newReqPriority").attr("disabled", false);
                	        
           	               $("#newReqAssessment").attr("value", msgRes.reqAssessment);
           	               $("#newReqAssessment").attr("readonly", false);
           	               $("#newReqAuthor").attr("value", msgRes.reqAuthor);
           	               $("#newReqAuthor").attr("readonly", false);
                	       $("#newReqContent").attr("value", msgRes.reqContent);
                	       $("#newReqContent").attr("readonly", false);
                	       $("#newReqPerInCharge").attr("value", msgRes.reqPerInCharge);
                	       $("#newReqPerInCharge").attr("readonly", false);
                	       $("#newReqMember").attr("value", msgRes.reqMember);
                	       $("#newReqMember").attr("readonly", false);
                	       $("#newReqBusDepart").attr("value", msgRes.reqBusDepart);
                	       $("#newReqBusDepart").attr("readonly", false);
                	       $("#newReqComment").attr("value", msgRes.reqComment);
                	       $("#newReqComment").attr("readonly", false);
                      },
                      error : function(e) {    
                   	      sweetAlert("初始化需求失败：", e, "error");
                      }
                });
         });
   	  
	     $("#dialog").dialog({
	    	   title: "修改需求",
	    	   autoOpen: true,
	    	   width: 800,
	    	   height: 700,
	      	   buttons: [
	      		 {
	      			text: "更新",
	      			click: function() {
	      				var newReqNum = document.getElementById("newReqNum").value;   // 需求编号
	    	            if(newReqNum == "") {
	    	                sweetAlert("提示", "需求编号不能为空！", "warning");
	    	                return;
	    	            } else if (newReqNum != null && (!(/(R){1}[0-9]{6}$/g).test(newReqNum.trim()))){
	    	            	 sweetAlert("提示", "需求编号格式不正确！\n 正确格式如：R171525", "warning");
	    	            	 return;
	    	            }
	    	            // 需求编号判重校验
	    	            $.ajax({
	    	                type: "POST",
	    	                url: "<%=basePath%>isHasReq.do",
	    	                data : { newReqNum : newReqNum },
	    	                success: function (msg) {
	    	                	   if (msg == "1") {
	    	                		   sweetAlert("提示", "该需求编号已被暂用，请重新输入！", "warning");
	    	                		   return;
	    	                	   } else {
	    	                		   var newReqName = document.getElementById("newReqName").value;   // 需求名称
	    	   	    	               if(newReqName == "") {
	    	   	    	                   sweetAlert("提示","需求名称不能为空！", "warning");
	    	   	    	                   return;
	    	   	    	               }
	    	   	    	               var newReqState = document.getElementById("newReqState").value;    // 状态
	    	   	    	               if(newReqState == "") {
	    	   	    	                   sweetAlert("提示", "状态不能为空！", "warning");
	    	   	    	                   return;
	    	   	    	               }
	    	   	    	               var newReqAssessmentDate = document.getElementById("newReqAssessmentDate").value;   // 需求评估日期
	    	   	    	               if(newReqAssessmentDate == "") {
	    	   	    	                   sweetAlert("提示", "需求评估日期不能为空！", "warning");
	    	   	    	                   return;
	    	   	    	               }
	    	   	    	               var newReqScheduleStartDate = document.getElementById("newReqScheduleStartDate").value;   // 计划启动日期
	    	   	    	               var newReqScheduleDate = document.getElementById("newReqScheduleDate").value;   // 排期
	    	   	    	               var newReqStartDate = document.getElementById("newReqStartDate").value;   // 立项时间
	    	   	    	               var newReqOrganizeType = document.getElementById("newReqOrganizeType").value;   // 立项时间
	    	   	    	               var newReqPriority = document.getElementById("newReqPriority").value;   // 优先级
	    	   	    	               var newReqContent = document.getElementById("newReqContent").value;   // 主要内容
	    	   	    	               var newReqPerInCharge = document.getElementById("newReqPerInCharge").value;   // 负责人
	    	   	    	               if (newReqPerInCharge == "") {
	    	   	    	                   sweetAlert("提示", "负责人不能为空！", "warning");
	    	   	    	                   return;
	    	   	    	               }
	    	   	    	               var newReqMember = document.getElementById("newReqMember").value;   // 其他成员
	    	   	    	               var newReqAssessment = document.getElementById("newReqAssessment").value;   // 评估意见
	    	   	    	               var newReqAuthor = document.getElementById("newReqAuthor").value;   // 需求提交人
	    	   	    	               var newReqBusDepart = document.getElementById("newReqBusDepart").value;  // 业务部门
	    	   	    	               var newReqComment = document.getElementById("newReqComment").value;  // 备注
	    	   	      	         
	    	   	      	               $.ajax({
	    	   	      	                    type: "POST",
	    	   	      	                    url: "<%=basePath%>updateReq.do",
	    	   	      	                    data : { reqID : reqID, 
	    	   	      	                	     newReqNum : newReqNum, newReqName : newReqName,
	    	       	                	         newReqState : newReqState, newReqAssessmentDate : newReqAssessmentDate,
	    	       	                	         newReqScheduleStartDate : newReqScheduleStartDate, newReqScheduleDate : newReqScheduleDate,
	    	       	                	         newReqStartDate : newReqStartDate, newReqOrganizeType : newReqOrganizeType,
	    	       	                	         newReqPriority : newReqPriority, newReqContent : newReqContent,
	    	       	                	         newReqPerInCharge : newReqPerInCharge, newReqMember : newReqMember,
	    	       	                	         newReqAssessment : newReqAssessment, newReqAuthor : newReqAuthor,
	    	       		      	                 newReqBusDepart : newReqBusDepart, newReqComment : newReqComment
	    	   	      	                    },
	    	   	      	                    success: function () {
	    	   	      	                	    sweetAlert("提示", "更新需求成功！", "success");
	    	   	      	                	     window.location.href = "<%=basePath%>loadReqsList.do";
	    	   	                            },
	    	   	  						    error : function(e) {
	    	   	  								  sweetAlert("更新需求失败：", e, "error");
	    	   	  						    }
	    	   	  				       });
	    	                	   }
	                        },
							error : function(e) {
									sweetAlert("校验需求编号失败：", e, "error");
									return;
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
	 
	 function viewReq(reqID) {
		 viewReqDialog(reqID);
   	     event.preventDefault();
     }
	 
	 function viewReqDialog(reqID) {
   	      $(function(){
                $.ajax({
           	          type: "POST",
                      url : "<%=basePath%>getReqByID.do",
                      data : { reqID: reqID },
                      success : function(msg) {
                   	       var msgRes = JSON.parse(msg);  // 返回 JSON 对象
                   	       $("#newReqNum").attr("value", msgRes.reqNum);
                   	       $("#newReqNum").attr("readonly", true);
                   	       $("#newReqName").attr("value", msgRes.reqName);
                   	       $("#newReqName").attr("readonly", true);
                   	    
                   	       var rss = document.getElementById("newReqState");
                	       rss.options[rss.selectedIndex].removeAttribute("selected");
                   	       if (msgRes.reqState == '01') {
                	    	   $("#newReqState_Op1").attr("selected", "selected");
                	       } else if (msgRes.reqState== '02') {
                	    	   $("#newReqState_Op2").attr("selected", "selected");
                	       } else if (msgRes.reqState== '03') {
                	    	   $("#newReqState_Op3").attr("selected", "selected");
                	       } else if (msgRes.reqState== '04') {
                	    	   $("#newReqState_Op4").attr("selected", "selected");
                	       } else if (msgRes.reqState== '05') {
                	    	   $("#newReqState_Op5").attr("selected", "selected");
                	       } else if (msgRes.reqState== '06') {
                	    	   $("#newReqState_Op6").attr("selected", "selected");
                	       } else if (msgRes.reqState== '07') {
                	    	   $("#newReqState_Op7").attr("selected", "selected");
                	       } else if (msgRes.reqState== '08') {
                	    	   $("#newReqState_Op8").attr("selected", "selected");
                	       }
                   	      $("#newReqState").attr("disabled", true);
                   	    
                   	      $("#newReqAssessmentDate").attr("value", msgRes.reqAssessmentDate);
                   	      $("#newReqAssessmentDate").attr("disabled", true);
              	          $("#newReqScheduleStartDate").attr("value", msgRes.reqScheduleStartDate);
              	          $("#newReqScheduleStartDate").attr("disabled", true);
              	          $("#newReqScheduleDate").attr("value", msgRes.reqScheduleDate);
              	          $("#newReqScheduleDate").attr("disabled", true);
              	          $("#newReqStartDate").attr("value", msgRes.reqStartDate);
              	          $("#newReqStartDate").attr("disabled", true);
              	      
              	          var rots = document.getElementById("newReqOrganizeType")
                	      rots.options[rots.selectedIndex].removeAttribute("selected");
              	          if (msgRes.reqOrganizeType == '2') {
              	        	   $("#newReqOrganizeType_F").attr("selected", "selected");
                	       } else {
                	    	   $("#newReqOrganizeType_Z").attr("selected", "selected");
                	       }
              	          $("#newReqOrganizeType").attr("disabled", true);
              	        
                   	       var rps = document.getElementById("newReqPriority")
                   	       rps.options[rps.selectedIndex].removeAttribute("selected");
                   	       if (msgRes.reqPriority == 'B') {
                   	    	   $("#newReqPriority_B").attr("selected", "selected");
                   	       } else if (msgRes.reqPriority == 'C') {
                   	    	   $("#newReqPriority_C").attr("selected", "selected");
                   	       } else {
                   	    	   $("#newReqPriority_A").attr("selected", "selected");
                   	       }
                   	       $("#newReqPriority").attr("disabled", true);
                   	    
              	           $("#newReqAssessment").attr("value", msgRes.reqAssessment);
              	           $("#newReqAssessment").attr("readonly", true);
              	           $("#newReqAuthor").attr("value", msgRes.reqAuthor);
              	           $("#newReqAuthor").attr("readonly", true);
                   	       $("#newReqContent").attr("value", msgRes.reqContent);
                   	       $("#newReqContent").attr("readonly", true);
                   	       $("#newReqPerInCharge").attr("value", msgRes.reqPerInCharge);
                   	       $("#newReqPerInCharge").attr("readonly", true);
                   	       $("#newReqMember").attr("value", msgRes.reqMember);
                   	       $("#newReqMember").attr("readonly", true);
                   	       $("#newReqBusDepart").attr("value", msgRes.reqBusDepart);
                   	       $("#newReqBusDepart").attr("readonly", true);
                   	       $("#newReqComment").attr("value", msgRes.reqComment);
                   	       $("#newReqComment").attr("readonly", true);
                      },
                      error : function(e) {    
                   	      sweetAlert("初始化需求失败：", e, "error");
                      }
                });
         });
   	  
	     $("#dialog").dialog({
	    	   title: "查看需求",
	    	   autoOpen: true,
	    	   width: 800,
	    	   height: 700,
	      	   buttons: [ {
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