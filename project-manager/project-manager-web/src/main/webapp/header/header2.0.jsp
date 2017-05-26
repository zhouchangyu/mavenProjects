<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String contextPath = request.getContextPath();
	String zt_webframe_dist = contextPath + "/common/zt_webframe/dist";
	String imgPath = zt_webframe_dist + "/img";
	String cssPath = zt_webframe_dist + "/css";
	String systemImagePath = contextPath+"/common/images";
%>
<!-- 信访局UI库 -->
<link rel="stylesheet" href="<%=contextPath %>/common/zt_webframe/dist/css/init.css">
<link rel="stylesheet" href="<%=contextPath %>/common/zt_webframe/dist/css/index.css">
<link rel="stylesheet" href="<%=contextPath %>/common/zt_webframe/dist/css/innerPage.css">
<link rel="stylesheet" href="<%=contextPath %>/common/zt_webframe/dist/css/innerPageIframe.css">
<!-- jQuery库 -->
<script src="<%=contextPath %>/common/js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/style.css"/>
<!-- JBOX通用UI组件 -->
<script type="text/javascript" src="<%=contextPath%>/common/jbox-v2.3/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/jbox-v2.3/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/common/jbox-v2.3/jBox/Skins/Blue/jbox.css" />
<!-- 其他工具库类 -->
<script src="<%=contextPath %>/common/js/tools.js"></script>
<script src="<%=contextPath %>/common/js/sys1.0.js"></script>
<script src="<%=contextPath %>/common/js/sysUtil.js"></script>
<script src="<%=contextPath %>/common/js/src/orgselect.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/easyuiTools.js"></script>

<!-- jQuery Tooltip -->
<script type="text/javascript" src="<%=contextPath%>/common/tooltip/jquery.tooltip.min.js"></script>
<link rel="stylesheet" href="<%=contextPath %>/common/tooltip/jquery.tooltip.css" type="text/css"/>

<!-- 图片预览器 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/common/js/picexplore/jquery.mousewheel.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/js/picexplore/picexplore.js"></script>
<link rel="stylesheet" href="<%=contextPath %>/common/js/picexplore/picexplore.css" type="text/css"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/TeeMenu.js"></script>
<script src="<%=contextPath %>/common/js/ThreeLlinkage.js"></script>
<script type="text/javascript">
/** 变量定义 **/
var contextPath = "<%=contextPath %>";
var imgPath = "<%=imgPath %>";
var cssPath = "<%=cssPath%>";

var systemImagePath = "<%=systemImagePath%>";
var uploadFlashUrl = contextPath+"/common/swfupload/swfupload.swf";
var commonUploadUrl = contextPath+"/attachmentController/commonUpload.action";
var xparent;
if(window.dialogArguments){
	xparent = window.dialogArguments;
}else if(window.opener){
	xparent = opener;
}else{
	xparent = window;
}

$.browser = {};
$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());

$("document").ready(function(){
	/*第一种tab风格，页签右侧有斜三角风格*/
	$(".tabItem").click(function(){
		$('.tabItem').removeClass("active");
		$(this).addClass("active");
		$("#tabContent iframe").attr("src",$(this).attr("src"));
	});
	$(".tabItem.active").trigger("click");
	
	/*第二种tab风格 长方形风格*/
	$(".innerTabItem").click(function(){
		$('.innerTabItem').removeClass("active");
		$(this).addClass("active");
		$("#innerTabContent iframe").attr("src",$(this).attr("src"));
	});
	$("body").on("click",".innerTabItem",function(){
		$('.innerTabItem').removeClass("active");
		$('.innerTabItem').find(".bgofTab").show();
		$(this).find(".bgofTab").hide();
		$(this).addClass("active");
	});
	$(".innerTabItem.active").trigger("click");
});
/*添加内部的页签  添加方块样tab*/
function addChildTab(name,url){
	var $tabList = $(".innerTabItem");
	var le = $tabList.length;
	for(var i=0;i<le;i++){
		if($($tabList[i]).find(".tabtext").text() == name){
			$($tabList[i]).trigger("click");
			return;
		}
	}
	var newLi = '<li class="innerTabItem active" src="'+url+'">'+
					'<img class="bgofTab" src="/common/zt_webframe/dist/img/innerPage/innerTab.png" alt="">'+
					'<span class="tabtext">'+name+'</span>'+
				'</li>';
	$(".innerTabList").append(newLi);
}

Date.prototype.Format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  
</script>

