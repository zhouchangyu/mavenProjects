<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
%>
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
<%@ include file="/header/upload.jsp"%>
<title>文稿登记及审签</title>
<script type="text/javascript" src="<%=contextPath %>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath %>/system/core/person/js/person.js"></script>
<script type="text/javascript" >
//从token中获取到三个重要数据
var runId = "";
var frpSid = "";
var flowId = "";
function doInit(){
	initData();//基础数据
	showData();//办理情况数据
	showblyj();//领导审批意见
}
function initData(){
	var param={runId:runId}
	var url = contextPath + "/flowRun/getFlowRunDatas.action";
	var json = tools.requestJsonRs(url,param);
	if(json.rtState){
		var flowRunData = json.rtData;
		//var flowRunData.DATA_10;//标题
		/* $("#lwbt").text(isNull(flowRunData.DATA_30));//来文标题
		$("#lwdw").text(isNull(flowRunData.DATA_53));//来文单位
		$("#hj").text(isNull(flowRunData.DATA_40));//缓急
		$("#mj").text(isNull(flowRunData.DATA_41));//密级
		$("#bllx").text(isNull(flowRunData.DATA_55));//办理类型
		$("#nbyj").text(isNull(flowRunData.DATA_33));//拟办意见
		$("#ldyj").text(isNull(flowRunData.DATA_34));//领导意见
		$("#blqk").text(isNull(flowRunData.DATA_35));//办理情况
		$("#csdw").text(isNull(flowRunData.DATA_53));//呈送单位
		$("#csr").text(isNull(flowRunData.DATA_44));//呈送人
		$("#cssj").text(isNull(flowRunData.DATA_45));//呈送时间 */
		 bindJsonObj2Cntrl(json.rtData,null);
	}
}
function isNull(value){
	if(value==null){
		return "";
	}
	return value;
}

//保存流程数据的实体
function saveFlowRunData(flag,parentCallback){
	
	//回调方法
	parentCallback();
}
//显示办理情况
function showData(){
	var url=contextPath+"/teeDocType/getDataByRunId.action";
	 var param={runId:runId};
	    var json = tools.requestJsonRs(url,param);	
			if(json.rtState){
	            var lists = json.rtData;
	            var html ="";
	            $("#addContent").attr("style","");
	            for(var k=0;k<lists.length;k++){
	                var td ="";
	                if(k==0){
	                    td="<table class='innerTable' width='70%' style='font-family: 宋体;font-size: 18px;' border=0 cellspacing=0 cellpadding=0 ><tr><td  style='border:none'>情况显示:</td>";
	                }else{
	                    td="<tr><td style='border:none'></td>";   
	                }
	                var list =lists[k];
	              
	                html += td+"<td  style='border:none' >" +isNull(list.CONTENT)+"</td><td style='border:none'>"+isNull(list.USERNAME)+"</td><td style='border:none'>"+isNull(list.REGISTDATE)+"</td></tr>";
	               
	            }
	               $("#addContent").append(html+"</table>");
	        }
}
//显示领导办理意见
function showblyj(){
	var json = tools.requestJsonRs(contextPath+"/flowRun/getClyjList.action?runId="+runId,{});
	var lists = json.rtData;
      var html ="";
      $("#ldyj").attr("style","");
      for(var k=0;k<lists.length;k++){
          var td ="";
          var list =lists[k];
          html += td+"<td  style='border:none' >" +isNull(list.YPYJ)+"</td><td style='border:none'>"+isNull(list.YPR_NAME)+"</td><td style='border:none'>"+isNull(list.YPRQ)+"</td></tr>";
      }
         $("#ldyj").append(html+"</table>"); 
}

</script>
<style type="text/css" >
.table-d table{ background:#F00;margin-top:30px;border-collapse:collapse;font-size:14px;height:20px} 
.table-d table td{ background:#FFF ;padding:10px 0px 10px 15px;border:1px solid red;height:34px;} 
div{ width:100%; height:100%;text-align:-webkit-center}
h1 {color:#F00;	text-align:center;padding-top:20px;}
input[type=text], textarea {width: 85%;}
</style>
</head>
<body  onload="doInit()" > 
			<h1 >公文呈批单</h1>
<div class=" "  >
 <form action="">
 	<div id="formDiv"  class="table-d">
	
	<table class=" " border="0"  cellspacing="1" cellpadding="0" align="center" style="" width="70%" height="100%">
		<tr>
			<td  class="" width="">来文标题：</td>
			<td  class="" id="" colspan="9">
				<!-- <input type="text" name="tpId" id="tpId" class=""  required="true"   /> -->
			    <span id="DATA_30"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">来文单位：<span style=""></span></td>
			<td  class="" id="">
				 <span id="DATA_53"></span>
			</td>
			<td  class="">缓急：</td>
		    <td style="width:90px"  class="">
		     <span id="DATA_40"></span>
		    </td>
		    <td  class="" width="">密级：<span style=""></span></td>
			<td  class="" id="" colspan="3">
			 <span id="DATA_41"></span>
 			</td>
			<td  class="" width="">办理方式：<span style=""></span></td>
			<td style="width:90px" class="" id="" colspan="3">
				 <span id="DATA_55"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">拟办意见：<span style=""></span></td>
			<td  class="" id="" colspan="9">
				 <span id="DATA_33"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">领导意见：<span style=""></span></td>
			<td  class="" id="ldyj" colspan="9">
			</td>
		</tr>
		<tr>
			<td  class="" width="">办理情况：<span style=""></span></td>
			<td  class="" id="addContent" colspan="9" >
				 <span id="DATA_35"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">呈送单位：<span style=""></span></td>
			<td  class="" id="">
				 <span id="DATA_53"></span>
			</td>
			 
		    <td  class="" width="">呈送人：<span style=""></span></td>
			<td  class="" id="" colspan="3">
				 <span id="DATA_44"></span>
			</td>
			<td  class="" width="">呈送时间：<span style=""></span></td>
			<td  class="" id="" colspan="3">
				 <span id="DATA_45"></span>
			</td>
		</tr>
	
	</table>
	</div>
 </form>
 </div>
</body>
</html>