<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath =request.getContextPath();
String secUserMem="1";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<script type="text/javascript" src="./style/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/tools.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/sys.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/js/sysUtil.js"></script>
<script type="text/javascript">
/**
 * 保存
 */
var secUserMem="<%=secUserMem%>";
var loginByCode =1;
function doLogin(){
	 
		var url = "<%=contextPath%>/systemAction/login.action";
		//var para =  tools.formToJson($("#form1")) ;
		var userName =$("#userName").val();
		var password =$("#pwd").val();
		var para={userName:userName,password:password};
		var json = tools.requestJsonRs(url,para);
		if (json.rtState){
			    if(secUserMem == '1'){//允许记忆卡
			    	setCookie('userName',$('#userName').val() , 30);
			    }
			    //var data = json.rtData;
			    //从数据库中读取当前用户登录主题。信访局项目中就使用默认主题。
			    //var theme = data.theme;
			   // var theme="xfj";
			    window.location.href = "<%=contextPath%>/frame/index/index.jsp";
		} else{ 
			 
	 
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
<style>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",arial,sans-serif;
	color: #222;
	font-size: 12px;
}
*{padding: 0px;margin: 0px;}
.top_div{
	background: #008ead;
	width: 100%;
	height: 300px;
}
.ipt{
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
.ipt:focus{
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.u_logo{
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;

}
.p_logo{
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}
a{
	text-decoration: none;
}
.tou{
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}
.left_hand{
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}
.right_hand{
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}
.initial_left_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}
.initial_right_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}
.left_handing{
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}
.right_handinging{
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}

</style>
     
<script type="text/javascript">
$(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	});
});
</script>
 

<body>
<div class="top_div"></div>
<div style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 220px; text-align: center;">
<div style="width: 165px; height: 96px; position: absolute;">
<div class="tou"></div>
<div class="initial_left_hand" id="left_hand"></div>
<div class="initial_right_hand" id="right_hand"></div></div>



<p style="padding: 30px 0px 10px; position: relative;">
<span class="u_logo"></span>         
  <input class="ipt" type="text" id="userName" name="userName" placeholder="请输入用户名或邮箱" value=""></p>
  
  
<p style="position: relative;">
<span class="p_logo"></span>         
<input class="ipt" id="pwd" name="pwd" type="password" placeholder="请输入密码" value=""></p>


<p style="position: relative;padding-top:10px;">
<!--
<span class="p_logo"></span>     
-->    
<input class="ipt" id="yzm" type="text" placeholder="请输入验证码" value=""></p>

<div style="height: 50px; line-height: 50px; margin-top:10px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
<p style="margin: 0px 35px 20px 45px;">
	<span style="float: left;">
	<a style="color: rgb(204, 204, 204);"href="#">忘记密码?</a></span> 
    <span style="float: right;">
	<a style="color: rgb(204, 204, 204); margin-right: 10px;"href="javaScript:void(0)" onclick="reSet()" >重置</a>
    <a style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="javaScript:void(0)" onclick="doLogin()" >登录</a> 
    </span>         
	</p>
	</div>
	
	</div>
</body>
</html>