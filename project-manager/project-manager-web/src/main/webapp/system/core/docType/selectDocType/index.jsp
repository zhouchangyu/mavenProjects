<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/easyui.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<title>拟稿夹</title>
<script type="text/javascript">
function doInit(){
	query();
}
function addFlowRun(){
	var url = "/system/core/docType/selectDocType/selectSingleDocType.jsp";
	bsWindow(url,"选择文种类型",{width:"550",height:"370",submit:function(v,h){
		if(v=="ok"){
			var cw = h[0].contentWindow;
			if(cw.commit()){
				top.$.jBox.tip("正在操作，请稍后...","loading");
				$('#datagrid').datagrid("reload");
				top.$.jBox.tip("创建成功","success",1000);
				return true;
			}else{
				alert("创建失败！");
			}
		}
		return false;
	}});
}
Date.prototype.toLocaleString = function() {
    return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + "  " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
};
function query(){///teeDocType/getAllList.action
	var params = "";
	var column =[
	 			{
	 				field:'RUNID',
	 				checkbox:true
	 			},
	 			{
					title : '标题',
					field : 'FLOWID',
					sortable : true,
					hidden:true,
					width:100
	 			}
	 			,{
					title : '标题',
					field : 'TITLE',
					sortable : true,
					width:100
				},{
					field : 'DOCID',
					title : '文号',
					width:100
				}, {
					field : 'DENSE',
					title : '密级',
					width:100
				} ,{
					field : 'URGENCY',
					title : '缓急',
					width:100
				},{
					field : 'STATE',
					title : '状态',
					width:100,
					formatter:function(value,rowData,rowIndex){
						var flag ="";
						if(value==1 ||value==2){
							flag = "未办";
						}else{
							flag = "已办";
						}
						return flag;
					}
				},{
					field : 'STARTDATE',
					title : '拟稿日期',
					width:100,
					formatter:function(value,rowData,rowIndex){
					 return new Date(value).format("yyyy-MM-dd hh:mm:ss")
					}
				}
			 ];
	var url = contextPath+"/teeDocType/getDocList.action";
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
		//idField : 'docId',
		striped: true,
		remoteSort: true,
		onDblClickRow: function (rowIndex, rowData) {
			var  prc =rowData.STATE;
			if(prc==1 || prc==2){
				openFullWindow("/flowRun/toUrl.action?runId="+rowData.RUNID+"&frpSid="+rowData.FRPSID+"&flowId="+rowData.FLOWID,'工作流办理');
			}else{
				openFlowRun(rowData.RUNID);
			}

		},
		singleSelect:true,
		pagination : true,
		columns : [column]
	});
}
//打开流程详情
function openFlowRun(runid){
	window.openFullWindow(contextPath+"/system/core/workflow/doc/fw/index.jsp?runId="+runid+"&view=1", "发文详情");
}
//打开流程详情
 function openWorkFlowRun(){
	var rows = $("#datagrid").datagrid("getSelected");
	openFlowRun(rows.RUNID);
}
function exportExcel(){
	var rows = $("#datagrid").datagrid('getSelections');
	if(rows.length==0){
		if(confirm("是否确认导出所有查询结果？")){
			//导出所有的查询结果
			$("#frame0").attr("src",contextPath+"/teeDocType/exportExcel.action");
		}else{
			return;
		}
	}else{
		var ids = [];
		var length=rows.length;
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].RUNID);
		}
		ids.join('');
		var params={};
		params["RUNID"]=ids;
		$("#frame0").attr("src",contextPath+"/teeDocType/exportExcel.action?params="+tools.jsonObj2String(params));
	}
}
//跟踪流程
function trackWorkFlow(){
	var rows = $("#datagrid").datagrid('getSelected');
	var flowId = rows.FLOWID;
	var runId = rows.RUNID;
	var url = contextPath+"/system/core/workflow/flowrun/flowview/index.jsp?runId="+runId+"&flowId="+flowId;
	openFullWindow(url,"步骤与流程图");
}
/**
 * 刷新
 */
function refresh(){
	location.reload();
}

function destory(){
	var rows = $("#datagrid").datagrid('getSelections');
	if(rows.length==0){
		alert("请选择至少一项数据");
		return;
	}else{
		if(window.confirm("确认要删除这些数据吗？")){
			var ids = [];
			var length=rows.length;
			for(var i=0;i<rows.length;i++){
				ids.push(rows[i].RUNID);
			}
			var params={};
			params["runIds"]=ids.join(',');

			tools.requestJsonRs(contextPath+"/workDestroy/destroy.action",params);
			$("#datagrid").datagrid("reload");
			$("#datagrid").datagrid("unSelectAll");
		}
	}
}
</script>
</head>
<body onload="doInit()"  fit="true">
	<table id="datagrid" fit="true"></table>
	<div id="toolbar">
	<div class="title">
			<div class="titleName">拟稿夹	</div>
			<div class="btns">
				<input class="btn_default" onclick="addFlowRun();" type="button" value="新建" />
				<input class="btn_default" onclick="openWorkFlowRun();" type="button" value="打开" />
				<input class="btn_default" onclick="refresh();" type="button" value="刷新" />
				<input class="btn_default" onclick="destory()" type="button" value="删除" />
				<input class="btn_default btn_logo"  style= "background-image: url(/common/zt_webframe/dist/img/innerPageIframe/print.png);" type="button" onclick="exportExcel()" value="导出" />
				<input class="btn_default" onclick="trackWorkFlow();" type="button" value="跟踪" />
			</div>
		</div>
		</div>
	<iframe id="frame0" style="display:none"></iframe>
</body>
</html>
