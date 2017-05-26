<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>类别添加</title>
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
	 				field:'id',
	 				checkbox:true
	 			},{
					title : '总收文字号',
					field : 'name',
					sortable : true,
					width:100
				},{
					title : '授权',
					field : 'userNames',
					sortable : true,
					width:100
				},{
					field : 'sortId',
					title : '排序号',
					width:100
				} ];
	var url = contextPath+"/formReceiveData/gettotalAllList.action";
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
		idField : 'id',
		striped: true,
		remoteSort: true,
		onDblClickRow: function (rowIndex, rowData) {  
			editReveiveNum(rowData.id );
		}, 
		singleSelect:false,
		columns : [column]
	});
}
 
function addReveiveNum(id){
	var url = "/system/core/receiveFile/totalreceiveNum/addTotalReceiveNum.jsp?id="+id;
	bsWindow(url,"添加",{width:"600",height:"300",submit:function(v,h){
		if(v=="ok"){
			var cw = h[0].contentWindow;
			if(cw.doSave()){
				top.$.jBox.tip("保存成功！","success");
				location.reload();
				return true;
			}
		}
		return false;
	}});
}
function editReveiveNum(id){
	addReveiveNum(id);
}
//删除选中数据
function delReveiveNum(){
	if(confirm("确认删除！")){
		var rows = $("#datagrid").datagrid("getSelected");
		var url = contextPath+"/formReceiveData/deltotalDataById.action";
		var param ={id:rows.id};
		var json = tools.requestJsonRs(url,param);	
		if(json.rtState){
			alert("删除成功");
			location.reload();
		}else{
			alert("删除失败！"+json.rtData.localizedMessage);
		}
	}
}
</script>
</head>
<body onload="doInit()">
<table id="datagrid" ></table>
<div id="toolbar">
<div class="title">
		<div class="titleName">类别添加</div>
		<div class="btns">
			<input class="btn_default" onclick="addReveiveNum();" type="button" value="新建" />
			<input class="btn btn-danger" onclick="delReveiveNum();" type="button" value="删除" />
		</div>
	</div>
	</div>
</body>
</html>