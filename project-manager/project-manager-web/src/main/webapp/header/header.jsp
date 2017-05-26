<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@page import="org.springframework.core.io.ClassPathResource"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String contextPath = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	//获取主题的索引号
	int styleIndex = 1;
	Integer styleInSession = (Integer) request.getSession().getAttribute("STYLE_TYPE_INDEX");
	if (styleInSession != null) {
		styleIndex = styleInSession;
	}
	String stylePath = contextPath + "/common/styles";
	String imgPath = stylePath + "/style" + styleIndex + "/img";
	String cssPath = stylePath + "/style" + styleIndex + "/css";
	String systemImagePath = contextPath+"/common/images";
	
	//第二套风格
	

%>
<!-- jQuery库 -->
<script src="<%=contextPath %>/common/easyui/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cssPath%>/style.css"/>

<script type="text/javascript" >
window.UEDITOR_HOME_URL = "<%=contextPath%>/common/ueditor/";
$.browser = {};
$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
</script>

<!-- Bootstrap通用UI组件 -->
<script src="<%=contextPath %>/common/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/common/bootstrap/css/bootstrap.css"/>




<!-- JBOX通用UI组件 -->
<script type="text/javascript" src="<%=contextPath%>/common/jbox-v2.3/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/jbox-v2.3/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/common/jbox-v2.3/jBox/Skins/Blue/jbox.css" />
<script>

</script>
<!-- 其他工具库类 -->
<script src="<%=contextPath %>/common/js/tools.js"></script>
<script src="<%=contextPath %>/common/js/sys.js"></script>
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

<script type="text/javascript">

/** 常量定义 **/
var TDJSCONST = {
  YES: 1,
  NO: 0
};
/** 变量定义 **/
var contextPath = "<%=contextPath %>";
var imgPath = "<%=imgPath %>";
var cssPath = "<%=cssPath%>";
var stylePath = "<%=stylePath%>";

var uploadFlashUrl = "<%=contextPath %>/common/swfupload/swfupload.swf";
var commonUploadUrl = "<%=contextPath %>/attachmentController/commonUpload.action";
var systemImagePath = "<%=systemImagePath%>";
var xparent;
if(window.dialogArguments){
	xparent = window.dialogArguments;
}else if(window.opener){
	xparent = opener;
}else{
	xparent = window;
}
function parseNumber(value, defValue) {
  if (isNaN(value)) {
    return defValue;
  }
  return value * 1;
}


</script>
<style>
body {
scrollbar-arrow-color: #a3a3a3;  /*图6,三角箭头的颜色*/
scrollbar-face-color: #bcbcbc;  /*图5,立体滚动条的颜色*/
scrollbar-3dlight-color: #b2b2b2;  /*图1,立体滚动条亮边的颜色*/
scrollbar-highlight-color: #e9e9e9;  /*图2,滚动条空白部分的颜色*/
scrollbar-shadow-color: #b2b2b2;  /*图3,立体滚动条阴影的颜色*/
scrollbar-darkshadow-color: #666;  /*图4,立体滚动条强阴影的颜色*/
scrollbar-track-color: #f1f1f1;  /*图7,立体滚动条背景颜色*/
scrollbar-base-color:#bcbcbc;  /*滚动条的基本颜色*/
}
</style>