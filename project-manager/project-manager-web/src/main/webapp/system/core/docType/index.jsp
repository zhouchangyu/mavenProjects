<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新建文种</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui.jsp" %>
<%@ include file="/header/ztree.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=contextPath %>/common/My97DatePicker/WdatePicker.js"></script>
<script>
function doInit(){
    query();
}

function query(){///teeDocType/getAllList.action
	var params = "";
	var column =[
	 			{
	 				field:'ck',
	 				checkbox:true
	 			},{
					title : '序号',
					field : 'seq',
					sortable : true,
					width:100
				},{
					field : 'typeName',
					title : '类型文件',
					width:100
				}, {
					field : 'fileName',
					title : '模板文件名',
					width:100
				} ,{
					field : 'parentType',
					title : '类别',
					width:100
				},{
					field : 'startFlow',
					title : '启动流程',
					width:100
				},{
					field : 'wordType',
					title : '发文字',
					width:100
				}, {
					title : '编号值',
					field : 'autoNumberName',
					width:100
				} ,{
					title : '排序号',
					field : 'sortId',
					width:100 }];
	var url = contextPath+"/teeDocType/getAllList.action";
	var datagrid = $('#datagrid').datagrid({
		url : url,
		toolbar : '#toolbar',
		title : '',
		iconCls : 'icon-save',
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ],
		fit : true,
		fitColumns : true,
		nowrap : true,
		border : false,
		checkbox:true,
		idField : 'seq',
		striped: true,
		remoteSort: true,
		onDblClickRow: function (rowIndex, rowData) {  
			editDoc(rowData.seq ,rowData.modeId);
		},
		singleSelect:false,
		columns : [column]
	});
}

function add(seq,modelId){
	var url = "/system/core/docType/addDocType.jsp?seq="+seq+"&modelId="+modelId;
	bsWindow(url,"编辑文种",{width:"800",height:"400",submit:function(v,h){
		if(v=="ok"){
			var cw = h[0].contentWindow;
			if(cw.doSave()){
				//top.$.jBox.tip("成功添加文种类型","success");
				//cw.location.reload();
				return true;
			}
		}
		return false;
	}});
}
function editDoc(seq,modeId){
	if(modeId=="null"){
		modeId=0;
	}
	 add(seq,modeId);
	 
}
function addParentType(){
	var url = "/system/core/docType/addParentType.jsp";
	bsWindow(url,"添加文种类型",{width:"400",height:"200",submit:function(v,h){
		if(v=="ok"){
			var cw = h[0].contentWindow;
			if(cw.doSave()){
				//top.$.jBox.tip("成功添加文种类型","success");
				return true;
			}
		}
		return false;
	}});
}
//删除数据
function del(){
	var rows = $("#datagrid").datagrid("getSelected");
	var url = contextPath+"/teeDocType/delBySeq.action";
	var param ={seq:rows.seq};
	var json = tools.requestJsonRs(url,param);	
	if(json.rtState){
		alert("删除成功");
		location.reload();
	}else{
		alert("删除失败！"+json.rtData.localizedMessage);
	}
}
</script>

</head>
<body onload="doInit()" fit="true">
<table  id="datagrid" fit="true"></table>
<div id="toolbar">
	<div class="title">
		<div class="titleName">新建文种</div>
		<div class="btns">
			<input class="btn_default" onclick="add();" type="button" value="新建" />
			<input class="btn btn-danger" onclick="del();" type="button" value="删除" />
		</div>
	</div>
</div>
</body>
</html>