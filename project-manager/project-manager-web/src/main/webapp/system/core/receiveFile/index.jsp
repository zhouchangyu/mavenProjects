<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/easyui.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<title>收文登记薄</title>
<script type="text/javascript">
function doInit(){
	//密级	
	getSysCode("DOC_MJ","dense");
	//缓急程度
	getSysCode("DOC_JJCD","urgency");
	query();
}
Date.prototype.toLocaleString = function() {
    return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + "  " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
};
//代码表获取数据
function getSysCode(codeNo , codeSelectId ){
	var url =   contextPath + "/sysCode/getSysCodeByParentCodeNo.action";
	var para = {codeNo:codeNo};
	var jsonObj = tools.requestJsonRs(url ,para);
	if(jsonObj.rtState){
		var prcs = jsonObj.rtData;
		if(codeSelectId && $("#" + codeSelectId)[0]){//存在此对象
			var options = "";
			for ( var i = 0; i < prcs.length; i++) {
				options = options + "<option value='"+prcs[i].codeName+"'>" + prcs[i].codeName + "</option>";
			}
			$("#" + codeSelectId).append(options);
		}
		return prcs;
	}else{
		alert(jsonObj.rtMsg);
	}
}
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
					field : 'RECEIVEDOCID',
					title : '总收文字号',
					width:100
				},{
					field : 'MAINDOCID',
					title : '文件字号',
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
					field : 'REGISTENT',
					title : '登记人',
					width:100
				},{
					field : 'REGISTTIME',
					title : '登记时间',
					width:100
				},{
					field : 'STATE',
					title : '状态',
					width:100,
					formatter:function(value,rowData,rowIndex){
						var flag ="";
						if(value==1 ||value==2){
							flag = "未办理";
						}else{
							flag = "已办";
						}
						return flag;
					}
				}
			 ];
	var url = contextPath+"/teeDocType/getReceiveFileList.action";
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
				openFlowRun(rowData.RUNID,rowData.FRPSID);
			}
			
		},
		singleSelect:false,
		pagination : true,
		columns : [column]
	});
}
//创建流程
function doCreate(){
	var params={fType:39};
	var url = contextPath + "/flowRun/createNewWork.action";
	var json = tools.requestJsonRs(url,params);
	if (json.rtState) {
		window.openFullWindow(contextPath
				+ "/flowRun/toUrl.action?runId="
				+ json.rtData.runId + "&frpSid=" + json.rtData.frpSid
				+ "&flowId=" + json.rtData.flowId + "&isNew=1", "流程办理");
		window.location.reload();
	} else {
		alert(json.rtMsg);
	}
}
//打开流程详情
function openFlowRun(runid,frpSid){
	window.openFullWindow(contextPath+"/system/core/receiveFile/descIndex/formTabList.jsp?runId="+runid+"&frpSid="+frpSid+"&view=1", "流程办理");
}
//打开流程详情
 function openWorkFlowRun(){
	var rows = $("#datagrid").datagrid("getSelected");
	if(rows	==null){
		alert("请选择相关流程！");
		return;
	}
	var  prc =rows.STATE;
	if(prc==1 || prc==2){
		openFullWindow("/flowRun/toUrl.action?runId="+rows.RUNID+"&frpSid="+rows.FRPSID+"&flowId="+rows.FLOWID,'工作流办理');
	}else{
		openFlowRun(rowData.RUNID,rowData.FRPSID);
	}
}
function exportExcel(){
	var rows = $("#datagrid").datagrid('getSelections');
	if(rows.length==0){
		if(confirm("是否确认导出所有查询结果？")){
			//导出所有的查询结果
			$("#frame0").attr("src",contextPath+"/teeDocType/exportExcelRece.action");
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
		$("#frame0").attr("src",contextPath+"/teeDocType/exportExcelRece.action?params="+tools.jsonObj2String(params));
	}
}
//跟踪流程
function trackWorkFlow(){
	var rows = $("#datagrid").datagrid('getSelected');
	if(rows==null){
		alert("请选择相关流程！");
		return;
	}
	var flowId = rows.FLOWID;
	var runId = rows.RUNID;
	var url = contextPath+"/system/core/workflow/flowrun/flowview/index.jsp?runId="+runId+"&flowId="+flowId;
	openFullWindow(url,"步骤与流程图");
}
//刷新
function refresh(){
	location.reload();
}
//查询
function doSearch(){
	var queryParams=tools.formToJson($("#form1"));
	var params={params:tools.jsonObj2String(queryParams)};
	$("#datagrid").datagrid('options').queryParams=params; 
	$("#datagrid").datagrid("reload");
}
function send(){
	var url = contextPath + "/teeRelevantDoc/test.action";
	var json = tools.requestJsonRs(url,null);
	var url = contextPath+"/ssoLogin1.jsp?param="+json.rtData[0];
	openFullWindow(url,"步骤与流程图");
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

// function fensong(){
// 	var rows = $("#datagrid").datagrid('getSelected');
// 	if(rows==null){
// 		alert("请选择相关流程！");
// 		return;
// 	}
	
// 	if(rows.STATE==1 || rows.STATE==2){
// 		var flowId = rows.FLOWID;
// 		var runId = rows.RUNID;
// 		var frpSid = rows.FRPSID;
		
// 		var workFlowUtil = new WorkFlowUtil(runId,frpSid,flowId);
// 		workFlowUtil.turnNext("",function(){
// 			$("#datagrid").datagrid("reload");
// 			$("#datagrid").datagrid("unSelectAll");
// 		});
// 	}else{
// 		alert("该流程已办，无法进行分送。");
// 	}
	
	
// }
</script>
</head>
<body onload="doInit();openScanGun();"  fit="true"  onunload="closeScanGun();">
	<table id="datagrid" fit="true"></table>
	<div id="toolbar">
	<div class="title">
			<div class="titleName">收文登记薄	</div>
			<div class="btns">
				<input class="btn_default" onclick="doCreate();" type="button" value="登记" />
<!-- 				<input class="btn_default" onclick="fensong()" type="button" value="分送" /> -->
				<input class="btn_default" onclick="destory()" type="button" value="删除" />
				<input class="btn_default" onclick="refresh();" type="button" value="刷新" />
<!-- 				<input class="btn_default" onclick="" type="button" value="收回" /> -->
				<input class="btn_default" onclick="trackWorkFlow();" type="button" value="跟踪" />
				<input class="btn_default" onclick="doSearch()" type="button" value="查询" />
				<input class="btn_default btn_logo"  style= "background-image: url(/common/zt_webframe/dist/img/innerPageIframe/print.png);" type="button" onclick="exportExcel()" value="导出" />
				<input class="btn_default" onclick="send()" type="button" value="分发范围传阅" />
			</div>
		</div>
		<form id="form1" name="form1" method="post">
	<table style="width:100%;font-size:12px" align="center" class="tableBlock">
		<tr>
			<td >标题：</td>
			<td class="TableBG"><input id="title" name="title" type="text" class="tableInput"  style="width:120px"/></td>
			<td >总收文字号：</td>
			<td class="TableBG">
				<input id="RECEIVEDOCID" name="RECEIVEDOCID" type="text" class="tableInput"   style="width:120px"/>
			</td>
			<td >密级：</td>
			<td class="TableBG">
			<select id="dense" name="dense" class="tableSelect">
				<option value=" ">不限</option>
			</select>
			</td>
		</tr>
		<tr>
			<td >文件字号：</td>
			<td class="TableBG"><input id="mainDocId" name="mainDocId" type="text"  class="tableInput"  style="width:120px"/></td>
			<td >登记人：</td>
			<td class="TableBG">
				<input id="registent" name="registent" type="text" class="tableInput" onclick=""  style="width:120px"/>
			</td>
			<td >缓急：</td>
			<td class="TableBG">
			<select id="urgency" name="urgency" class="tableSelect">
				<option value=" ">不限</option>
			</select>
			</td>
		</tr>
	</table>
	</form>
		</div>
	<iframe id="frame0" style="display:none"></iframe>

<!-- 扫描枪的Obejct引入 -->
<OBJECT id="ScanGun" name="ScanGun" style="WIDTH: 0px; HEIGHT: 0px" classid="clsid:D2447A11-9DE8-40B9-AB8B-7566185FF08D"></OBJECT>
<script language="javascript" for="ScanGun" event="BarcodeComing(code)">
	var BarNo = document.getElementById("ScanGun").BarNo;//条码号
	var SendDept = document.getElementById("ScanGun").SendDept; //发文单位
	var FileName = document.getElementById("ScanGun").FileName; //文种
	var FileNum = document.getElementById("ScanGun").FileNum; //文号
	var MainSendDept = document.getElementById("ScanGun").MainSendDept;//主送单位
	var Title = document.getElementById("ScanGun").Title;  //标题
	var Secret = document.getElementById("ScanGun").Secret;  //密级
	var Hurry = document.getElementById("ScanGun").Hurry;  //紧急程度
	var CreateFileDate = document.getElementById("ScanGun").CreateFileDate;//条码创建时间
	var SendDegree = document.getElementById("ScanGun").SendDegree;  //发送级别
	var BarCreateDept = document.getElementById("ScanGun").BarCreateDept;  //条码创建级别
	var Other = document.getElementById("ScanGun").Other;  //其他数据
	
	var spFileNum = SpligFileNum(FileNum);
	
	var params={fType:39,
			"DATA_lwbt":Title,
// 			"DATA_hj":Hurry,
// 			"DATA_mj":Secret,
			"DATA_swrq":new Date().format("yyyy-MM-dd"),
			"DATA_wz":FileName,
			"DATA_lwdw":SendDept,
			"DATA_lwzhl":spFileNum[0],
			"DATA_nf":spFileNum[1],
			"DATA_rightzh":spFileNum[2],
			"runName":Title
			};
	var url = contextPath + "/flowRun/createNewWork.action";
	var json = tools.requestJsonRs(url,params);
	$("#datagrid").datagrid("reload");
</script>
<script>
function openScanGun(){
	document.getElementById("ScanGun").Port = "Com10";
	document.getElementById("ScanGun").Open();
}	

function closeScanGun(){
	document.getElementById("ScanGun").Close();
}
</script>
</body>
</html>
