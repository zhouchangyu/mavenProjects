<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String id = request.getParameter("id")==null ? "0" : request.getParameter("id");
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
<title>添加类别</title>

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
var id = '<%=id%>';
function doInit(){
	if(typeof(id)!='undefined'){
		var url = contextPath+"/docParentType/getParentById.action";
		var para = {id:id};
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			$(".uuid").attr("value",jsonRs.rtData.id);
			$("#parentName").attr("value",jsonRs.rtData.parentName);
			$("#sortId").attr("value",jsonRs.rtData.sortId);
		}
	}
	 
}
 

/**
 * 保存
 */
function doSave(){
	if (check()){
		var url = "<%=contextPath%>/docParentType/addOrUpdate.action";
		var para =  tools.formToJson($("#form1")) ;
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			top.$.jBox.tip(jsonRs.rtMsg, 'info' , {timeout:2000});
			//window.opener.location.reload();
	       // window.location.reload();
			 
			return true;
		}else{
			alert(jsonRs.rtMsg);
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
	$("#name_id_msg").html("<img src='" +stylePath + "/imgs/loading_16.gif' align='absMiddle'> 检查中，请稍候……");
	chekSeq(value);
}
function chekSeq(value){
	var url = contextPath + "/docParentType/checkSeqExist.action";
	var para = {parentName:value};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		$("#name_id_msg").html("<img src='" + stylePath + "/imgs/correct.gif' align='absMiddle'>");
	}else{
		 $("#name_id_msg").html("<img src='" + stylePath + "/imgs/error.gif' align='absMiddle'> 此类型已经存在");
		 document.form1.parentName.focus();
	}
}

</script>

</head>
<body onload="doInit()">
 
	<form  method="post" name="form1" id="form1" >
		<table class="TableBlock tableBlock" width="95%" align="center">
	
		   <tr>
		    <td nowrap class="TableHeader" colspan="2" style='vertical-align: middle;'> <span  class="Big3">文种类别录入</span></td>
		   </tr>
		   <tr>
		  	<input id="parentId" name="id" type="hidden" class="uuid"  value="0" />
		    <td nowrap class="TableData" width="120">类别名称：<span style=""></span></td>
		    <td nowrap class="TableData">
		    <!--  onBlur="check_seq(this.value)" -->
		        <input type="text" name="parentName" id="parentName" class="easyui-validatebox BigInput"  required="true"  size="15" maxlength="20" />&nbsp;<span id="name_id_msg"></span> 
		    </td>
		   </tr>
		    <tr>
		    <td nowrap class="TableData" width="120">排序号：<span style=""></span></td>
		    <td nowrap class="TableData">
		        <input type="text" name="sortId" id="sortId" class="easyui-validatebox BigInput"  required="true"  size="15"  validType ='integeZero[]' ></input>
		    </td>
		   </tr>
		</table>
	 </form>
</body>
</html>
