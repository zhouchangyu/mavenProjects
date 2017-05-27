<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/easyui.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>

<title>数据管理</title>
<script type="text/javascript">
function doInit(){
	//密级	
	//getSysCode("DOC_MJ","dense");
	//缓急程度
	//getSysCode("DOC_JJCD","urgency");
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
					{field:'id',checkbox:true},
					{field:'customername',title : '客户名称',width:100},
					{field:'datetime',title : '日期',width:100},
					{field:'address',title : '卸气点\用气单位',width:100},
					{field:'buytonprice',title : '采购吨价',width:100},
					{field:'businessname',title : '供应商/承运商',width:100},
					{field:'saletonprice',title : '销售吨价',width:100},
					{field:'carnum',title : '车号',width:100},
					{field:'distance',title : '运距（KM）',width:100},
					{field:'price',title : '单价',width:100},
					{field:'freight',title : '运费',width:100},
					{field:'putinamount',title : '装车量',width:100},
					{field:'putoutamount',title : '卸车量',width:100},
					{field:'endamount',title : '结算量',width:100},
					{field:'totalbuy',title : '采购合计',width:100},
					{field:'totalsale',title : '销售合计',width:100},
					{field:'backpayment',title : '已回款',width:100},
					{field:'sales',title : '销售人',width:100},
					{field:'cost',title : '成本',width:100},
					{field:'profit',title : '利润',width:100},
					{field:'totalprofit',title : '总利润',width:100}
	 			/* {
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
				} */
			 ];
	var url = contextPath+"/maoyi/getList.action";
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
			insertData(rowData.id)
			//	openFullWindow("/flowRun/toUrl.action?runId="+rowData.RUNID+"&frpSid="+rowData.FRPSID+"&flowId="+rowData.FLOWID,'工作流办理');
				//openFlowRun(rowData.RUNID,rowData.FRPSID);
		},
		singleSelect:false,
		pagination : true,
		columns : [column]
	});
}
//添加数据
function insertData(id){
		/* window.openFullWindow("url", "流程办理");
		window.location.reload(); */
	var url = "/system/core/managerData/managePage/addOrUpdate.jsp?id="+id;
	bsWindow(url,"添加",{width:"1000",height:"500",submit:function(v,h){
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
//打开流程详情
function openFlowRun(runid,frpSid){
	window.openFullWindow(contextPath+"/system/core/receiveFile/descIndex/formTabList.jsp?runId="+runid+"&frpSid="+frpSid+"&view=1", "流程办理");
}
function openData(){
	
}
function exportExcel(){
	var rows = $("#datagrid").datagrid('getSelections');
	if(rows.length==0){
		if(confirm("是否确认导出所有查询结果？")){
			//导出所有的查询结果
			$("#frame0").attr("src",contextPath+"/maoyi/exportExcelRece.action");
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
<body onload="doInit();"  fit="true" >
	<table id="datagrid" fit="true"></table>
	<div id="toolbar">
	<div class="title">
			<div class="titleName">数据管理</div>
			<div class="btns">
				<input class="btn_default" onclick="insertData();" type="button" value="录入" />
				<input class="btn_default" onclick="send()" type="button" value="修改" />
				<input class="btn_default" onclick="openData()" type="button" value="打开" />
				<input class="btn btn-danger" onclick="destory()" type="button" value="删除" />
				<input class="btn_default" onclick="refresh();" type="button" value="刷新" />
				<input class="btn_default" onclick="doSearch()" type="button" value="查询" />
				<input class="btn_default btn_logo"  style= "background-image: url(/common/zt_webframe/dist/img/innerPageIframe/print.png);" type="button" onclick="exportExcel()" value="导出" />
			</div>
		</div>
		<form id="form1" name="form1" method="post">
	<table style="width:100%;font-size:12px" align="center" class="tableBlock">
		<tr>
			<td >客户名称：</td>
			<td class="TableBG"><input id="title" name="title" type="text" class="tableInput"  style="width:120px"/></td>
			<td >车号：</td>
			<td class="TableBG">
				<input id="RECEIVEDOCID" name="RECEIVEDOCID" type="text" class="tableInput"   style="width:120px"/>
			</td>
			<td >销售人：</td>
			<td class="TableBG">
			<input id="RECEIVEDOCID" name="RECEIVEDOCID" type="text" class="tableInput"   style="width:120px"/>
			</td>
		</tr>
		<tr>
			<td >日期开始时间：</td>
			<td class="TableBG">
			<input type="text" id='endTimeDesc' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name='endTimeDesc' class="Wdate BigInput easyui-validatebox" style="width:120px;"/>
			
			</td>
			<td >日期结束时间：</td>
			<td class="TableBG">
				<input type="text" id='endTimeDesc' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name='endTimeDesc' class="Wdate BigInput easyui-validatebox" style="width:120px;"/>
			</td>
			 
		</tr>
	</table>
	</form>
		</div>
	<iframe id="frame0" style="display:none"></iframe>
 
</body>
</html>
