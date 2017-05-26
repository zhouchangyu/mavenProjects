<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String moduleId = request.getParameter("moduleId");
if (moduleId == null) {
  moduleId = "";
}
String privNoFlag = request.getParameter("privNoFlag");
if (privNoFlag == null || "".equals(privNoFlag)) {
  privNoFlag = "0";
}
String privOp = request.getParameter("privOp");
if (privOp == null) {
  privOp = "";
}

String objSelectType = request.getParameter("objSelectType");
if (objSelectType == null) {
	objSelectType = "";
}


//人员条件filter，目前工作流需要处理
String userFilter = request.getParameter("userFilter") == null ? "0" : request.getParameter("userFilter")  ;

//回调方法参数
String callBackPara = request.getParameter("callBackPara") == null ? "" : request.getParameter("callBackPara")  ;
callBackPara = callBackPara.replace("\"", "\\\"");


//flowPrcs是TeeFlowProcess的主键  ---暂不起作用
//frpSid是TeeFlowRunPrcs的主键
String flowPrcs = request.getParameter("flowPrcs") == null ? "0" : request.getParameter("flowPrcs")  ;
String frpSid = request.getParameter("frpSid") == null ? "0" : request.getParameter("frpSid")  ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="cache-control" content="no-cache, must-revalidate"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/ztree.jsp"%>
<title>选择文种</title>
<link rel="stylesheet" href ="<%=cssPath %>/org_select.css"/>
<link href="<%=cssPath%>/index1.css" rel="stylesheet" type="text/css" />
<link href="<%=cssPath%>/selectControls.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.form-control{
		float:left;
		float:left;
		width:170px;
		height: 32px;
		text-indent: 8px;
	}
	.input-group-btn{
		float:left;
	}
	.panel {
		border:1px solid #eee;
	}
	.panel:last-child{
		border:1px solid #ddd!important;
	}
	.panel-heading{
		background-color:#f6f6f6;
	}
	.panel-title a{
		color: #333;
	}
	.list-group-item-heading{
		font-size:12px;
	}
	.list-group-item h6{
		/*text-indent: 20px;*/
		font-size:12px;
	}
	.list-group-item{
		text-decoration: none;
	}
	.list-group-item:hover{
		background-color:#5e8bbb;
		color: #fff;
	}
	.list-group-item-header:hover{
		color:#555;
	}
	.list-group-item:hover{
		background-color:#5e8bbb;
		color: #fff;
	}
	.block-right{
		overflow:auto;
		height:314px;
		border: 1px solid #ddd;
	}
	.emptyClass h6{
		font-size:12px;
	}
</style>

<script type="text/javascript" src="<%=contextPath%>/common/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ztree/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/core/orgselect/orgselectWorkFlow.js?version=2"></script>

<script type="text/javascript">
var selectedColor = "rgb(0, 51, 255)";
var RoleId,RoleName;
var moduleId = "<%=moduleId%>";
objSelectType = '<%=objSelectType%>';
var privOp = '<%=privOp%>';
var privNoFlag = "<%=privNoFlag%>";
var userFilter = parent.RANDOM_USER_FILTER;
var callBackPara = "<%=callBackPara%>";
var flowPrcs = "<%=flowPrcs%>";
var frpSid = "<%=frpSid%>";

var parentWindowObj = parent;
var to_id_field ;//父级文本框对象Id
var to_name_field;//父级文本框对象Name
var single_select = true;//是否是单用户选择
var ctroltime=null,key="";

function doInit(){
	to_id_field =  document.getElementById("field_value");
	to_name_field =  document.getElementById("field_name");  
	//获取部门树
    getDeptTree();
	//初始化对象
	 //   dataInit();
}

/***
 * 加载数据 
 * datList: 数据列表
 *  type ：判断是否需要初始化右侧项目 1-不需要 其他-需要
 */
function dataLoadword(dataList,name , type){
	 $("a").remove(".right .list-group-item");
	 $("a").remove(".list-group-item-header");
	 $("div").remove(".block-right-item,.emptyClass");
	 if(typeof dataList!="undefined"){
		 $("#dept_item_0").append("<a class='list-group-item-header' style='padding:8px 15px;cursor:pointer'>" + name + "</a>");
		 for(var i = 0; i < dataList.length; i++){
			var roleId = dataList[i].seq;
			var name = dataList[i].typeName;
		if(roleId != ''){
				 $("#dept_item_0").append("<a class='list-group-item'  style='text-align:center;cursor:pointer'  item_id='"+roleId+ "' item_name='"+name+"'><h6 class='list-group-item-heading'>"+ name +"</h6></a>");
			} 
		 } 
	 }else{
		if(!name){
			name = "已选记录";
		}
		$("#dept_item_0").append("<a class='list-group-item-header'  style='padding:8px 15px;;cursor:pointer'>" + name + "</a>"
			+"<div align='center' class='emptyClass' style='padding-top:5px;'><h6>无相关记录！</h6></div>");
	 }
	 if(type != '1'){
		load_init(); 
	} 
	load_init_item_();//初始化右侧项目
    //默认加载角色选中状态
 	 //  init_item('dept');
}

/**
 * 按条件查询人员
 */
function CheckSend(){
	var kword = document.getElementById("kword");
	var search_icon = document.getElementById("search_icon");
	  if(kword.value=="搜索...")
	     kword.value="";
	  if(kword.value=="" && search_icon.innerHTML =="查询")
	  {
		  search_icon.innerHTML =="查询";
	  }
	  if(key!=kword.value && kword.value!="")
	  {
	     key=kword.value;
	     doSearch(key);
	     
	     if(search_icon.innerHTML =="查询")
	     {   
	    	 search_icon.innerHTML ="清除";
	    	 //alert(search_icon.value);
	    	 search_icon.title="清除关键字";
	    	 search_icon.onclick=function(){
	    		 kword.value='搜索...';
	    		 search_icon.innerHTML ="查询";
	    		 search_icon.title="";
	    		 search_icon.onclick=null;};
	     }
	  }
	  ctroltime=setTimeout(CheckSend,100);
}
/***
 * 按人员ID和用户名模糊查询
 */
function doSearch(value){
	var url = contextPath +  "/teeDocType/getSelectUserBySeqOrAttachId.action";
	var para = {key:value};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		var dataList = jsonRs.rtData;
		dataLoadword(dataList,"查询结果");
		//dataLoad(dataList,jsonRs.rtMsg);
	}else{
		alert(jsonRs.rtMsg);
	} 
}
/**
 * 处理数据
 */
function dataInit(){
	
	if(objSelectType &&objSelectType == '1'){//当为多选框时
		getMultiple();
		to_id_field_value = item_id_multiple;
		to_name_field_value = item_id_multiple_name;
	}else{
		to_id_field_value = to_id_field.value;
		to_name_field_value = to_name_field.value;
	}
	if(to_id_field_value == ''){//如果初始化为空时，从当前部门获取
		//getCurrentDeptPerson();
		$("#collapseTwo").addClass("panel-collapse collapse in");
		return;
	}
	if(to_id_field_value != ''){
		$("#collapseTwo").addClass("panel-collapse collapse");
	}
	var dataList = new Array();
	var dataNameList  = new Array();
	if(to_id_field_value != ""){
		dataList = to_id_field_value.split(",");
		dataNameList = to_name_field_value.split(",");
	}
	//转数组对象
	for(var i =0 ; i <dataList.length ; i++){
		if(dataList[i] && dataList[i] != "" ){
			var item = {id:dataList[i] , name:dataNameList[i]};
			id_field_array.push(item);
		}
		
	}
	dataLoadInit(id_field_array);
}
/**
 * 点击已选人员
 */
function clickSelectData(){
	var dataList = to_id_field.value.split(",");
	var dataNameList = to_name_field.value.split(",");
	if(to_id_field.value == ''){
		dataList = [];
		dataNameList = [];
	}
	//转数组对象
	if(id_field_array.length <= 0){
		for(var i =0 ; i <dataList.length ; i++){
			if(dataList[i] && dataList[i] != "" ){
				var item = {id:dataList[i] , name:dataNameList[i]};
				id_field_array.push(item);
			}
			
		}
	}
	
	dataLoadInit(id_field_array);
}

/**
 * 获取部门select字符串
 * uuid:部门id
 * isCheck:是否是勾选 0-勾选为false,1-勾选为true
 */
function getAttachId(seq,isCheckedState,typeName){
	var url = contextPath +  "/teeDocType/getSelectAttachIdBySeq.action";
	var para = {seq:seq};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		var dataList = jsonRs.rtData;
		dataLoadword(dataList,typeName);
	}else{
		alert(jsonRs.rtMsg);
	} 
}
function getDeptTree(){
	var param = "";

	var url =  "<%=contextPath %>/teeDocType/getDocTypeTree.action";
	var config = {
			zTreeId:"selectDeptZtree",
			requestURL:url,
           	onClickFunc:deptOnClick,
			async:false,
			asyncExtend:true,
			onAsyncSuccess:onAsyncSuccessFunc,
			param:{}
			
		};
	zTreeObj = ZTreeTool.config(config); 	
}
/**
 *  点击
 */
function deptOnClick(event, treeId, treeNode) {
	var uuid = treeNode.id;
	var name = treeNode.name;
	getAttachId(uuid,'',name);
}
/**
 * zNodesLength ：树节点数
 * rtMsg： 返回的json rtMsg 信息
 */
function onAsyncSuccessFunc(zNodesLength , jsonData){
	//获取人员数组
	var personData = jsonData.rtData.personData;
	var currDept = jsonData.rtData.currDept;
	var currDeptName =  "选择";
    if(currDept){
    	currDeptName = currDept.deptName;
    }
    dataLoadword(personData ,currDeptName);
}

function load_init_item_(){
	 
	  //右侧用户列表点击、鼠标hover事件
	   jQuery('div.right .list-group-item').bind('click', function(){
	      if(single_select)
	         jQuery(this).siblings().removeClass('active');
	      
	      jQuery(this).toggleClass('active');
	      if(jQuery(this).attr('class').indexOf('active') < 0){
	          remove_item(this.getAttribute("item_id"), this.getAttribute("item_name"));
	      }
	      else{
	    	  add_item_(this.getAttribute("item_id"), this.getAttribute("item_name"));
	      }
	       
	   }); 
}

function close_window()
{
 if(typeof(window.external) == 'undefined' || typeof(window.external.OA_SMS) == 'undefined' || !window.external.OA_SMS("", "", "GET_VERSION") || window.external.OA_SMS("", "", "GET_VERSION") < '20110223')
 {
    window.open('','_self','');
    CloseWindow();
 }
 else
 {
    window.external.OA_SMS("", "", "CLOSE_WINDOW")
 }
}

function trigger_callback(type, args ){
	//alert(args)

//  var parent_window = jQuery.browser.msie ? parent.dialogArguments : parent.opener;
//
//  if(typeof parent_window == 'object' && typeof parent_window[type] == 'function'){
//      parent_window[type].apply(this, args );
//  }
}

/**
* 选中项
* @param item_id   Id
* @param item_name  name
* @param extend  扩展字段---比如人员在线状态
*/
function add_item_(item_id, item_name , extend)
{
	//var toIdFiledName  = to_id_field.name;//文档框名称
	var callBackFunc =   "ORG_SELECT_ADD_BACH_FUNC";//回调函数
	
	
	 arguments.length = 5;
   var callBackParaObj ;
   if(callBackPara && callBackPara != ''){
  	 callBackParaObj = tools.string2JsonObj(callBackPara);
   }

	if(objSelectType &&objSelectType == '1'){//当为多选框时
		getMultiple();
		/*to_id_field_value = item_id_multiple;
		to_name_field_value = item_id_multiple_name;*/
	}else if(objSelectType == '2'){//DIV
		
	}

	//var to_id_field_value = to_id_field.value;
 if(!item_id || !item_name)
    return;
 
 var item = {id:item_id , name:item_name};
 if(single_select)//单选
 {
	  id_field_array.length = 0;//清空数组
	
	  id_field_array.push(item);//添加数组
    to_id_field.value = item_id;
    to_name_field.value = item_name;
	  arguments[2] =  to_id_field.value;
	  arguments[3] = to_name_field.value;
	  arguments[4] = callBackParaObj;
    trigger_callback(callBackFunc, arguments  );
  //  close_window();
    return;
 }

 //添加 数组 页面文本属性
 var isAddItem = true;
 for(var i =0 ; i<id_field_array.length ; i++){//循环所选项
	   var itemTemp = id_field_array[i];
	   if(itemTemp.id == item_id){//如果相等
		   isAddItem = false;
		   break;
	   }
 }
 if(isAddItem){
	   id_field_array.push(item);//添加对象
	   
	   if(to_id_field.value == ""){// 等于空，直接赋值
		   to_id_field_value = item_id;
		   to_name_field_value = item_name;
	   }else{
		   if(to_id_field.value.substring(to_id_field.value.length - 1 , to_id_field.value.length) == ','){
			   to_id_field_value = to_id_field.value + item_id ;
			   to_name_field_value = to_name_field.value + item_name;
		   }else{
			   to_id_field_value = to_id_field.value + "," + item_id ;
			   to_name_field_value = to_name_field.value + "," + item_name;
		   }
	   }
 }

 to_id_field.value = to_id_field_value;
 to_name_field.value = to_name_field_value;

 /**
  * 判断是否存在此方法，转为多选人员，第三栏处理
  */
 if( window.dataSelectLoadInit ){  
	    dataSelectLoadInit(id_field_array);  
	 }   
// arguments.push(to_id_field.value );
// arguments.push(to_name_field.value );
 arguments[2] =  to_id_field.value;
 arguments[3] = to_name_field.value;
 arguments[4] = callBackParaObj;
 trigger_callback(callBackFunc, arguments );;
}
function commit(){//getcreateNewWorkData
	var url = contextPath + "/teeDocType/getDoctypeBySeq.action";
	var para = {seq:to_id_field.value};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		var year = new Date().getFullYear();
		var data =jsonRs.rtData;
		var worType = data.wordType;//发文字
		var attachId = data.attachId;//附件id
		var autoNumberId = data.autoNumberId;//编号值
		var typeName = data.typeName;//类别
		var bt = data.bt==null?"":data.bt;
		var ztc = data.ztc==null?"":data.ztc;
		var zs = data.zs==null?"":data.zs;
		var params={fType:data.startFlowId,DATA_wjz:worType};
		params["DATA_bt"]=bt;
		params["DATA_ztc"]=ztc;
		params["DATA_zsdwlist"]=zs;
		params["DOC_ID"]=attachId;//正文附件
		params["DATA_wjlx"]=typeName;//发文字号
		params["DATA_wjnf"]=year;//发文字号
		//params["DATA_wjh"]=autoNumberId;//发文字号
		doCreate(params);
	} 
	return true;
}
function doCreate(params){
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
</script>

</head>
<body onload="doInit()" >
	<div style="width:500px;margin:5px auto;">
		<div class="panel-group" id="accordion" style="width:260px;">
			<div class="panel panel-default in">
			    <div class="panel-heading" style="padding:7px 15px;">
			    <h5 class="panel-title">
			      <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" style="font-size:14px">
			        	结构
			      </a>
			    </h5>
			    </div>
			    <div id="collapseTwo"  class="panel-collapse collapse in">
			      <div class="panel-body">
			        <div>
			   		  <ul id="selectDeptZtree" class="ztree" style="overflow-x:hidden;overflow-y:auto;height:310px;"></ul>
					  </div>
			      </div>
			    </div>
			</div>
		</div>
	<div id="block_dept" style="position:absolute;left:400px;top:0px;bottom:0px;">
	<div class="right single" id="dept_item">
		<div style="padding-bottom: 5px;">
			<table >
			<tr>
				<td>
				    <div class="input-group">
	          		    <input class="form-control" type="text" id="kword" name="kword" value="搜索..." onfocus="ctroltime=setTimeout(CheckSend,100);" onblur="clearTimeout(ctroltime);if(this.value=='')this.value='搜索...';"  style="height:32px;line-height:32px;font-family:微软雅黑;width:147px;"/>
	            	    <div class="input-group-btn">            	
		            	  <button tabindex="-1" class="btn btn-primary" type="button" style="height:34px;font-family:微软雅黑;margin:0;border-radius:0;" value=""  id="search_icon">查询</button>
	                   </div>
	                 </div>
				 </td>
			</tr>
			</table>
		</div>
		<div>
			<input type="hidden" id="field_value"/>
			<input type="hidden" id="field_name"/>
		</div>
		<div class="block-right" id="dept_item_0">
		</div> 
		<div id="" align="center" style="margin-top:20px;height:40px;">
	<!--    		<input type="button" class="btn btn-primary" value="确定" onclick="close_window();">&nbsp;&nbsp; -->
		</div>
	</div>
	</div>
	</div>
</body>
</html>