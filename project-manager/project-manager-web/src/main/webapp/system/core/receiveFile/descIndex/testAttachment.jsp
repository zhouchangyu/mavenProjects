<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/common/js/tabs/demo.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/style.css"/>
<script type="text/javascript" src="<%=contextPath%>/common/js/tools.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/easyuiTools.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/sys.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/layout/layout.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/tabs/tabs.js"></script>
<script>

var runId = '';
var frpSid = '';
function doInit(){
	 textTbody();//展示正文
	// getRetaltionFile();//展示相关 
	 loadattach();//附件
	// getRetaltionFile("#RItbody","XGXX");//有关信息
	 getRetaltionFile("#RIDataTbody","XGWJ");//相关文件
	// relationattach();//加载相关资料
}
function textTbody(){
	var json = tools.requestJsonRs(contextPath+"/flowRunDocController/getFlowRunDocs.action?runId="+runId);
	var list = json.rtData;
	var render = [];
	if(list.length>0){
		//拼写表头
		var header = "<tr style='background:#fafafa;'>";
		header+="<td style='font-weight:bold;width:30%'>版本号</td>";
		header+="<td style='font-weight:bold;width:30%'>编辑者</td>";
		header+="<td style='font-weight:bold;width:30%'>编辑时间</td>";
		header+="</tr>";
		$("#text").html(header);
	}
	for(var i=0;i<list.length;i++){
			render.push("<tr>");
			render.push("<td class='TableData'>"+list[i].versionNo+"</td>");
			render.push("<td class='TableData'>"+list[i].userName+"</td>");
			render.push("<td class='TableData'>"+list[i].createTimeDesc+"</td>");
			/* if(i!=list.length-1){
				render.push("<td class='TableData'><a href='#' onclick='lookup("+list[i].docAttach.sid+")'>查看</a></td>");
			}else{
				render.push("<td class='TableData'><a href='#' onclick='edit("+list[i].docAttach.sid+")'>编辑</a></td>");
			} */
			render.push("</tr>");
		}
		$("#textTbody").html(render.join(""));
	}

function lookup(attachId){
	xparent.ReadOnly = true;
	xparent.DOC.OpenFromURL(contextPath+"/ntko/readFile.action?id="+attachId+"&model=workFlowRunDoc", true, false);
	xparent.DOC_saveDocNew = xparent.DOC_saveDoc;
	xparent.DOC_saveDoc = function(){};
	window.close();
}

function edit(attachId){
	xparent.ReadOnly = false;
	xparent.DOC.OpenFromURL(contextPath+"/ntko/readFile.action?id="+attachId+"&model=workFlowRunDoc", true, false);
	xparent.DOC_saveDoc = xparent.DOC_saveDocNew;
	window.close();
}
function getRetaltionFile(id,type){
	var url = contextPath+"/teeRelevantFile/getRetaltionFile.action"
	var params = {runId:runId,type:type};
	var json = tools.requestJsonRs(url,params);
	if(json.rtState){
		var result = json.rtData;
		if(result==null){
			return;
		}
		var len=result.length
		var render = [];
		for(var i =0;i<len;i++){
			var list = result[i];
			render.push("<tr>");
			render.push("<td class='TableData'>"+list.relationFileName+"</td>");
			render.push("<td class='TableData'>"+list.relationFile+"</td>");
			render.push("<td class='TableData'>"+list.tpId+"</td>");
			render.push("</tr>");
		}
		$(id).html(render.join(""));
	}
}

//有关资料
function  relationattach(){
	var path="/teeWorkflowAttachmentController/getTeeWorkFlowAttachmentRelation.action";
	var id="#RIFileTbody";
	loadWorkFlowAttach(path,id)
}
//附件
function  loadattach(){
	var path="/teeWorkflowAttachmentController/getTeeWorkFlowAttachment.action";
	var id="#attachmentIdsTbody";
	loadWorkFlowAttach(path,id)
}
/**
 * 获取工作流 公共附件 zhp 20131020
 */
function loadWorkFlowAttach(path,id){
	var url = contextPath+path;
	var para  = {};
	para["runId"] = runId;
	para["frpSid"] = frpSid;
	$("#pulicAttachments").html("");
	var json = tools.requestJsonRs(url,para);
	if(json.rtState){
		var attachList = json.rtData;
		var attStrHtml = "";
		var render =[];
		for(var j=0;j<attachList.length;j++){
			var att = attachList[j];
		 
			render.push("<tr>");
			render.push("<td class='TableData'><span style=font-size:12px>"+att.fileName+"("+att.sizeDesc+")&nbsp;&nbsp;"+att.userName+"&nbsp;&nbsp;"+att.createTimeDesc+"</span></td>");
			render.push("</tr>");
			
		}	 
			$(id).append(render.join(""));
	} 
}

</script> 
<style type="text/css" >
  td{border:1px solid #e2e2e2;padding:5px;};
 </style>
</head>
<body onload="doInit()" style="margin:10px;" >
<div id="container">
	<div class="title">
	<div  class="titleName"	>正文</div>
	</div>
	<table style="text-align:center;width:60%;font-size:12px;border:1px solid #e2e2e2;border-collapse:collapse;" >
		<thead id="text">
		</thead>
		<tbody id="textTbody">
		</tbody>
	</table>
	<div class="title">
	<div  class="titleName"	>附件</div>
	</div>
	<table style="text-align:center;width:60%;font-size:12px;border:1px solid #e2e2e2;border-collapse:collapse;">
		<thead id="attachmentIds">
			<tr style="background:#fafafa;">
				<td style="font-weight:bold;">名称</td>
			</tr>
		</thead>
		<tbody id="attachmentIdsTbody">
		</tbody>
	</table>
	<div class="title" style="display:none">
	<div  class="titleName"	>相关信息</div>
	</div>
	<table style="text-align: center;width:60%;font-size:12px;border:1px solid #e2e2e2;border-collapse:collapse;">
		<thead id="RIthead">
			<tr style="background:#fafafa;">
				<td style="font-weight:bold;width:30%">标题</td>
				<td style="font-weight:bold;width:30%">编号</td>
				<td style="font-weight:bold;width:30%">关联文件</td>
			</tr>	
		</thead>
		<tbody id="RItbody">
		</tbody>
	</table>
	<div class="title">
	<div  class="titleName"	>关联文件</div>
	</div>
	<table style="text-align: center;width:60%;font-size:12px;border:1px solid #e2e2e2;border-collapse:collapse;">
		<thead id="RIData">
		<tr style='background:#fafafa;'>
				<td style='font-weight:bold;width:30%'>关联文件名称</td>
				<td style='font-weight:bold;width:30%'>关联文件</td>
				<td style='font-weight:bold;width:30%'>文件编号</td>
			</tr>	
		</thead>
		<tbody id="RIDataTbody">
		</tbody>
	</table>
	<div class="title" style="display:none">
	<div  class="titleName"	>有关资料</div>
	</div>
	<table style="text-align: center;width:60%;font-size:12px;border:1px solid #e2e2e2;border-collapse:collapse;">
		<thead id="RIFile">
		<tr style='background:#fafafa;'>
				<td style='font-weight:bold;'>名称</td>
			</tr>
		</thead>
		<tbody id="RIFileTbody">
		 
		</tbody>
	</table>
</div>
</body>
</html>