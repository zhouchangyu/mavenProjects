<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/header/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>明细表</title>
</head>
<body>
<div style="padding:10px;font-size:12px">
	<b>名称：</b>
	<br/>
	<input id="title" class="BigInput" style="width:90%"/>
	<br/>
	<b>数据模型标识：</b>
	<br/>
	<input id="dfid" class="BigInput" />
		<span style="color:red">
			&nbsp;与业务引擎有关，一般无需设置该项。
		</span>
	<br/>
	<b>列表宽度：</b>
	<br/>
	<input id="width" class="BigInput" style=""/>
	<br/>
	<b>表头单元格样式：</b>
	<br/>
	<input id="header" class="BigInput" style=""/>
	<br/>
	<b>数据单元格样式：</b>
	<br/>
	<input id="data" class="BigInput" style=""/>
	<br/>
	<div id='xlist_content' style="font-size:12px"></div><br/><a href='javascript:void()' onclick='xlist_addDataItem()'>添加表项目</a>
</div>
<script>
	var contextPath = "<%=contextPath%>";

	var headerstyle = "style='text-align:center;font-weight:bold;'";
	var bodystyle = "style='text-align:center;'";
	
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

	function xlist_addDataItem(){
		var xlist_tbody = $("#xlist_tbody");
		var html = "";

		html+="<tr>";
		html+="<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' name=\"title\" /></td>" +
				"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' name='width' style='width:50px'  /></td>" +
				"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' name='style'  /></td>" +
				"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"checkbox\" name=\"sum\"  /></td>" +
				"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"text\" name=\"formula\"  /></td>" +
				"<td "+bodystyle+">"+xlist_renderType("")+"</td>" +
				"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"text\" name=\"model\"  /></td>" +
				"<td "+bodystyle+"><a href='javascript:void()' onclick='xlist_deleteDataItem(this)'>删除</a></td>";
		html+="</tr>";
		
		var child = $(html);

		xlist_tbody.append(child);
	}

	function xlist_deleteDataItem(obj){
		$(obj).parent().parent().remove();
	}

	function xlist_renderType(value){
		var html = "<select class='cke_dialog_ui_input_text' type=\"text\" name=\"type\">";
		html+="<option value='1' "+(value=="1"?"selected":"")+">单行输入框</option>";
		html+="<option value='2' "+(value=="2"?"selected":"")+">多行文本框</option>";
		html+="<option value='3' "+(value=="3"?"selected":"")+">下拉菜单</option>";
		html+="<option value='4' "+(value=="4"?"selected":"")+">单选框</option>";
		html+="<option value='5' "+(value=="5"?"selected":"")+">多选框</option>";
		html+="<option value='6' "+(value=="6"?"selected":"")+">列表序号</option>";
		html+="<option value='7' "+(value=="7"?"selected":"")+">日期时间</option>";
		html+="</select>";
		return html;
	}

	//转换dom节点，required
	function toDomStr(){
		var title = $("#title").val();
		var width = $("#width").val();
		var header = $("#header").val();
		var data = $("#data").val();
		var dfid = $("#dfid").val();
		var html = "<img src=\""+(contextPath+"/common/images/workflow/xlist.png")+"\" xtype=\"xlist\" title=\""+title+"\" ";
		
		if(nameCode && nameCode!=null){
			html+=" name=\""+nameCode+"\" id=\""+nameCode+"\" ";
		}else{
			maxItem++;
			html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" ";
		}
		html+=" rows=\""+width+"\" header=\""+header+"\" data=\""+data+"\" dfid=\""+dfid+"\"";
		
		var dataList = $("#xlist_tbody tr");
		var json = "[";
		dataList.each(function(i,obj){
			var data = $(obj).find("td");
			var title = $(data[0]).find("input:first").val();
			var width = $(data[1]).find("input:first").val();
			var style = $(data[2]).find("input:first").val();
			var sum = $(data[3]).find("input:first").attr("checked")?"1":"0";
			var formula = $(data[4]).find("input:first").val();
			var type = $(data[5]).find("select:first").val();
			var model = $(data[6]).find("input:first").val();
			json+="{'title':'"+title+"','width':'"+width+"','style':'"+style+"','sum':'"+sum+"','formula':'"+formula+"','type':'"+type+"','model':'"+model+"'}";
			if(i!=dataList.length-1){
				json+=",";
			}
		});
		
		json+="]";
		
		html+="model=\""+json+"\"";
		html+="/>";
		
		return html;
	}

	//加载数据
	var selection = editor.getSelection();
	var ranges = selection.getRanges();
	var element = selection.getSelectedElement();
	var xlist_content = $("#xlist_content");
	
	//设置表头
	var html = "<table style='width:100%;font-size:12px'>";
	html+="<thead>";
	html+="<tr>";
	html+="<td "+headerstyle+">表头项名称</td><td "+headerstyle+">宽度</td><td "+headerstyle+">数据单元格样式</td><td "+headerstyle+">列合计</td><td "+headerstyle+">计算公式</td><td "+headerstyle+">字段类型</td><td "+headerstyle+">值数据</td><td "+headerstyle+">操作</td>";
	html+="</tr>";
	html+="</thead>";

	html+="<tbody id='xlist_tbody'>";
	
	if(element!=null && element.getAttribute('xtype')=='xlist'){
		nameCode = element.getAttribute('name');
		var title = $("#title");
		var width = $("#width");
		var data = $("#data");
		var header = $("#header");
		var dfid = $("#dfid");
		if(element.getAttribute("title")){
			title[0].value = element.getAttribute("title");
		}
		if(element.getAttribute("rows")){
			width[0].value = element.getAttribute("rows");
		}
		if(element.getAttribute("data")){
			data[0].value = element.getAttribute("data");
		}
		if(element.getAttribute("header")){
			header[0].value = element.getAttribute("header");
		}
		if(element.getAttribute("dfid")){
			dfid[0].value = element.getAttribute("dfid");
		}

		var model = element.getAttribute("model");//获取元素model属性
		if(model && model!=""){
			var list = eval("("+model+")");
			for(var i=0;i<list.length;i++){
				html+="<tr>";
				html+="<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' value='"+list[i].title+"'  name=\"title\" ></td>" +
					"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' name='width' style='width:50px' value=\""+(list[i].width)+"\" /></td>" +
					"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type='text' name='style' value=\""+(list[i].style)+"\" /></td>" +
					"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"checkbox\" name=\"sum\" "+(list[i].sum=="1"?"checked":"")+" /></td>" +
					"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"text\" name=\"formula\" value=\""+(list[i].formula)+"\" /></td>" +
					"<td "+bodystyle+">"+xlist_renderType(list[i].type)+"</td>" +
					"<td "+bodystyle+"><input class='cke_dialog_ui_input_text' type=\"text\" name=\"model\"  value=\""+(list[i].model)+"\" /></td>" +
					"<td "+bodystyle+"><a href='javascript:void()' onclick='xlist_deleteDataItem(this)'>删除</a></td>";
				html+="</tr>";
			}
		}
		
	}else{
		nameCode = null;
	}
	html+="</tbody>";
	html+="</table>";
	xlist_content.html(html);

</script>
</body>

</html>