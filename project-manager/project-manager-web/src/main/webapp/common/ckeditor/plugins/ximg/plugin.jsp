<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/header/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>图片上传控件</title>
</head>
<body>
<div style="padding:10px;font-size:12px">
	<table style="font-size:12px">
		<tr>
			<td colspan="2">
				<b>控件名称：</b>
				<br/>
				<input id="title" class="BigInput" style="width:330px"/>
			</td>
		</tr>
		<tr>
			<td>
				<b>宽度：</b>
				<br/>
				<input id="width" style="width:125px" class="BigInput" />px
			</td>
			<td>
				<b>高度：</b>
				<br/>
				<input id="height" class="BigInput" style="width:125px"/>px
			</td>
		</tr>
	</table>
</div>
<script>
	var contextPath = "<%=contextPath%>";

	//校验，required
	function validate(){
		//判断是否填写标题了
		if($("#title").val()==""){
			alert("请填写控件名称！");
			$("#title").focus();
			return false;
		}
		//判断当前title是否在整个dom文档中
		var findit = $(editor.getData()).find("[title="+$("#title").val()+"]").length!=0?true:false;
		if(findit){
			if(element && $("#title").val()!=element.getAttribute('title')){
				alert("已存在该名称的控件，控件名称禁止重复。");
				return false;
			}else if(element && $("#title").val()==element.getAttribute('title')){
				return true;
			}else{
				alert("已存在该名称的控件，控件名称禁止重复。");
				return false;
			}
		}
		return true;
	}

	//转换dom节点，required
	function toDomStr(){
		title = $("#title").val();
		height = $("#height").val();
		width = $("#width").val();

		var html = "<img src=\"<%=systemImagePath%>/workflow/imgupload.png\" xtype=\"ximg\" ";
		if(nameCode && nameCode!=null){
			html+=" name=\""+nameCode+"\" id=\""+nameCode+"\"";
		}else{
			maxItem++;
			html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" ";
		}
		if(title){
			html+=" title=\""+title+"\"";
		}
		if(width!=""){
			html+=" width=\""+width+"px\"";
		}
		if(height!=""){
			html+=" height=\""+height+"px\"";
		}

		html+=" />";
		return html;
	}

	//加载数据
	var selection = editor.getSelection();
	var ranges = selection.getRanges();
	var element = selection.getSelectedElement();
	
	if(element!=null && element.getAttribute('xtype')=='ximg'){
		nameCode = element.getAttribute('name');
		var title = $("#title");
		var height = $("#height");
		var width = $("#width");

		if(element.getAttribute('title')){
			$("#title").attr("value",element.getAttribute('title'));
		}
		if(element.getAttribute('width')){
			$("#width").attr("value",parseInt(element.getAttribute('width')));
		}
		if(element.getAttribute('height')){
			$("#height").attr("value",parseInt(element.getAttribute('height')));
		}
	}else{
		nameCode = null;
	}

</script>
</body>

</html>