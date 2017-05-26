<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/userheader.jsp"%>
<%@ include file="/header/easyui.jsp"%>
<%@ include file="/header/upload.jsp" %>
<title>编辑文种信息</title>
<style type="text/css">
.imgMiddle{
	float:left;
	margin-top:5px;
}
.imgMiddleSpan{
	float:left;
	margin-top:4px;
}
</style>
<script type="text/javascript" src="<%=contextPath %>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath %>/system/core/person/js/person.js"></script>


<script type="text/javascript">

var seq = '';
var modelId =''
var uuid =''
var num = new Date().getTime().toString().substring(4);
function doInit(){
	//展示类型下拉
	/* var url = contextPath+"/docParentType/getAllListSelect.action";
	var json = tools.requestJsonRs(url,null);	
	if(json.rtState){
		for(var i=0;i<json.rtData.length;i++){
			$("#parentType").append("<option value='"+json.rtData[i].parentName+"'>"+json.rtData[i].parentName+"</option>");
		}
	
	} */
	//展示编号值
	 /* var url= contextPath+'/cusNumberController/datagrid.action'
	var json = tools.requestJsonRs(url,null);	
	if(json.total>0){
		for(var i=0;i<json.total;i++){
			$("#autoNumberId").append("<option value='"+json.rows[i].uuid+"'>"+json.rows[i].userSetName+"</option>");
		}
	
	} */  
	
	//单附件简单上传组件
	new TeeSingleUpload({
		uploadBtn:"pubUpfile",
		callback:function(json){//回调函数，json.rtData
			$("#attachId").val(json.rtData[0].sid);
			alert("上传成功");
		},
		post_params:{model:"docType"}//后台传入值，model为模块标志
	});
	
	if(seq!='undefined'){
		showData();//展示基本数据
	}
  var para = {runId:num};  
}
/**
 * 编辑时展示数据
 */
function showData(){
	var url = contextPath+"/teeDocType/getDoctypeBySeq.action";
	var para  = {seq:seq};
	var json = tools.requestJsonRs(url,para);
	if(json.rtState){
		$("#seq").attr("value",json.rtData.seq);
		$("#seq_1").hide();  
		$("#seq_bak").attr("value",json.rtData.seq);
		$("#typeName").attr("value",json.rtData.typeName);
		$("#parentType").attr("value",json.rtData.parentType);
		$("#startFlow").attr("value",json.rtData.startFlow);
		$("#startFlowId").attr("value",json.rtData.startFlowId);
		$("#autoNumberId").attr("value",json.rtData.autoNumberId);
		$("#wordType").attr("value",json.rtData.wordType); 
		$("#sortId").attr("value",json.rtData.sortId);
		$("#autoNumberId").attr("value",json.rtData.autoNumberId);
		$("#autoNumber").attr("value",json.rtData.autoNumberName);
		$("#attachId").attr("value",json.rtData.attachId);
		$("#bt").attr("value",json.rtData.bt);
		$("#ztc").attr("value",json.rtData.ztc);
		$("#zs").attr("value",json.rtData.zs);
		$("#priv").attr("value",json.rtData.priv);
		$("#privDesc").val(json.rtData.privDesc);
		$("#seq_2").show();
		
	}else{
		
	}
}

/**
 * 保存
 */
function doSave(){
	if (check()){
		var url = "<%=contextPath%>/teeDocType/addOrUpdate.action";
		var para =  tools.formToJson($("#form1")) ;
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs!==null){
			if(jsonRs.rtState){
				top.$.jBox.tip(jsonRs.rtMsg, 'info' , {timeout:2000});
				//window.opener.location.reload();
		          parent.window.location.reload();
				return true;
			}else{
				alert(jsonRs.rtMsg);
			}
		}
	}
}

function check() {
	var checkStatus =  $("#form1").form('validate'); 
	if(checkStatus == false ){
		return checkStatus;
	}
	return true;
	
}
 
/**
 * 检查用户是否存在
 */
function check_seq(value)
{
	if(value=="")
	{
		return;	
	}	     
	$("#seq_id_msg").html("<img src='" +stylePath + "/imgs/loading_16.gif' align='absMiddle'> 检查中，请稍候……");
	chekSeq(value);
}
function chekSeq(value){
	var url = contextPath + "/teeDocType/checkSeqExist.action";
	var para = {seq:value};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		$("#seq_id_msg").html("<img src='" + stylePath + "/imgs/correct.gif' align='absMiddle'>");
	}else{
		 $("#seq_id_msg").html("<img src='" + stylePath + "/imgs/error.gif' align='absMiddle'> 此已序号存在");
		 document.form1.seq.focus();
	}
}
function openWorkFlow(){
	var url = "/system/core/docType/selectDocType/worlFlowTree.jsp"	;
	bsWindow(url,"添加流程",{width:"400",height:"200",submit:function(v,h){
		if(v=="ok"){
			var cw = h[0].contentWindow;
			if(cw.commit()){
				//top.$.jBox.tip("成功添加文种类型","success");
				//cw.location.reload();
				return true;
			}
		}
		return false;
	}});
}
 
</script>

</head>
<body onload="doInit()">
<form  method="post" name="form1" id="form1" >
	<table class="TableBlock tableBlock" width="95%" align="center">

	   <tr>
	    <td nowrap class="TableHeader" colspan="2" style='vertical-align: middle;text-align:center;'> <span  class="Big3">文种录入</span></td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData" width="120">序号：<span style=""></span></td>
	    <td nowrap class="tableData" id="seq_1">
	        <input type="text" class="BigInput" name="seq" id="seq"  required="true"  size="20" maxlength="20" onBlur="check_seq(this.value)" validType ='integeZero[]' />&nbsp;<span id="seq_id_msg"></span> 
	    </td>
	    <td nowrap class="tableData" id="seq_2" style="display:none">
	        <input type="text" name="seq_bak" id="seq_bak" class="easyui-validatebox BigInput"     size="20" maxlength="20" disabled="disabled" /> 
	    </td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData">类型名称：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="typeName" id="typeName" size="20" maxlength="20" class="easyui-validatebox BigInput"  required="true" value=''/>
	         </td>
	   </tr>
		<tr >
	   <td nowrap class="tableData">模板文件名：</td>
			<td class="tableData"  style="font-size:12px">
				<div id="pubUpfile" class="add_swfupload"   style="font-size:12px">
					<a href="javascript:void(0)"  ><span style="font-size:12px"  >添加附件</span></a>
				</div>
				<input type="hidden" id="attachId" name="attachId" />
			</td>
		</tr>
	    <tr>
	    <td nowrap class="tableData"  >类别：</td>
			<td nowrap  id="linkage">
			<input type="text" name="parentType" id="parentType"  url="/docParentType/getAllListSelect.action" class="BigInput cascadingInput" onkeyup="likeQuery(this.value,$(this).parent('.cascadingTd'))" required="true"  size="20" maxlength="20" value="" />
	    </td> 
	   </tr>
	    <tr>
	    <td nowrap class="tableData">启动流程：</td>
	    <td nowrap class="tableData">
	        <input type="text" name="startFlow" id="startFlow" class="easyui-validatebox BigInput" size="20"  maxlength="15"   required="true" value='' />&nbsp;
	        <input type="hidden" name="startFlowId" id="startFlowId" class="easyui-validatebox BigInput" size="15"  maxlength="15"    value='' />&nbsp;
	        <a onclick="openWorkFlow()" style="cursor:pointer;"><span style="font-size:12px;" >添加流程</span></a>
	    </td>
	   </tr>
	     
	   <tr>
	    <td nowrap class="tableData">发文字：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="wordType" id="wordType" size="20" maxlength="20" class="easyui-validatebox BigInput"  value=''/>
	         </td>
	   </tr>
	   <tr>
	   <td nowrap class="tableData"  >编号值：</td>
			<td nowrap  id="linkage">
			<input type="text" name="autoNumber" id="autoNumber"  url="/cusNumberController/datagridByLike.action" class="BigInput cascadingInput" onkeyup="likeQuery(this.value,$(this).parent('.cascadingTd'))" required="true"  size="20" maxlength="20" value=""  />
	   		<input type="hidden" name="autoNumberId" id="autoNumberId"></input>
	    </td> 
	   </tr>
	   <tr>
	    <td nowrap class="tableData">排序号：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="sortId" id="sortId" size="20" maxlength="20" class="easyui-validatebox BigInput"    value=''/>
	         </td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData">标题：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="bt" id="bt" size="20" maxlength="20" class="BigInput"    value=''/>
	         </td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData">主题词：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="ztc" id="ztc" size="20" maxlength="20" class="BigInput"    value=''/>
	         </td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData">主送：</td>
	    <td nowrap class="tableData">
	    <input type="text" name="zs" id="zs" size="20" maxlength="20" class="BigInput"    value=''/>
	         </td>
	   </tr>
	   <tr>
	    <td nowrap class="tableData">授权：</td>
	    <td nowrap class="tableData">
	    	<textarea readonly name="privDesc" id="privDesc" style="height:100px;width:500px"></textarea>
	    	<input type="hidden" id="priv" name="priv" />
	    	<a href="javascript:void(0)" onclick="selectDept(['priv','privDesc'])">选择</a>
	     </td>
	   </tr>
	</table>
  </form>
</body>
</html>
