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
<title>已上线需求</title>
<link href="<%=basePath%>static/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>static/css/sweet-alert.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet">
<link href="<%=basePath%>static/css/main-style.css" rel="stylesheet">
<link href="<%=basePath%>static/css/reqs-layout.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/sweet-alert.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script src="<%=basePath%>static/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
<script src="<%=basePath%>static/js/main.js" type="text/javascript"></script>
</head>

<body>
	<div id="container">
		<div id="head">
			<div id="main_top" >
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
		           <label style="margin-left:2%; margin-top: 1%;">当前位置: 需求管理->已上线需求</label>		
		    </div>
			<div id="panel">
				<div id="queryBar" style="text-align:left;">
					 <label style="margin-left: 2%; margin-top: 0.5%;">需求编号：</label> 
					 <input id="reqNum" type="text"  style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">需求名称：</label>
					 <input id="reqName"  type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <label style="margin-top: 0.5%;">负责人：</label>
					 <input id="reqPerInCharge" type="text" style="width: 120px; height: 24px; margin-top: 0.5%;" /> 
					 <img id="reqsSearch" class="reqsSkip" src="<%=basePath%>static/img/search.png" /> 
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
    	 // 异步加载已上线需求
         $.ajax({
             type : "POST",
             url : "<%=basePath%>searchOnLinedReqs.do",
             data : { reqNum : null, reqName : null, reqPerInCharge : null, pageNum : 1}, 
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
				                  <td style=\"display:none\">" + result.reqID + "</td></tr>";
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
             if (reqNum != null && reqNum.trim() != "" && (!(/R{1}[0-9]{6}$/g).test(reqNum.trim()))){
            	 sweetAlert("提示", "需求编号格式不正确！\n 正确格式如：R171525", "warning");
            	 return;
             }  
             var reqName = document.getElementById("reqName").value;  
             var reqPerInCharge = document.getElementById("reqPerInCharge").value;  

             //ajax发请求
             $.ajax({
                 type : "POST",
                 url : "<%=basePath%>searchOnLinedReqs.do",
                 data : { 
                      reqNum : reqNum, 
                      reqName : reqName, 
                      reqPerInCharge : reqPerInCharge, 
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
				                 <td style=\"display:none\">" + result.reqID + "</td></tr>";
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
	</script>
</body>
</html>