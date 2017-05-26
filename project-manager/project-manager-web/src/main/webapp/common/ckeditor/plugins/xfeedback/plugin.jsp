<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/header/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>会签控件</title>
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
				<b>签章选项：</b>
				<br/>
				<input id="seal" type="checkbox"/>盖章
				&nbsp;&nbsp;
				<input id="hand" type="checkbox"/>手写
			</td>
		</tr>
		<tr>
			<td>
				<b>会签模板：</b>
				<br/>
				<textarea id="template" style="width:320px;height:80px" class="BigTextarea"></textarea>
				<br/>
				<span style="color:red">
					会签控件数据显示格式，{C}=会签内容，{U}=会签用户名，{D}=用户所属部门，{R}=用户所属角色，{T}=会签时间，{P}=签章位置，{O}=操作位置
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<b>控件样式：</b>
				<br/>
				<textarea id="style" style="width:320px;height:30px" class="BigTextarea"></textarea>
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
		template = $("#template").val();
		style = $("#style").val();

		var html = "<textarea  xtype=\"xfeedback\" ";
		if(nameCode && nameCode!=null){
			html+=" name=\""+nameCode+"\" id=\""+nameCode+"\"";
		}else{
			maxItem++;
			html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" ";
		}
		
		if(title){
			html+=" title=\""+title+"\"";
		}
		
		if($("#seal").attr("checked")){
			html+=" seal=\"1\"";
		}
		
		if($("#hand").attr("checked")){
			html+=" hand=\"1\"";
		}
		
		html+=" template=\""+tools.string2Unicode(template)+"\" style=\""+style+"\"/>";
		return html;
	}

	//加载数据
	var selection = editor.getSelection();
	var ranges = selection.getRanges();
	var element = selection.getSelectedElement();
	
	if(element!=null && element.getAttribute('xtype')=="xfeedback"){
		nameCode = element.getAttribute('name');
		var title = $("#title");
		var seal = $("#seal");
		var hand = $("#hand");
		template = $("#template");
		style = $("#style");
		
		if(element.getAttribute('title')){
			title.attr("value",element.getAttribute('title'));
		}
		if(element.getAttribute('seal')){
			if(element.getAttribute('seal')=="1"){
				seal.attr("checked","");
			}
		}
		if(element.getAttribute('hand')){
			if(element.getAttribute('hand')=="1"){
				hand.attr("checked","");
			}
		}

		if(element.getAttribute('template')){
			template.attr("value",tools.unicode2String(element.getAttribute('template')));
		}

		if(element.getAttribute('style')){
			style.attr("value",element.getAttribute('style'));
		}
		
	}else{
		template = $("#template");
		template.attr("value","<div style='font-size:12px;margin-bottom:90px'><div id='{P}'></div><div style='text-align:left;'>{C}</div><div style='text-align:center'>{U}&nbsp;&nbsp;{T}&nbsp;&nbsp;{O}</div></div>");
		nameCode = null;
	}

</script>
</body>

</html>