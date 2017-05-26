<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String runId = request.getParameter("runId");
	String frpSid = request.getParameter("frpSid");
	String flowId = request.getParameter("flowId");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ include file="/header/header2.0.jsp" %>
	<script type="text/javascript" charset="UTF-8">
	var runId = '<%=runId%>';
	var frpSid = '<%=frpSid%>';
	var flowId = '<%=flowId%>';
	var userId = "";
	var userName = "";
	function doInit(){
		//获取当前流程的阅批记录
		var json = tools.requestJsonRs(contextPath+"/flowRun/getClyjList.action?runId="+runId,{});
		var list = json.rtData;
		var render = [];
		for(var i=0;i<list.length;i++){
			var obj = list[i];
			render.push("<table class='yijianTable'>");
			render.push("<tr>");
				render.push("<td class='title0'>处理意见</td>");
				render.push("<td>"+obj.CLYJ+"</td>");
				render.push("<td class='title0'>阅批人</td>");
				render.push("<td>"+obj.YPR_NAME+"</td>");
				render.push("<td class='title0'>部门名称</td>");
				render.push("<td>"+obj.BMMC+"</td>");
			render.push("</tr>");
			render.push("<tr>");
				render.push("<td class='title0'>职务</td>");
				render.push("<td>"+obj.ZW+"</td>");
				render.push("<td class='title0'>阅批日期</td>");
				render.push("<td>"+obj.YPRQ+"</td>");
				render.push("<td class='title0'>处理方式</td>");
				render.push("<td>"+obj.CLFS+"</td>");
			render.push("</tr>");
			render.push("<tr>");
				render.push("<td class='title0'>阅批意见</td>");
				render.push("<td colspan=5>"+obj.YPYJ+"</td>");
			render.push("</tr>");
			render.push("</table>");
		}
		
		$("#yijianDiv").html(render.join(""));
		
		//获取当前节点下，当前办理人的阅批记录
		var selfJson = tools.requestJsonRs(contextPath+"/flowRun/getClyjInfoByNode.action?frpSid="+frpSid);
		if(selfJson.rtData){
			$("#yijian_id").val(selfJson.rtData.SID);
			$("#ypr_name").val(selfJson.rtData.YPR_NAME).show();
			$("#ypr_pwd").hide();
			$("#ypyj").val(selfJson.rtData.YPYJ);
			switch(selfJson.rtData.CLYJ){
			case "审阅":
				$("#y1").prop("checked","checked");
				break;
			case "审批":
				$("#y2").prop("checked","checked");
				break;
			case "退回修改":
				$("#y3").prop("checked","checked");
				break;
			}
		}
		
	}
	
	 
	
	 
	
	</script>
	
	<style>
	.yijianTable{
		width:700px;
		border-collapse:collapse;
		margin:10px auto;
		margin-bottom:15px;
	}
	.yijianTable td{
		padding:5px;
		font-size:12px;
		border:1px solid gray;
		width:100px;
	}
	.yijianTable .title0{
		width:100px;
		background:#f0f0f0;
		font-weight:bold;
		text-align:center;
	}
	.tb1{
		border-collapse:collapse;
	}
	.tb1 td{
		border:1px solid gray;
		padding:5px;
	}
	</style>
</head>
<body onload="doInit()" style="overflow:auto">
	<div id="yijianDiv" >
	</div>
	<div>
		<table class="yijianTable">
  <tbody>
	  <tr>
		  <td class="title0">处理意见</td>
		  <td>审阅</td>
		  <td class="title0">姓名</td>
		  <td>admin</td>
		  <td class="title0">日期</td>
		  <td>2017/04/14 16:17</td>
		  
		  </tr>
	  <tr>
		  <td class="title0">职务</td>
		  <td>职务</td>
		  <td class="title0">单位</td>
		  <td>系统管理部</td>
		  <td class="title0">处理方式</td>
		  <td>审阅</td>
	  </tr>
	  <tr>
		  <td class="title0">批示内容</td>
		  <td colspan="5">aasdasd</td>
	  </tr>
	  </tbody>
	  </table>
	</div>
	 
</body>
</html>