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

var id = '';
var uuid =''
var num = new Date().getTime().toString().substring(4);
function doInit(){
		if(id!="undefined"){//如果id不等于0 则证明是修改数据
			showData();
		}
	}
/**
 * 编辑时展示数据
 */
function showData(){
	var url = contextPath+"/docAndType/getDataById.action";
	var para  = {id:id};
	var json = tools.requestJsonRs(url,para);
	if(json.rtState){
		$("#id").attr("value",json.rtData.id);
		$("#tpMode").attr("value",json.rtData.tpMode);//信访形式
		$("#typeName").attr("value",json.rtData.typeName);//类型名称
		$("#docType").attr("value",json.rtData.docType);//文种类型
		$("#docTypeId").attr("value",json.rtData.docTypeId);//文中类型Id
		$("#sortId").attr("value",json.rtData.sortId);//排序
	}else{
		
	}
}

/**
 * 保存
 */
function doSave(){
	if (check()){
		var url = "<%=contextPath%>/docAndType/addOrUpdateDoc.action";
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
function openWorkFlow(){
	var url = "/system/core/docType/docAndType/selectSingleDocType.jsp"	;
	bsWindow(url,"添加流程",{width:"700",height:"500",submit:function(v,h){
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
	    <td  class="TableHeader" colspan="2" style='vertical-align: middle;text-align:center;'> <span  class="Big3">文种类型维护</span></td>
	   </tr>
	   <tr>
	    <td  class="tableData">信访形式：</td>
	    <td  class="tableData">
	    <input type="hidden" name="id" id="id" value="0" />
	    <input type="text" name="tpMode" id="tpMode" size="20" maxlength="20" class="easyui-validatebox BigInput"  required="true" value=''/>
	     </td>
	   </tr>
	    <tr>
	    <td  class="tableData">类型名称：</td>
	    <td  class="tableData">
	    <input type="text" name="typeName" id="typeName" size="20" maxlength="20" class="easyui-validatebox BigInput"  required="true" value=''/>
	         </td>
	   </tr>
	    <tr>
	    <td  class="tableData">文种类别：</td>
	    <td  class="tableData">
	        <input type="text" name="docType" id="docType" class="easyui-validatebox BigInput" size="20"  maxlength="15"   required="true" value='' />&nbsp;
	        <input type="hidden" name="docTypeId" id="docTypeId" class="easyui-validatebox BigInput" size="15"  maxlength="15"    value='' />&nbsp;
	        <a onclick="openWorkFlow()" style="cursor:pointer;"><span style="font-size:12px;" >添加流程</span></a>
	    </td>
	   </tr>
	    <tr>
	    <td  class="tableData">排序号：</td>
	    <td  class="tableData">
	    <input type="text" name="sortId" id="sortId" size="20" maxlength="20" class="easyui-validatebox BigInput"  required="true" value=''/>
	         </td>
	   </tr>
	</table>
  </form>
</body>
</html>
