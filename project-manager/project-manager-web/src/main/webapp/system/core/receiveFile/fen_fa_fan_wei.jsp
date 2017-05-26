<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp"%>
<%
	String names = request.getParameter("names");
	String runId = request.getParameter("runId");
%>
<title>分发范围记录</title>
<script type="text/javascript">
var names = "<%=names%>";
var runId = "<%=runId%>";
function doInit(){
	
	var sp = names.split(",");
	var render = [];
	for(var i in sp){
		render.push("<tr>");
		render.push("<td class='TableData'>"+sp[i]+"</td>");
		render.push("<td class='TableData'><input name='"+sp[i]+"' style='border: 1px solid rgb(187, 187, 187); border-image: none; width: 70%; height: 20px; line-height: 20px; font-size: 14px;'/></td>");
		render.push("</tr>");
	}
	$("#tb").append(render.join(""));
	
	
	//根据runId获取之前分发的数据
	var json = tools.requestJsonRs("/recDocDelivery/getDocRecords.action?runId="+runId);
	var list = json.rtData;
	for(var i in list){
		var name = list[i].deptName;
		var code = list[i].code;
		
		var targetInput = $("#tb input[name='"+name+"']");
		targetInput.val(code);
	}

}

function save(){
	var data = [];
	$("#tb tr").each(function(i,obj){
		var name = $(obj).find("td:eq(0)").html();
		var code = $(obj).find("td:eq(1) input").val();
		data.push({name:name,code:code});
	});
	
	var json = tools.requestJsonRs(contextPath+"/recDocDelivery/addDocRecord.action",{jsonData:tools.jsonArray2String(data),runId:runId});
	window.close();
}
</script>
</head>
<body onload="doInit();">
	<div class="title">
		<div class="titleName">分发范围记录</div>
		<div class="btns">
			<input class="btn_default" type="button" onclick="save()" value="确定">
			<input class="btn_default" type="button" onclick="window.close()" value="取消">
		</div>
	</div>
	<div style="padding:10px">
		<table class="TableBlock" style="width:100%">
			<tr class="TableHeader">
				<td>分发单位</td>
				<td>文件编号</td>
			</tr>
			<tbody id="tb">
				
			</tbody>
		</table>
	</div>
</body>
</html>
