<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>404</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		html,body{
			background-color:#fff;
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
		}
		#backToIndex{
			width: 101px;
			height: 40px;
			background-image: url(<%=contextPath %>/common/zt_webframe/dist/img/404_505/errBtn.png);
			display: block;
			margin:0 auto;
			margin-top: 25px;
			color: #fff;
			border:none;
			outline: none;
			cursor:pointer;
			letter-spacing:2px;
		}
	</style>
</head>
<body>
	<div class="center">
		<img class="err" src="<%=contextPath %>/common/zt_webframe/dist/img/404_505/err.png" alt="">
		<img class="err404" src="<%=contextPath %>/common/zt_webframe/dist/img/404_505/err_404.png" alt="">
		<p>啊哦！一不小心找不到页面了</p>
		<!-- <input type="button" onclick="toReLogin();" id="backToIndex" value="返回首页"> -->
	</div>
</body>
<script>
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
</html>