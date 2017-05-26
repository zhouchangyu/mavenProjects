<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/header/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>签名控件</title>
</head>
<body>
<div style="padding:10px;font-size:12px">
	<table style="font-size:12px">
		<tr>
			<td>
				<b>控件名称：</b>
				<br/>
				<input id="title" class="BigInput" style="width:90%"/>
			</td>
		</tr>
		<tr>
			<td>
				<b>控件样式：</b>
				<br/>
				<textarea id="style" class="BigTextarea" style="width:100%;height:70px"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				注：签名控件用于输入签名密码并回显签名人姓名
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
		def = $("#def").val();
		var style = $("#style").val();

		var html = "<input type=\"text\" xtype=\"xqianming\" ";
		if(nameCode && nameCode!=null){
			html+=" name=\""+nameCode+"\" id=\""+nameCode+"\"";
		}else{
			maxItem++;
			html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" ";
		}
		
		if(title){
			html+=" title=\""+title+"\"";
		}
		
		html+=" value=\"{签名控件}\" style=\""+style+"\"/>"
		return html;
	}

	//加载数据
	var selection = editor.getSelection();
	var ranges = selection.getRanges();
	var element = selection.getSelectedElement();
	
	if(element!=null && element.getAttribute('xtype')=="xqianming"){
		nameCode = element.getAttribute('name');
		var title = $("#title");
		var style = $("#style").val();
		if(element.getAttribute('title')){
			title.attr("value",element.getAttribute('title'));
		}
		if(element.getAttribute("style")){
			$("#style").attr("value",element.getAttribute("style"));
		}
	}else{
		nameCode = null;
	}

</script>
</body>

</html>