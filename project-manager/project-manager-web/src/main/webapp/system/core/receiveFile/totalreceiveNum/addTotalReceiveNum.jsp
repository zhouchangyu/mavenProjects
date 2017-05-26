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
		var url = contextPath+"/formReceiveData/gettotalDataById.action";
		var para = {id:id};
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			$(".uuid").attr("value",jsonRs.rtData.id);
			$("#name").attr("value",jsonRs.rtData.name);
			$("#userNames").val(jsonRs.rtData.userNames);
			$("#sortId").attr("value",jsonRs.rtData.sortId);
		}
	}
	 
}
 

/**
 * 保存
 */
function doSave(){
	if (check()){
		var url = "<%=contextPath%>/formReceiveData/totaladdorUpdate.action";
		var para =  tools.formToJson($("#form1")) ;
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			 
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
 
 
</script>

</head>
<body onload="doInit()">
 
	<form  method="post" name="form1" id="form1" >
		<table class="TableBlock tableBlock" width="95%" align="center">
	
		   <tr>
		    <td  class="TableHeader" colspan="2" style='vertical-align: middle;'> <span  class="Big3">来文字号</span></td>
		   </tr>
		   <tr>
		  	<input id="id" name="id" type="hidden" class="uuid"  value="0" />
		    <td  class="TableData" width="120">总来文字号名称：<span style=""></span></td>
		    <td  class="TableData">
		    <!--  onBlur="check_seq(this.value)" -->
		        <input type="text" name="name" id="name" class="easyui-validatebox BigInput"  required="true"  size="15" maxlength="20" style="width:75%;" /> 
		    </td>
		   </tr>
		    <tr>
		    <td  class="TableData" width="120">授权：<span style=""></span></td>
		    <td  class="TableData">
		   		<textarea  name="userNames" id="userNames" style="height:50px;width:75%;"></textarea>
	    		<input type="hidden" id="priv" name="priv" />
	    	    <a href="javascript:void(0)" onclick="selectUser(['priv','userNames'])">选择</a>
		   	
		    </td>
		   </tr>
		    <tr>
		    <td  class="TableData" width="120">排序号：<span style=""></span></td>
		    <td  class="TableData">
		        <input type="text" name="sortId" id="sortId" style="width:75%;"  class="easyui-validatebox BigInput"  required="true"  size="15"  validType ='integeZero[]' ></input>
		    </td>
		   </tr>
		</table>
	 </form>
</body>
</html>
