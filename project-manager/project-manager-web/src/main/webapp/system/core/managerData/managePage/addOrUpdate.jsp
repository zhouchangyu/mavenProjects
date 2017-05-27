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
<title>信访件查询</title>
<script type="text/javascript" src="<%=contextPath %>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath %>/system/core/person/js/person.js"></script>
<script type="text/javascript">
function doInit(){

}
 
//信访目的
function showObjective(){
	var url = contextPath+"/teeRelevantDoc/getDataAndObjective.action";
	var json = tools.requestJsonRs(url,null);
	if(json.rtState){
		for(var i=0;i<json.rtData.length;i++){
			$("#objective").append("<option value='"+json.rtData[i].caption+"'>"+json.rtData[i].caption+"</option>");
		}
	}
}
 
 function selected(){
	    var ids = [];
	    var rows = $('#datagrid').datagrid('getSelections');
	    for(var i=0; i<rows.length; i++){
	    	ids.push(rows[i].tpeventid);
	    }
	    var ids_ = ids.join('');
 }
  
 function checkNull(value){
	 if(value==null || typeof value =="undefined"){
		 return "";
	 }
	 return value;
 }
 //清空查询条件
 function doReset(){
	 document.getElementById("form").reset();
 }
</script>
</head>
<body onload="doInit()" style="overflow:auto;"   class="tableBlock"  fit="true">


	<form  method="post" name="form" id="form" >
		<table class="tableBlock"  >
	   <tr>
		    <td >客户名称 </td>
		    <td class="tableBg">
		    	<input type="text" name="customername" id="customername" class="tableInput" />
		    </td>
		    <td >日期：</td>
		    <td class="tableBg">
				<input type="text" name="datetime" id="datetime" class="tableInput"   onClick="WdatePicker()"/>
		    </td>
	   </tr>
	   <tr>
	    <td >卸气点\用气单位：</td>
		<td  class="tableBg" >
	    	<input type="text" name="address" id="address"  class="tableInput" />
	    </td>
	   	<td  width="120" id="">采购吨价：</td>
		<td class="tableBg" id="linkage">
			<input type="text" name="buytonprice" id="buytonprice"   class="tableInput" required="true"  size="20" maxlength="20"  />
	   	</td>
	   </tr>
	   <tr>
	    <td >供应商/承运商：</td>
	     <td  class="tableBg" id="">
			<input type="text" name="businessname" id="businessname"  class="tableInput"   required="true"  size="20" maxlength="20"  />
	    </td>
	     <td >销售吨价：</td>
	    <td class="tableBg">
			<input type="text" name="saletonprice" id="saletonprice" class="tableInput"  />
	    </td> 
	   </tr>
	   <tr>
	    <td >车号：</td>
	     <td  class="tableBg" id="">
			<input type="text" name="carnum" id="carnum" class="tableInput" required="true"  size="20" maxlength="20"  />
	    </td>
	      <td >运距（km)：</td>
	    <td class="tableBg" id="">
			<input type="text" name="distance" id="distance" class="tableInput" required="true"  size="20" maxlength="20"  />
	    </td>
	   </tr> 
	   <tr>
		    <td >单价：</td>
		    <td class="tableBg">
				<input type="text" name="price" id="price" class="tableInput"   onClick="WdatePicker()"/>
		    </td>
		   
		   <td> 运费 </td>
		   <td class="tableBg">
		   		<input type="text" name="freight" id="freight"    class="tableInput" onClick="WdatePicker()"/>
		   </td>
	   </tr>
	   <tr>
	   		<td >装车量：</td>
	    	<td class="tableBg">
				<input type="text" name="putinamount" id="putinamount"  class="tableInput"  onClick="WdatePicker()" />
	   		</td>
		    <td> 卸车量</td>
		   	<td class="tableBg">
		    	<input type="text" name="putoutamount" id="putoutamount"  class="tableInput" onClick="WdatePicker()" />
		    </td>
	   </tr>
	   <tr>
		    <td  width="120">结算量：</td>
			<td nowrap class="tableBg" id="linkage">
				<input type="text" name="endamount" id="endamount"  class="tableInput" required="true"  size="20" maxlength="20"  />
			</td>
			<td  width="120">采购合计：</td>
			<td class="tableBg" id="">
				<select name="totalbuy" id="totalbuy" class="tableSelect"  >
				 <option></option>
		   		</select>
			</td>
	    </tr> 
	 
	  
	 
	    <tr>
		    <td  width="120">销售合计：</td>
			<td  class="tableBg">
				<input type="text" name="totalsale" id="totalsale" class="tableInput" required="true" size="20" maxlength="20" />
			</td>
			<td >已回款：</td>
	    	<td class="tableBg">
				<input type="text" name="backpayment" id="backpayment"  class="tableInput"  required="true" size="20" maxlength="20" />
			</td>
		</tr>
	    <tr>
	     	<td  width="120">销售人：</td>
			<!-- <td nowrap  id="linkage">
			<input type="text" name="tpMode" id="tpMode"  url="/teeRelevantDoc/getTpSituation.action" class="tableInput cascadingInput" onkeyup="likeQuery(this.value,$(this).parent('.cascadingTd'))" required="true"  size="20" maxlength="20"  />
	    </td> -->
	    <td class="tableBg"  id="">
			<select name="sales" id="sales" class="tableSelect"  >
			 <option></option>
	   		</select>
			</td>
		<td >登记人：</td>
		<td class="tableBg">
			<input type="text" name="registrant" id="registrant" class="tableInput"  />
	    </td>
	    </tr>
	    <tr>
		    <td  width="120">成本：</td>
			<td class="tableBg">
				<input type="text" name="cost" id="cost"  class="tableInput" required="true"  size="20" maxlength="20"  />
			</td>
			<td  width="120">利润：</td>
			<td class="tableBg" id="">
				<select name="profit" id="profit" class="tableSelect"  >
				 <option></option>
		   		</select>
			</td>
	    </tr>  	
	 <tr>
	 	<td  width="120">总利润：</td>
			<td  class="" id="">
				<input type="text" name="totalprofit" id="totalprofit"  class="tableInput" required="true"  size="20" maxlength="20"  />
			</td>
	 </tr>
	 
	</table>
	 </form>
	 <div id="toolbar">
	<!-- <table class=" whiteTable" width="100%" align="center">
		<tr>
		    <td nowrap  class="TableControl" colspan="2" align="center" style=" text-align: center;">
		        <input type="button" value="查询" class="btn btn-primary" title="查询" onclick="getDataByCd()" />&nbsp;&nbsp;
		        <input type="reset" value="清空查询条件" class="btn btn-primary" title="清空查询条件" onClick="doReset()"/>
		   		<input type="button" value="打开" class="btn btn-primary" title="打开" onclick="openDetailWindow()" />&nbsp;&nbsp;
		        <input type="hidden" value="引入" class="btn btn-primary" title="引入" onClick="importfile()"/>
		        <input type="button" value="显示/隐藏条件" class="btn btn-primary" title="显示/隐藏条件" onclick="hideAndShow()" />&nbsp;&nbsp;
		    </td>
		</tr>
	</table> -->
	</div>
	<table id="datagrid" fit="true"></table>
</body>
</html>
