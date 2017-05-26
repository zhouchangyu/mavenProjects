<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link href="./style/commom_wev8.css" type="text/css" rel="stylesheet">
<link href="./style/xfj_css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=contextPath %>/common/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./style/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/tools.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/sys.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/sysUtil.js"></script>
<script type="text/javascript">
var contextPath = "<%=request.getContextPath()%>";
var secUserMem = "";//是否允许记忆用户名  1- 记录
var loginByCode = "";
/**
 * 保存
 */
function doLogin(){
	if (checkForm()){
		var url = "<%=contextPath%>/systemAction/doLoginIn.action";
		var para =  tools.formToJson($("#form1")) ;
		var json = tools.requestJsonRs(url,para);
		if (json.rtState){
			    if(secUserMem == '1'){//允许记忆卡
			    	setCookie('userName',$('#userName').val() , 30);
			    }
			    var data = json.rtData;
			    //从数据库中读取当前用户登录主题。信访局项目中就使用默认主题。
			    //var theme = data.theme;
			    var theme="xfj";
			    window.location.href = "<%=contextPath%>/system/frame/"+theme+"/index.jsp";
		} else{ 
			 switch(json.rtData.code){
			      case 0:{
			        alert(json.rtMsg);
			        $('#userName').focus();
			        break;
			      }
			      case 1:{
			      }
			      case 2:{
			      }
			      case 3:{
			      }
			      case 9:{
			      }
			      case 10:{
			      }
			      case 11:{
			      }
			      case 12:{
			        alert(json.rtMsg);
			        $('#pwd').value = '';
			        $('#userName').focus();
			        break;
			      }
			      case 13:{
			    	  window.location.href = "<%=contextPath%>/system/frame/default/index.jsp";
			        break;
			      }
			      case 4:{
			        alert(json.rtMsg);
			        break;
			      }
			      case 5:{
			        alert(json.rtMsg);
			        $('#pwd').value = '';
			        $('#pwd').focus();
			        break;
			      }
			      case 6:{
			    	  if(secUserMem == '1'){//允许记忆卡
			    		  setCookie('userName',$('#userName').val() , 1);
			          }
			        window.location = contextPath + "/system/core/system/security/editPwd.jsp?code=6";
			        break;
			      }
			      case 7:{
			    	  if(secUserMem == '1'){//允许记忆卡
			    		  setCookie('userName',$('#userName').val() , 1);
			          }
			      	  window.location = contextPath + "/system/core/system/security/editPwd.jsp?code=7";
			          break;
			      }
			      case 8:{
			    	 alert(json.rtMsg);
			        $('#pwd').value = '';
			        $('#pwd').focus();
			        break;
			      }
			      case 14: {
			        alert('验证码错误');
			        $('#pwd').value = '';
			        $('#pwd').focus();
			        break;
			      }
			      case 15: {
			    	  alert(json.rtMsg);
				       break;
				  }
			      case 16: {
			    	  window.location = "/system/core/system/auth_info.jsp";
				      break;
				  }
			      default:{
			        alert("登录失败!");
			      }
			 }
		}
	}
}

/**
 * 校验有没有字符串
 */
function isValidateUserName(value){
	return /[\~!`@;=#\+\|\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]$/.test(value);
}
/**
 * 校验表单
 */
function checkForm(){
	if($('#userName').val() == ''){
	      alert("请输入用户名");
	      $('userName').focus();
	      return false;
	 }
	 if (isValidateUserName($('#userName').val())) {
	     alert("您输入的用户名含有特殊字符！");
	     $('#userName').focus();
	     return;
	 } 
	 if($("#verifyCode").val()=="" && loginByCode=="1"){
			alert("请输入验证码");
			$("#verifyCode").focus();
			return;
		}
	 return true;
}
/*重置*/
function reSet(){
	$('#userName').val('');
	$('#pwd').val('');
}
/*从cookie中取数据*/
$(function () {
    if (getCookie('userName') && secUserMem == '1' && getCookie('userName') != 'undefined'){
  		  $('#userName').val(getCookie('userName'));
  	   	  $('#pwd').focus();
  	}else{
  		  $("#userName").focus();
  	}
  	
  	$('#pwd,#userName,#verifyCode').bind('keypress',function(event){
          if(event.keyCode == "13")    
          {
          	doLogin();
          }
      });
  	
  	if(loginByCode=="1"){
  		$("#verifyCodeLi").show();
  	}
  	
  	
  	//鼠标点击按钮的效果
  	$(".btns input").mouseover(function(){
  		$(this).css("background-image","url(style/xfj_img/login/btn_keydown.png)");
  	}).mouseleave(function(){
  		$(this).css("background-image","url(style/xfj_img/login/btn.png)");
  	});
});
</script>
<style type="text/css">
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,select{        
    font-size:12px;
}
.loginContainer{
	width:300px;
	height:330px;
	background:url('style/login-bg_wev8.png');
}
.loginTitle{
	color:#828282;
	font-weight:500px;
	font-size:18px;
	padding-top:10px;
	padding-bottom:20px;
}
/*For slide*/
.slideDivContinar { 
	height: 436px; 
	width: 100%; 
	padding:0; 
	margin:0; 
	overflow: hidden;
}
.slideDiv {
	height:436px; 
	width: 100%;
	top:0; 
	left:0;
	margin:0;
	padding:0;
}
/*For Input*/
.inputforloginbg{ 
	width:172px;
	height:21px;
	border:none;
}
.inputforloginbg input{
	border:none;
	height:15px;
	background:none;
}
.lgsm {
	width:124px;
	height:36px;
	background:url('style/btn_wev8.png') 0px 0px no-repeat; 
	border:none;
}
.lgsmMouseOver {
	width:124px;
	height:36px;
	background:url('style/btn_wev8.png') 0px 0px no-repeat; 
	border:none;
}
.crossNav{
	width:100%;
	height:30px;
	position:absolute;
	margin-top:105px;
	padding-left:30px;
	padding-right:30px;
}
.input_out{
	height:36px;
	width:248px;
	line-height:36px;
 }
.input_inner{
	height:36px;
	width:248px;
	line-height:36px;
	margin-top:1px;
	font-size:14px;
 }
:-webkit-input-placeholder { /* WebKit browsers */ 
	color: #fff; 
} 
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
	color: #fff; 
} 
::-moz-placeholder { /* Mozilla Firefox 19+ */ 
	color: #fff; 
} 
:-ms-input-placeholder { /* Internet Explorer 10+ */ 
	color: #fff; 
} 
</style>
</head>
<body scroll="no">
<img class="bodyBg" src="style/xfj_img/login/bg.png" alt="">
<div>
	<div class="title1">
		<div class="lxf"></div>
		<div class="name">
			<div class="big">国家信访局</div>
			<div class="small">State Bureau for Letters and Calls</div>
		</div>
	</div>
	<div style="padding-left:45px;">
		<div class="center">
			<img style="margin-top:30px;" src="./style/xfj_img/login/title2.png">
		</div>
		<div style="height:10px">&nbsp;</div>
		<form id="form1" >
		<div class="h-15 w-300 center">
			<div class="p-l-30 font14 colorfff left w-140" id="messageDivOld" style="text-align: left;">
			&nbsp;
			</div>
			<div class="clear" style="height: 0px;">&nbsp;</div>
		</div>
		<div id="normalLogin" class="p-l-5">
			<div class="form" style="background-image:url(style/xfj_img/login/bg_opcity.png);">
			<img class="formBg" src="style/xfj_img/login/bg_opcity.png" alt="">
				<div class="content">
					<input id="fake_userName" type="text" style="display: none;" value="请输入账户" >
					<input id="userName" type="text" name="userName">
					<input type="text" name="fake_pass" id="fake_pass" value="请输入密码" style="display:none"/>
					<input type="password" name="pwd" id="pwd" value="gjxfj"/>​
					<div class="btns">
						<input type="button" onclick="doLogin()" name="submit" id="login" class="login" style="background-image:url(style/xfj_img/login/btn.png);" value="登录">
						<input type="reset" class="cancel" style="background-image:url(style/xfj_img/login/btn.png);" value="重置">
					</div>
				</div>
			</div>
		</div>
	   </form>
	</div>
	
</div>
<div class="footer">
		<div class="top">
			<span class="block qq">信访QQ</span>
			<span class="block download"><a href="/system/core/ntko/ntko_gjxfj.exe" style="text-decoration:none;color:#20528f;">控件下载</a></span>
			<span class="block book">用户手册</span>
		</div>
		<hr>
		<div class="bottom">技术支持：北京北大软件工程股份有限公司</div>
</div>
<script type="text/javascript">
/*IE里的password类型的placeholder兼容处理*/
	// On DOM ready, hide the real password
$('#pwd').hide();
$('#userName').hide();
// Show the fake pass (because JS is enabled)
$('#fake_pass').show().css("color","#c1c1c1");
$('#fake_userName').show().css("color","#c1c1c1");
// On focus of the fake password field
$('#fake_pass').focus(function(){
    $(this).hide(); //  hide the fake password input text
    $('#pwd').show().focus(); // and show the real password input password
});
$('#fake_userName').focus(function(){
    $(this).hide(); //  hide the fake password input text
    $('#userName').show().focus(); // and show the real password input password
    $("userName").val("");
});
// On blur of the real pass
$('#pwd').blur(function(){
    if($(this).val() == ""){ // if the value is empty,
        $(this).hide(); // hide the real password field
        $('#fake_pass').show(); // show the fake password
    }
    // otherwise, a password has been entered,
    // so do nothing (leave the real password showing)
});
$('#userName').blur(function(){
    if($(this).val() == ""){ // if the value is empty,
        $(this).hide(); // hide the real password field
        $('#fake_userName').show(); // show the fake password
    }
});
</script>
</body>
</html>