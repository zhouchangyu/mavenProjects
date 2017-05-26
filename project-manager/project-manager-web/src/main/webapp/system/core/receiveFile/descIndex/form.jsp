<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String runId = request.getParameter("runId");
	String frpSid = request.getParameter("frpSid");
	TeePerson loginPerson = (TeePerson)request.getSession().getAttribute(TeeConst.LOGIN_USER);
	int uuid =loginPerson.getUuid();
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
</script>
<style type="text/css" >
.table-d {  margin-top:30px;table-layout:fixed ;border:solid #000; border-width:1px 0px 0px 1px;} 
.table-d   td{  padding-left:15px;height:50px; word-wrap:break-word;border:solid #000; border-width:0px 1px 1px 0px; } 
.table-c {  margin-top:30px;table-layout:fixed ; border-width:0px 0px 0px 0px;  } 
.table-c  td{  padding-left:15px;height:50px; word-wrap:break-word; border-width:0px 0px 0px 0px; } 
div{ width:100%; height:100%;text-align:-webkit-center}
h1 {color:#000;	text-align:center}
input[type=text], textarea {width: 85%;} 	
.table-d{
	border-color:red;
}
.table-d td{
	border-color:red;
	font-size:18px;
	font-family:宋体;
}
</style>
<script type="text/javascript">
var runId = '<%=runId%>';
var frpSid = '<%=frpSid%>';
 function doInit(){
	 //初始化表单数据
	 initData();
	 showContent();
	 showblyj;//领导拟办意见
 }
 function initData(){
	var param={runId:runId}
	var url = contextPath + "/flowRun/getFlowRunDatas.action";
	var json = tools.requestJsonRs(url,param);
	 if(json.rtState){
		 bindJsonObj2Cntrl(json.rtData,null);
	 }
 }
 function showContent(){
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
       $("#DATA_33").attr("style","");
       for(var k=0;k<lists.length;k++){
           var td ="";
           var list =lists[k];
           html += td+"<td  style='border:none' >" +isNull(list.YPYJ)+"</td><td style='border:none'>"+isNull(list.YPR_NAME)+"</td><td style='border:none'>"+isNull(list.YPRQ)+"</td></tr>";
       }
          $("#DATA_33").append(html+"</table>"); 
 }
 function isNull(value){
	    if(value==null||typeof value=="undefined"){
	        return "";
	    }
	    return value;
	}
</script>
</head>
<body onload="doInit()"> 
<h1 style="margin-top:20px;color:red;font-size:36px;">国家信访局收文处理单</h1>
	<table  frame="void" class="table-d" border="1"  cellspacing="0" cellpadding="0" align="center" style="" width="70%" >
		<tr>
			<td  class="" width="14%"  >总收文文号：<span style=""></span></td>
			<td  class="" id=""  width="11%" >
				<span  name="DATA_47"></span>
				 <span  name="DATA_48"></span>
			</td>
			<td  class="" width="14%"  >办理类型：<span style=""></span></td>
			<td  class="" id=""  width="11%" >
				<span  name="DATA_55"></span>
				 
			</td>
			<td  class=""  width="14%" >收文日期：</td>
		    <td  class=""  width="11%" >
 				<span  name="DATA_43"></span>
 		    </td>
 		    <td  class="" width="14%"  >密级：</td>
			<td  class="" id=""  width="11%" >
				<span  name="DATA_41"></span>
				 
			</td>
		 </tr><tr>
		    <td  class="" width="" >来文字号：</td>
			<td  class="" id="" colspan="3"  >
				<span  name="DATA_61"></span>
				<span  name="DATA_59"></span>
				<span  name="DATA_51"></span>
			</td>
			<td  class="">限办日期：</td>
		    <td  class="">
				<span  name="DATA_8"></span>
		    </td>
		    <td  class="">缓急：</td>
		    <td  class="">
				 <span  name="DATA_40"></span>
		    </td>
		</tr>
		<tr>
			<td  class="" width="">来文单位：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				<span  name="DATA_53"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">主办单位 ：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				<span  name="DATA_13"></span>
			</td>
		</tr>
		<tr>
			<td  class="" width="">会办单位：<span style=""></span></td>
			<td  class="" id="" colspan="3">
				 <p></p>
			</td>
			<td  class="" width="">标题：<span style=""></span></td>
			<td  class="" id="" colspan="3">
				 <span  name="DATA_30"></span>
			</td>
		</tr>
		<!-- <tr height="180px;">
			<td  class="" width="">附件：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				 <p></p>
			</td>
		</tr> -->
		<tr  height="180px;">
			<td  class="" width="">拟办意见：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				 <span  name="DATA_33"></span>
			</td>
		</tr>
		<tr height="180px;">
			<td  class="" width="">领导拟批意见：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				<span  name="DATA_34"></span>
			</td>
		</tr>
		<tr height="180px;">
			<td  class="" width="">办理情况：<span style=""></span></td>
			<td  class="" id="addContent" colspan="7">
				  
			</td>
		</tr>
		<tr >
			<td  class="" width="">注办：<span style=""></span></td>
			<td  class="" id="" colspan="7">
				 <span  name="DATA_28"></span>
			</td>
		</tr>
	</table>
</body>
</html>