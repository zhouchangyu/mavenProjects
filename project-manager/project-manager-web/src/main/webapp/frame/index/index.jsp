<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow:hidden">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<%@ include file="/header/upload.jsp" %>
<title></title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="<%=request.getContextPath() %>/xfj.ico" type="image/x-icon"/>
<link href="css/index.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/style_without_tab.css"/>
<link rel="stylesheet" type="text/css" href="css/sms.css"/>
<link rel="stylesheet" type="text/css" href="css/cmp-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/menu.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/system/frame/xfj/css/query.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/common/fullcalendar/fullcalendar/fullcalendar.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/system/frame/2/js/sms.css"/>

<style>
#Demo {
	position:absolute;
	left:0px;
	top:0px;
	bottom:20px;
	width: 235px;
	overflow: hidden;
}
.ps-container .ps-scrollbar-y {
	position: absolute;
	right:9px;
	width:6px;
	background-color:#1A99CC;
	cursor:pointer;
}
.ps-scrollbar-y:hover {
	background-color:#48b8e5;
}
.panel-body  iframe{
	position:absolute;
	left:0;
	top:0px;
	right:0;
}
.search_ul{
	margin:0px;
	padding:0px;
}
.search_ul li{
	padding:6px;
}
.search_ul li:hover{
	cursor:pointer;
	background:gray;
	color:white;
}

/*右键菜单的样式*/
.DreamMenu
{
	position: absolute;
	visibility: hidden;
	z-index: 100;
	overflow: hidden;
	width: 150px;
	background-color: #fafafa;
	border: 1px solid #aaa !important;
	/* border: buttonhighlight menu menu buttonhighlight 2px outset; */
	padding: 1px !important;
	padding: 1px 1px 1px 0px;
	font-size: 12px;
}

.DreamMenu ul
{
	margin: 1px;
	border-bottom: buttonhighlight 1px solid;
	border-top: buttonshadow 1px solid;
}

.DreamMenu a
{
	display: block;
	width: 100%;
	padding: 1px 2px 2px 20px;
	cursor: default;
	text-decoration: none;
	color: #000000;
	margin:3px 0;
	cursor:pointer;
}

.DreamMenu a:hover
{
	background: #33a5f1;
	color: #ffffff;
}
/*添加关闭所有便签的遮罩层*/
.shadowForMenu{
	width:100%;
	height:100%;
	position:absolute;
	top:0;
	right:0;
	bottom:0;
	left:0;
	z-index:99;
	background-color:#fff;
	filter:alpha(opacity=0);/* 设置不透明度为80 */ 
	-moz-opacity:0;
	opacity: 0;
}
</style>
<link  href="<%=contextPath%>/common/jquery/portlet/jquery.portlet.css?v=1.1.2" type="text/css" rel="stylesheet" />
<link  href="<%=contextPath%>/common/jquery/portlet/jquery-ui-1.9.2.custom.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ux/jquery.ux.tee.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ux/jquery.ux.container.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ux/jquery.ux.panel.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/jquery/ux/jquery.ux.window.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/jquery/portlet/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/jquery/portlet/jquery.portlet.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/frame/xfj/js/index.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/frame/xfj/js/sms.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/bootstrap/js/bootstrap_typeahead.js"></script>
<script src="<%=contextPath%>/system/frame/xfj/js/perfect-scrollbar.with-mousewheel.min.js"></script>
<script src="<%=contextPath%>/system/frame/xfj/js/jquery-mousewheel.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/lazyloader.js"></script>
<script type="text/javascript">
$(function(){
	$("#iframe0").attr("src", "<%=contextPath %>/system/core/docType/index.jsp");
});
var loader;

var _Tmenu = 0;
var _Amenu = 0;
var _Type = 'DIV';
var _Menu = "null";
var autoHide = null;
function  doInit(){
	//菜单
	//getMenuListNew();
	//获取当前时间
	//getCurrLunarDate();
	//在线人数
	//queryOnlineUserCount();
	$("#menu-lv1-999").children('a').bind("click",function(){
		if($("#menu-lv2-ul-999 ").is(":hidden")){
			$("#menu-lv2-ul-999 ").show();
		} else{
			$("#menu-lv2-ul-999 ").hide();
		}
					});
	$("#menu-lv2-999380").children('a').bind("click",function(){
		addNewTabs("我的桌面","/system/core/docType/index.jsp");
					});
	$("#menu-lv2-999381").children('a').bind("click",function(){
						addNewTabs("文件","/system/core/receiveFile/index.jsp");
			});
	//创建拖动事件
	$("#queryFrame").draggable();
	remindCheck();
	setTopBanner();
	
/*添加右键菜单*/
	if (!document.all) document.captureEvents(Event.MOUSEDOWN);
	document.onclick = _Hidden;
	$("#mainTabs").on("contextmenu",function(e){
		_Hidden();
		_Amenu = "menutext";
		if (document.all) e = event;
		_ShowMenu(_Amenu, e);
		return false;
	});
	$(".shadowForMenu").click(function(){
		$(".shadowForMenu").remove();
	});
	$("body").on("contextmenu",".shadowForMenu",function(e){
		return false;
	})
}
//30秒获取一次待办数量
//setInterval('getModelHandCount()', 30000)
/**
 * 设置头部banner
 */
function setTopBanner(){
}
/**
*
*控制面板
*/
function toDesktop(){
	var srcUrl = "<%=contextPath%>/system/core/person/setdescktop/index.jsp";
	addNewTabs("控制面板",srcUrl);
}

/**
*
*注销
*/
function doLogout(){
	var msg = loginOutText + "\n确定要注销吗?";
	if(confirm(msg)){
		var url = "<%=contextPath %>/systemAction/doLoginout.action";
		var para = {};
		var jsonObj = tools.requestJsonRs(url,para);
		//window.location.href = "/";
		//信访局项目,直接关闭当前窗口即可。仅支持ie
 	 	//add by wlshi add time 20170410
 	 	window.open('','_parent',''); 
 	 	window.close();
	}
}

/**
直接从后台重新读取
*过了当天，系统从后台从新取其次
*/
function getCurrLunarDate(){
	var url = "<%=contextPath %>/systemAction/getCurrLunarDate.action";
	var para = {};
	var jsonObj = tools.requestJsonRs(url,para);
	if(jsonObj.rtState){
		var dateInfo = jsonObj.rtData;
		todayLunarStr = dateInfo;
		var dateInfoJson = eval('(' + dateInfo + ')');
		var date = dateInfoJson.date;
		var week = dateInfoJson.week;
		var time = dateInfoJson.time;
		var lunarDate = dateInfoJson.lunarDate;
		startTime = dateInfoJson.timeStr ;
		//$("#currDate").append( date + "&nbsp;&nbsp;" + week +"&nbsp;" + time + "&nbsp;" + lunarDate );
		$("#currDate").attr("title",  lunarDate);
		$("#currDate").append("今天是&nbsp;&nbsp;"+ date + "&nbsp;&nbsp;" + week  );
		//.html("<font color='red'>"+ date + "<br>" + week +" " + time + "<br>" + lunarDate +"</font>");
	}else{
		//alert(jsonObj.rtMsg);
	}
}
/**
	加载日期
*/
function showWeatherAndDate(){
	getCurrLunarDate();
}

/**选中触发时间**/
function onselectUserFunc(val){
	toUserInfo(val.id);
}

/**
 *更多查询
 */
 function switchMoreQuery(){

 	if($("#queryFrame").is(":hidden")){
			$("#queryFrame").show(300);
			$("#queryFrameIframe").attr("src",contextPath+"/system/core/system/query/index.jsp");
		}else{
			$("#queryFrame").hide(300);
			$("#queryFrameIframe").attr("src","");
		}

 }

function remindCheck(){
	tools.requestJsonRs(contextPath+"/sms/remindCheck.action",{},true,function(json){
		if(json.rtState){
			if(json.rtData.smsFlag!=0){//弹出短消息
				msgFrame.playSound(2);
				smsAlert();
			}
			if(json.rtData.msgFlag!=0){//弹出通讯消息
				msgFrame.playSound(1);
				var offlineMsgJson = tools.requestJsonRs(contextPath+"/messageManage/getOfflineMessages.action");
				for(var i=0;i<offlineMsgJson.rtData.length;i++){
					socketHandler(offlineMsgJson.rtData[i]);
				}
			}
		}
		setTimeout("remindCheck()",1000*10);//10秒
	});
}

function enterKeywords(){
	var type = $("#searchType").val();
	if($("#queryInfo").val()!=""){
		$("#searchDataDiv").show();
		$("#searchDataDiv")[0].contentWindow.word = $("#queryInfo").val();
		$("#searchDataDiv")[0].contentWindow.doSearchUser();
	}else{
		$("#searchDataDiv").html("").hide();
	}
}

/*--------------------右键关闭所有标签------------------------*/
function _Hidden() {
	if (_Tmenu == 0) return;
	document.getElementById(_Tmenu).style.visibility = 'hidden';
	_Tmenu = 0;
	$(".shadowForMenu").remove();
}

function _ShowMenu(Eid, event) {
	_Menu = document.getElementById(Eid);

	var _Left = event.clientX + document.body.scrollLeft;
	var _Top = event.clientY + document.body.scrollTop;
	_Menu.style.left = _Left.toString() + 'px';
	_Menu.style.top = _Top.toString() + 'px';
	_Menu.style.visibility = 'visible';
	_Tmenu = Eid;
	_Menu.onclick = transfer;
	_Menu.oncontextmenu = no_context_menu;
	$("body").append("<div class='shadowForMenu'></div>");
}

function transfer(e) {
	e = e || window.event; e.cancelBubble = true;
}

function no_context_menu(e) {
	e = e || window.event;
	e = e || window.event; e.cancelBubble = true;
	return;
}

function closeAll(){
	if(confirm("关闭所有页将丢失所有未保存的内容，是否继续？")){
		_Hidden();
		var index = 1;
		while($("#mainTabs" ).tabs('exists', index)){
			$("#mainTabs" ).tabs('close', index);
		} 
	}else{
		_Hidden();
	}
}
/*--------------------右键关闭所有标签结束-----------------------------*/
</script>
</head>
<body class="ui-layout-container" onload="doInit();" >
<div class="box">
<!-- header 开始 -->
	<div class="header clearfix">
		<span class="bannerBg">
			<img class="style1" src="images/logoxinfangju.png" style="width:100%;height:100%;max-height:95px;position:absolute;z-index:-1;" alt="" />
			<img class="style2" src="img/images2/banner.png" style="width:100%;height:100%;max-height:95px;position:absolute;z-index:-1;" alt="" />
		</span>
    	<div class="logo fl"  id="logo">
			<!-- <img src="img/images2/logoxinfangju.png" style="position:absolute;top:13px;"/> -->
        </div>
	<%-- 	<div class="loginInfo">
		    <div class="nav clearfix" style="font-size:14px;font-family:微软雅黑;padding:5px 5px 0px 0px;">
			   	<div class="nav_l fr">
			       	<div class="clearfix">
			       		<span>部门：</span>
			       		&nbsp;&nbsp;<span>操作员：</span>
			       		&nbsp;&nbsp;<a href="javascript:void(0);" onclick="addNewTabs('我的桌面', '<%=contextPath %>/system/frame/xfj/main.jsp')">我的桌面</a>
			       		&nbsp;&nbsp;<a >帮助</a>
			       		&nbsp;&nbsp;<a href="javascript:void(0);" onclick="addNewTabs('配置', '<%=contextPath %>/system/core/person/setdescktop/')">配置</a>
			       		&nbsp;&nbsp;<a href="javascript:void(0);" onclick="doLogout();">退出</a>
			       	</div>
		       </div>
		   </div>
		   <div class="matters" style="">
		   		<!-- 待办件 开始 -->
		   		<div class="matter1 matter">
		   			<a href="javascript:void(0);" onclick="addNewTabs('待办件', '<%=contextPath %>/system/core/commonhandler/index.jsp')">
						<img class="matter1Bg matterBg" src="img/yellow.png" alt="待办件"/>
						<span class="matterText" style="color:white;">待办件<span class="forText"></span></span>
						<div class="numberBox">
							<span class="numberLeft"><img src="img/numberLeft.png" /></span>
							<span class="matterNumber" id="workFlow">1</span>
							<span class="numberRight"><img src="img/numberRight.png" /></span>
						</div>
					</a>
				</div>
				<!-- 待办件 结束 -->
				<!-- 待阅件 开始 -->
				<div class="matter2 matter">
					<a href="javascript:void(0);" onclick="addNewTabs('待阅件', '<%=contextPath %>/system/core/commonhandler/index_yue.jsp')">
						<img class="matterBg matterBg" src="img/green.png" alt="待阅件"/>
						<span class="matterText" style="color:white;">待阅件<span class="forText"></span></span>
						<div class="numberBox">
							<span class="numberLeft"><img src="img/numberLeft.png" alt="" /></span>
							<span class="matterNumber" id="workFlow1">2</span>
							<span class="numberRight"><img src="img/numberRight.png" alt="" /></span>
						</div>
					</a>
				</div>
				<!-- 待阅件 结束 -->
				<!-- 消息提醒 开始 -->
				<div class="matter3 matter">
					<a href="javascript:void(0);" onclick="addNewTabs('消息提醒', '<%=contextPath %>/system/core/sms/index.jsp')">
						<img class="matter3Bg matterBg" src="img/orange.png" alt="消息提醒"/>
						<span class="matterText" style="color:white;">消息提醒<span class="forText"></span></span>
						<div class="numberBox">
							<span class="numberLeft"><img src="img/numberLeft.png" alt="" /></span>
							<span class="matterNumber" id="smsCount">3</span>
							<span class="numberRight"><img src="img/numberRight.png" alt="" /></span>
						</div>
					</a>
				</div>
				<!-- 消息提醒 结束 -->
				<!-- 电子邮件 开始 -->
				<div class="matter4 matter">
					<a href="javascript:void(0);" onclick="addNewTabs('电子邮件', '<%=contextPath %>/system/core/email/index.jsp')">
						<img class="matter4Bg matterBg" src="img/darkBlue.png" alt="电子邮件"/>
						<span class="matterText" style="color:white;">电子邮件<span class="forText"></span></span>
						<div class="numberBox">
							<span class="numberLeft"><img src="img/numberLeft.png" alt="" /></span>
							<span class="matterNumber" id="emailCount">4</span>
							<span class="numberRight"><img src="img/numberRight.png" alt="" /></span>
						</div>
					</a>
				</div>
				<!-- 电子邮件 结束 -->
		   </div> --%>
		</div>
   </div>
   <!-- header 结束 -->
   <!-- content 开始 -->
    <div class="container clearfix">
        <div class="left"></div>
<!--         <div class="right"></div> -->
    	<div class="c_left fl">
        	<div class="c_left_box">
                <div class="post_left"></div>
                <div class="c_left_content">
                    </div>
                    <div class="sxcd">
                        <div class="sxcd_c" id="Demo">
                        	<div class="menu_list content" >
                            <ul id="menu_list_obj">
                             <li id='menu-lv1-999' class=''><a href='javascript:void(0);' style='margin-top:0;' class='yjcd' title=系统管理><span></span>系统管理 <span class="caret-down"></span><span class="caret-right"></span></a>
                             <ul class='child'  id='menu-lv2-ul-999'>
                             <li   id='menu-lv2-999380'><a href='javascript:void(0);' class='ejcd' title=系统日志管理><span class="caret-right"></span><span class="caret-down"></span>系统日志管理 </a></li>
                             <li   id='menu-lv2-999381'><a href='javascript:void(0);' class='ejcd' title=系统日志管理><span class="caret-right"></span><span class="caret-down"></span>系统日志管理 </a></li>
                             
                             </ul>
                             
                             </li>
                            
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
        	</div>
        </div>
        <div class="c_center fl" style="bottom:25px;">
        	<div class="c_center_box">
                <div id="mainTabs" menu="menutext" class="easyui-tabs c_center_title" data-options="tools:'#tab-tools'">
                	<div title="我的桌面">
                        <iframe class="iframe" width="100%" height="100%" frameborder="0"  id="iframe0"></iframe>
                    </div>
                </div>
            </div>
        </div>
<!--         <div class="c_right fl"> -->
<!--         	<iframe width="220px" height="100%" frameborder="0" id="iframe1"></iframe> -->
<!--         </div> -->
    </div>
<div style="right: 5px; bottom: 30px; width: 200px; max-height:500px;overflow-y:auto;overflow-x:hidden; position: absolute;" id="smsInfo">
</div>

<!-- 短消息面板 -->
<div class="smsbox" id="smsbox" style="display:none">
	<div class="title">
	<span style="float:left;">消息提醒</span>
	<span style="float:right;cursor:pointer" onclick="$('#smsbox').hide()">×</span>
	<span style="float:right;cursor:pointer" class="smsbox_icon2" onclick="smsDetails()">消息列表</span>
	<span style="float:right;cursor:pointer" class="smsbox_icon1" onclick="smsViewAlls()">全部已阅</span>
	<div style="clear:both"></div>
	</div>
	<div class="content" id="smsBoxContent">
		<div class="smsbox_loadmore" id="loadMore">
			点击加载更多
		</div>
	</div>
</div>

<!--设置一个右键菜单层-->
<div id="menutext" class='DreamMenu'>
	<a href='javascript:;' onclick='closeAll()'>关闭所有页</a>
</div>

<!-- content 结束 -->
<!-- bottom 开始 -->
<div class="bottomBar" style="position:fixed;bottom:0px;height:20px;line-height:20px;left:0;right:0;color:#fff;background-color:#2765bc;">
	<span id="currDate" style="margin-left:10px;"></span>
	<span style="float:right;margin-right:10px;" id="onlineUserCount"></span>
</div>
<!-- bottom 结束 -->
<script src="js/perfect-scrollbar.with-mousewheel.min.js"></script>
<script>
$(".header_r_b input").focus(function (){
	$(".header_r_b span").css("display","none");
});
$(".header_r_b input").blur(function (){
	$(".header_r_b span").css("display","block");
});

$(".header_r_b input").focus(function (){
	$(".header_r_b span").css("display","none");
});
$(".header_r_b input").blur(function (){
	$(".header_r_b span").css("display","block");
});

$(document).ready(function(){
$(".left").click(function(){
	$(".left").toggleClass("left2");
	$(".c_center").toggleClass("c_center2");
	$(".c_left").toggleClass("none");
});

/**
 * 先隐藏右边
 */
$(".right").toggleClass("right2");
$(".c_center").toggleClass("c_center3");
$(".c_right").toggleClass("none");

var isClickRight = false;
$(".right,#onlineUserCount").click(function()
	{
		$(".right").toggleClass("right2");
		$(".c_center").toggleClass("c_center3");
		$(".c_right").toggleClass("none");
		if(!isClickRight){//判断是否点击过显示组织机构
			isClickRight = true;
			$("#iframe1").attr("src", "<%=contextPath %>/system/frame/xfj/right.jsp");
		}
	});

});

/*移除当前选中的标签*/
function remove(){
	var tab = $('#mainTabs').tabs('getSelected');
	if (tab){
		var index = $('#mainTabs').tabs('getTabIndex', tab);
		$('#mainTabs').tabs('close', index);
	}
}
/*移除某个标签，根据title来判断*/
function removeTab(title){
	var tab = $('#mainTabs').tabs('close',title);
}

/**
 * 邮件、短信
 */
$(".yjxx a").click(function()
{
	$(".yjxx a").removeClass("a_active");
	$(this).addClass("a_active");
});

/*刷新tab*/
function reloadTabGrid(title)
{
     if ($("#mainTabs" ).tabs('exists', title)) {
          window.top.reload_tabcontent.call();
    }
}

</script>
</body>
</html>
