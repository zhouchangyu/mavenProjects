<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 //当前人的roleId
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header.jsp" %>
<%@ include file="/header/ztree.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- jQuery 布局器 -->
<script>
var role_Id ="";
function doInit(){
	$("#group").group();
	//changePage('<%=contextPath%>/system/core/person/query.jsp');
	getPersonTree();
}
function  changePage(url){
	$("#frame0").attr("src", url);
}
function refreshTargetNode(tid){
	var treeObj = $.fn.zTree.getZTreeObj("orgZtree");
	var node = treeObj.getNodeByParam("id", tid, null);
	if(node!=null){
		if(!node.isParent){
			treeObj.reAsyncChildNodes(null, "refresh");
		}else{
			treeObj.reAsyncChildNodes(node, "refresh");
		}
	}
}
/**
 * 马上加载
 */
 var zTreeObj ;
 function getPersonTree(){
		var url = "<%=contextPath %>/orgManager/checkOrg.action";
		var jsonObj = tools.requestJsonRs(url);
		if(jsonObj.rtState){
			var json = jsonObj.rtData;
			if(json.sid){
				var url = "<%=contextPath %>/personManager/getOrgTree.action";
				var config = {
					zTreeId:"orgZtree",
					requestURL:url,
					param:{"para1":"111"},
					onClickFunc:personOnClick,
					onAsyncSuccess:onUserAsyncSuccess
						
				};
				zTreeObj = ZTreeTool.config(config);
				//expandNodes(zTreeObj);
			}else{
				alert("单位信息未录入，请您先填写单位信息！");
				return;
			}
		}
		//
		//setTimeout('expandNodes()',500);
 }
 function onUserAsyncSuccess(event, treeId, treeNode, msg) {//异步执行成功后
		 expandNodes();	 
}
 /**
   *第一级展开部门
   */
function expandNodes() {
	 if(!zTreeObj){
		zTreeObj = $.fn.zTree.getZTreeObj("orgZtree"); 
	 }
	var nodes = zTreeObj.getNodes();
	zTreeObj.expandNode(nodes[0], true, false, false);
	if (nodes[0].isParent && nodes[0].zAsync ) {
		//expandNodes(nodes[0].children);
	}
/* 	alert(nodes[0].id)
	for (var i=0, l=nodes.length; i<l; i++) {
		zTreeObj.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync ) {
			expandNodes(nodes[i].children);
		}
	} */
}


/**
 * 点击节点
 */
function personOnClick(event, treeId, treeNode) {
	var uuid = treeNode.id;
	if(uuid.split(";").length == 2 && uuid.split(";")[1] == 'dept'){//二级菜单 部门
	
	}else if(uuid.split(";").length == 2 && uuid.split(";")[1] == 'personId'){//三级菜单 个人信息
	 
	}
};

/**
 * 跳转至查询
 */
function toQuery(){
	changePage("<%=contextPath%>/system/core/person/query.jsp");
}
/**
 * 跳转导入
 */
function toImport(){
	changePage("<%=contextPath%>/system/core/person/import.jsp");
}
/**
 * 跳转至批量设置
 */
function toMultiSet(){
	changePage("<%=contextPath%>/system/core/person/multiSet.jsp");
}

</script>
</head>
<body onload="doInit()" style="overflow:hidden;font-size:12px;">
	<div layout="west" width="280px" style="overflow-y:auto;overflow-x:hidden;position:absolute;left:0px;top:0px;bottom:0px;width:280px">
		<br>
		<div id="group" class="list-group">
		 	<div class="panel-group" id="accordion" style="width:250px;padding-left:10px;">
			  <div class="panel panel-default">
			    <div class="panel-heading menuList" align="">
			      <h5 class="panel-title" style="padding-bottom:0px;">
			        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
			          	文种类型列表
			        </a>
			      </h5>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in">
			      	<div class="panel-body" style="padding:0px;">
			       		<ul id="orgZtree" class="ztree" style="overflow:auto;border:0px;margin-top:0px;width:100%;height:100%;min-height:210px; padding-left:2px;"></ul>
			   	    </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
	<div layout="center" style="padding-left:2px;position:absolute;left:281px;top:0px;bottom:0px;right:0px;">
		<iframe id="frame0" frameborder=0 style="width:100%;height:100%"></iframe>
	</div>
</body>
</html>
