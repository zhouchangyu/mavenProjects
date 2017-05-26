<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
%>
<html>
<head>
<%@ include file="/header/header2.0.jsp" %>
<title>页面访问失败提醒界面</title>
<style>
		*{
			margin:0;
			padding:0;
		}
		body{
			font-family: "微软雅黑";
		}
		.center{
			width: 400px;
			margin:0 auto;
			margin-top: 80px;
		}
		.center img{
			display:block;
		}
		.center img.err{

		}
		p{
			text-align:center;
			font-size: 14px;
			margin-top: 25px;
			letter-spacing:2px;
		}
		#backToIndex{
			width: 101px;
			height: 40px;
			background-image: url(<%=contextPath%>/common/zt_webframe/dist/img/404_505/errBtn.png);
			display: block;
			margin:0 auto;
			margin-top: 25px;
			font-size:16px;
			color: #fff;
			border:none;
			outline: none;
			cursor:pointer;
			letter-spacing:2px;
		}
	</style>
<script>
/* 页面访问失败提醒界面原因
* 默认-未登录或已登录超时
* 1-无权限访问
* 
*
*/
var checkValidTypeArray = ["您未登录或已登录超时，请重新登录" , "暂无权限访问,请与系统管理员联系！"];
function doInit(){
	messageMsg(checkValidTypeArray[checkValidType],"content","info",400);
	if(checkValidType != 0){
		$("#reLoginButton").hide();
	}
}

/**
 * 获取最顶层窗口
 */
var topWin= (function (p,c){
    while(p!=c){
        c = p;   
        p = p.parent;
    }
    return c;
})(window.parent,window);
/**
 * 返回首页
 */
function toReLogin(){
	topWin.location = '/<%=contextPath%>';
}
</script>
</head>

<body onload="doInit()">
 <div class="center">
		<img class="err" src="<%=contextPath%>/common/zt_webframe/dist/img/404_505/err.png" alt=""/>
		<img class="err404" src="<%=contextPath%>/common/zt_webframe/dist/img/404_505/err_no_access.png" alt=""/>
		<p>您未登录或登录已过期,请重新登录!</p>
		<input type="button" id="backToIndex" onclick="toReLogin();" value="返回首页"/>
</div>
</body>
</html>
