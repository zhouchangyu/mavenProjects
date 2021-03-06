var suppotPictureFileType = ["bmp", "jpg" , "gif", "png"];//html支持浏览器浏览类型图片类型
var suppotExcleFileType  = ["xls", "xlsx"];//excle格式文件
var suppotWordFileType  = ["doc", "docx"];//worfd格式文件
var suppotCsvFileType  = ["csv"];//csv格式文件

/**
 * 检查是否是html支持浏览类型
 * @param fileId
 * @returns {Boolean}
 */
function checkSuppotPictureFile(fileId){

	var fileObj = $("#" + fileId)[0];
	var fileName = fileObj.value;
	if(!fileObj || fileName == ''){
		alert("请选择文件!");
		fileObj.focus();
		return false;
	}
	 //lastIndexOf如果没有搜索到则返回为-1
    if(fileName.lastIndexOf(".")!=-1)
    {
	 var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
	     for(var i =0;i<suppotPictureFileType.length;i++){
	    	 if(suppotPictureFileType[i]==fileType){
	    		 return true;
	    	 }else{
	    		 continue;
	    	 }
	     }
	     alert("文件只支持" + suppotPictureFileType.toString());
	     return false;
	}else {
		alert("文件只支持" + suppotPictureFileType.toString());
	}
}

/**
 * 检查是否为excle文件
 * @param fileId
 * @returns {Boolean}
 */
function checkSuppotExcleFile(fileId){

	var fileObj = $("#" + fileId)[0];
	var fileName = fileObj.value;
	if(!fileObj ||  fileName == ''){
		alert("请选择文件!");
		fileObj.focus();
		return false;
	}
	 //lastIndexOf如果没有搜索到则返回为-1
    if(fileName.lastIndexOf(".")!=-1)
    {
	 var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
	     for(var i =0;i<suppotExcleFileType.length;i++){
	    	 if(suppotExcleFileType[i]==fileType){
	    		 return true;
	    	 }else{
	    		 continue;
	    	 }
	     }
	     alert("文件只支持" + suppotExcleFileType.toString());
	     return false;
	}else {
		alert("文件只支持" + suppotExcleFileType.toString());
	}
}


/**
 * 检查是否为word文件
 * @param fileId
 * @returns {Boolean}
 */
function checkSuppotWordFile(fileId){

	var fileObj = $("#" + fileId)[0];
	var fileName = fileObj.value;
	if(!fileObj ||  fileName == ''){
		alert("请选择文件!");
		fileObj.focus();
		return false;
	}
	 //lastIndexOf如果没有搜索到则返回为-1
    if(fileName.lastIndexOf(".")!=-1)
    {
	 var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
	     for(var i =0;i<suppotWordFileType.length;i++){
	    	 if(suppotWordFileType[i]==fileType){
	    		 return true;
	    	 }else{
	    		 continue;
	    	 }
	     }
	     alert("文件只支持" + suppotWordFileType.toString());
	     return false;
	}else {
		alert("文件只支持" + suppotWordFileType.toString());
	}
}

/**
 * 检查是否为csv文件
 * @param fileId
 * @returns {Boolean}
 */
function checkSuppotCsvFile(fileId){

	var fileObj = $("#" + fileId)[0];
	var fileName = fileObj.value;
	if(!fileObj ||  fileName == ''){
		alert("请选择文件!");
		fileObj.focus();
		return false;
	}
	 //lastIndexOf如果没有搜索到则返回为-1
    if(fileName.lastIndexOf(".")!=-1)
    {
	 var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
	     for(var i =0;i<suppotCsvFileType.length;i++){
	    	 if(suppotCsvFileType[i]==fileType){
	    		 return true;
	    	 }else{
	    		 continue;
	    	 }
	     }
	     alert("文件只支持" + suppotCsvFileType.toString());
	     return false;
	}else {
		alert("文件只支持" + suppotCsvFileType.toString());
	}
}


/**
 * 打开模态窗口,不能改变窗口大小
 */
function dialog(actionUrl, width, height) {
  var locX = (screen.width - width) / 2;
  var locY = (screen.height - height) / 2;
  var attrs = null;

  attrs = "status:no;directories:no;";
  attrs += "dialogWidth:" + width + "px;";
  attrs += "dialogHeight:" + height + "px;";
  attrs += "dialogLeft:" + locX + "px;";
  attrs += "dialogTop:" + locY + "px;";

  var IM_OA;
  try{
      IM_OA = window.external.IM_OA;
  }catch(e){}

  if(window.showModelDialog || IM_OA){
  	  dialogChangesize(actionUrl, width, height);
    }else{
  	  openWindow(actionUrl,"", width, height);
    }
//  return window.showModalDialog(actionUrl, self, attrs);
}

/**
 * 打开模态窗口,能改变窗口大小


 */
function dialogChangesize(actionUrl, width, height) {
  var locX = (screen.width - width) / 2;
  var locY = (screen.height - height) / 2;
  var attrs = null;

  attrs = "status:no;directories:yes;scroll:yes;Resizable=yes;";
  attrs += "dialogWidth:" + width + "px;";
  attrs += "dialogHeight:" + height + "px;";
  attrs += "dialogLeft:" + locX + "px;";
  attrs += "dialogTop:" + locY + "px;";

  var IM_OA;
  try{
      IM_OA = window.external.IM_OA;
  }catch(e){}

  if(window.showModelDialog || IM_OA){
	  window.showModalDialog(actionUrl, self, attrs);
    }else{
  	  openWindow(actionUrl,"", width, height);
    }

}


/**
 * 打开窗口,能改变窗口大小


 */
function openWindow(actionUrl, title, width, height) {
  var winParam = "menubar=0,toolbar=0,status=0";
  winParam += ",scrollbars=1,resizable=1";
  var availWidth = window.screen.availWidth;
  var availHeight = window.screen.availHeight;
  if($.browser.webkit){
	  availHeight = parseInt(availHeight)-60;
  }

  if (!width) {
    width = 800;
  }
  if (!height) {
    height = 600;
  }
  var left = (availWidth - width) / 2;
  var top = (availHeight - 100 - height) / 2;
  winParam += ",width=" + width;
  winParam += ",height=" + height;
  winParam += ",top=" + top;
  winParam += ",left=" + left;
  winParam += ",location=no";

  try{
	  if(window.external && window.external.IM_OA){
		window.external.IM_OpenNavigation(title,actionUrl.replace(contextPath,""),width,height);
		return;
	  }
  }catch(e){

  }


  return window.open(actionUrl, new Date().getTime()+"", winParam);
}

 function jBoxWindow(url,title,opts){
	 if(!opts){
		 opts = {};
	 }
	 var width = opts.width||$(top.document).width()-100;
	 var height = opts.height||$(top.document).height()-100;
	 top.$.jBox.open("iframe:"+url,title,width,height,{top:"5%",submit:function(v,h,f){
		 var iframe = $(h).find("iframe:first");
		 var cw = iframe[0].contentWindow;
		 if(opts.submit){
			 return opts.submit(v,h,f,cw);
		 }
		 return true;
	 }});
 }

 /**
  * bsWindow("http://www.baidu.com","标题",{buttons:[{name:"关闭",classStyle:"1"},{name:"开始",classStyle:"2"}]});
  * @param url
  * @param title
  * @param opts
  * @return
  */
 function bsWindow(url,title,opts){
	 if(!opts){
		 opts = {};
	 }
	 var width = opts.width||$(document).width()-100;
	 var height = opts.height||$(document).height()-250;
	 width+="";
	 height+="";
	 if(width.indexOf("%")!=-1){
		 width = width.replace("%","");
		 width = $(document).width()*(parseInt(width)*0.01);
	 }
	 if(height.indexOf("%")!=-1){
		 height = height.replace("%","");
		 height = parseInt(document.documentElement.clientHeight)*(parseInt(height)*0.01);
	 }

	if(!window.BSWINDOW){
		window.BSWINDOW = $("<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\" style=\"\"></div>");
		window.BSWINDOW_BS1 = $("<div class=\"modal-dialog\"></div>");
		window.BSWINDOW_BS2 = $("<div class=\"modal-content\"></div>");
		window.BSWINDOW_BS3 = $("<div class=\"modal-header\"></div>");
		window.BSWINDOW_BS4 = $("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>");
		window.BSWINDOW_BS5 = $("<h4 class=\"modal-title\" id=\"myModalLabel\"></h4>");
		window.BSWINDOW_BS6 = $("<div class=\"modal-body\" style=\"padding-top:0px;padding-bottom:0px;padding-top:3px;\"><center><img src=\""+systemImagePath+"/other/loading1.gif\" /></center></div>");
		if(url.indexOf("html:")!=-1){//加载html
			window.BSWINDOW_BS7 = $("<div></div>").append(url.substring(5));
		}else{
			window.BSWINDOW_BS7 = $("<iframe frameborder=0 style=\"width:100%;height:100%\"></iframe>");
		}
		window.BSWINDOW_BS8 = $("<div class=\"modal-footer\" style=\"\"></div>");
		window.BSWINDOW.css("border","none");
		window.BSWINDOW.append(window.BSWINDOW_BS1);
		window.BSWINDOW_BS1.append(window.BSWINDOW_BS2);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS3);
		window.BSWINDOW_BS3.append(window.BSWINDOW_BS4);
		window.BSWINDOW_BS3.append(window.BSWINDOW_BS5);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS6);
		window.BSWINDOW_BS6.append(window.BSWINDOW_BS7);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS8);

		$("body").append(window.BSWINDOW);
	}else{
		window.BSWINDOW_BS7.remove();
		window.BSWINDOW_BS7 = $("<iframe frameborder=0 style=\"width:100%;height:100%\"></iframe>");
		window.BSWINDOW_BS6.append(window.BSWINDOW_BS7);
	}
	window.BSWINDOW_BS4.click(function(event) {
		window.BSWINDOW.fadeOut(100);
	});
	window.BSWINDOW_BS7.attr("src","").hide();
	window.BSWINDOW_BS6.find("img:first").show();
	//渲染标题
	window.BSWINDOW_BS5.html(title);
	window.BSWINDOW_BS1.css({"width":width});
	window.BSWINDOW_BS6.css({"height":height});
	setTimeout(function(){
		window.BSWINDOW_BS6.find("img:first").hide();
		window.BSWINDOW_BS7.attr("src",url).show();
	},1000);
	window.BSWINDOW_BS8.html("").css("overflow","hidden");
	var shadow = $("<div class=\"modal-backdrop\"></div>");
	shadow.click(function(event) {
		window.BSWINDOW.fadeOut(100);
	}).hide();
	if($(".modal-backdrop").length === 0){
		window.BSWINDOW.append(shadow);
	}
	//渲染按钮
	if(opts.buttons){
		for(var i=0;i<opts.buttons.length;i++){
			var button = opts.buttons[i];
			var classStyle = button.classStyle||"btn_default";
			var name = button.name;
			if(name=="关闭"){
				var btn = $("<button class=\""+classStyle+"\">"+name+"</button>");
			}else{
				var btn = $("<button class=\""+classStyle+"\">"+name+"</button>");
			}
			btn.click(function(){
				if(opts.submit){
					if(opts.submit($(this).html(),window.BSWINDOW_BS7)){
						window.BSWINDOW.fadeOut(100);
					}
				}
			});
			btn.appendTo(window.BSWINDOW_BS8);
		}
	}else{
		var ok = $("<button class=\"btn btn-primary\">确定</button>").click(function(){
			$(this).attr("disabled","disabled");
			if(opts.submit){
				if(opts.submit("ok",window.BSWINDOW_BS7)){
					window.BSWINDOW.hide();
				}else{
					$(this).removeAttr("disabled");
				}
			}else{
				window.BSWINDOW.fadeOut(100);
			}
		}).appendTo(window.BSWINDOW_BS8);
		var close = $("<button class=\"btn btn-danger\"  data-dismiss=\"modal\">关闭</button>").appendTo(window.BSWINDOW_BS8);
		close.click(function(event) {
			window.BSWINDOW.fadeOut(100);
		});

	}
	shadow.show();
	window.BSWINDOW.fadeIn(100);
 }
 /**
  * 全屏幕打开窗口
  * @param actionUrl
  * @param title
  * @returns
  */
 function openFullWindow(actionUrl, title) {
	  var winParam = "menubar=0,toolbar=0,status=0";
	  winParam += ",scrollbars=1,resizable=1";
	  var left = 0;
	  var top = 0;
	  var width = window.screen.availWidth;
	  var height = window.screen.availHeight;
	  height = parseInt(height)-80;
	  winParam += ",width=" + width;
	  winParam += ",height=" + height;
	  winParam += ",top=" + top;
	  winParam += ",left=" + left;
	  winParam += ",location=no";

	  try{
		  if(window.external && window.external.IM_OA){
			window.external.IM_OpenNavigation(title,actionUrl.replace(contextPath,""),0,0);
			return;
		  }
	  }catch(e){

	  }

	  return window.open(actionUrl, new Date().getTime()+"", winParam);
	}

 function openFullDialog(actionUrl, title) {
	  var winParam = "menubar=0,toolbar=0,status=0";
	  winParam += ",scrollbars=1,resizable=1";
	  var left = 0;
	  var top = 0;
	  var width = window.screen.availWidth;
	  var height = window.screen.availHeight;
//	  if($.browser.webkit){
//		  height = parseInt(height)-60;
//	  }
	  height = parseInt(height)-80;
	  var width = window.screen.availWidth;
	  var height = window.screen.availHeight;
	  var attrs = null;

	  attrs = "status:no;directories:yes;scroll:yes;Resizable=no;";
	  attrs += "dialogWidth:" + width + "px;";
	  attrs += "dialogHeight:" + height + "px;";
	  attrs += "dialogLeft:" + left + "px;";
	  attrs += "dialogTop:" + top + "px;";

	  var IM_OA;
	  try{
	      IM_OA = window.external.IM_OA;
	  }catch(e){}

	  if(window.showModelDialog || IM_OA){
	  	  dialogChangesize(actionUrl, width, height);
	    }else{
	  	  openWindow(actionUrl,"", width, height);
	    }
	}

 /**
  * Select 生成 option方便方法


  */
 function setOptions(el,aOption,value){
		for(var i = 0 ;i<aOption.length;i++){
			var _option = document.createElement("option");
		_option.value = aOption[i].value;
		if (aOption[i].value == value) {
	      		_option.selected = true;
	    	}
		_option.appendChild(document.createTextNode(aOption[i].text ));
		el.appendChild(_option);
	}

}

 /**
  * 判断是否是数据类型，包括小数点


  */
 function isNumber(aValue) {
   if (aValue == null) {
     return false;
   }
   var reg = /^([+-]?)\d*\.?\d+$/;
   return reg.test(aValue);
 }
/**
 * 判断是否是整数


 */
function isInteger(aValue) {
  if (aValue == null) {
    return false;
  }
  var reg = /^[-+]?[1-9][0-9]*$/;
  return reg.test(aValue);
}


/**
 * 判断是否是整数+ 0


 */
function isIntegeOrZero(aValue) {
  if (aValue == null) {
    return false;
  }
  var reg = /^\d+$/;
  return reg.test(aValue);
}
/**
 * 判断是否是正整数
 */
function isPositivInteger(aValue) {
  if (aValue == null) {
    return false;
  }
  var reg = /^[1-9][0-9]*$/;
  return reg.test(aValue);
}

/**
 * 判断日期是否有效
 */
function isValidDate(year, month, day) {
  // alert(year + " " + month + " " + day);
  return isValidDateStr(year + "-" + month + "-" + day);
}

/**
 * 判断是否为合法的日期串


 *
 * @str 日期串


 */
function isValidDateStr(str) {
  if (!str) {
    return;
  }
  var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
  if (r == null) {
    return false;
  }
  if (parseInt(r[1]) > 9999 || parseInt(r[1]) < 1753) {
    return false;
  }
  var d = new Date(r[1], r[3]-1, r[4]);
  return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
}

/**
 * 判断是否为合法的时间串


 * @param str
 * @return
 */
function isValidTimeStr(str) {
  if (!str) {
    return;
  }
  var r = str.match(/^(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
  if (r == null) {
    return false;
  }
  if (parseInt(r[1]) > 59 || parseInt(r[1]) < 0) {
    return false;
  }
  if (parseInt(r[2]) > 59 || parseInt(r[2]) < 0) {
    return false;
  }
  if (parseInt(r[3]) > 59 || parseInt(r[3]) < 0) {
    return false;
  }
  return true;
}

/**
 * 判断是否为合法的日期时间串


 * @param str
 * @return
 */
function isValidateTimeStr(str) {
  if (!str) {
    return;
  }
  var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})\s(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
  if (r == null) {
    return false;
  }
  if (parseInt(r[1]) > 9999 || parseInt(r[1]) < 1753) {
    return false;
  }
  var d = new Date(r[1], r[3]-1, r[4]);
  if (!(d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4])) {
    return false;
  }
  if (parseInt(r[5]) > 59 || parseInt(r[5]) < 0) {
    return false;
  }
  if (parseInt(r[6]) > 59 || parseInt(r[6]) < 0) {
    return false;
  }
  if (parseInt(r[7]) > 59 || parseInt(r[7]) < 0) {
    return false;
  }
  return true;
}


/**
 * 是否是有效的文件文件名  特殊字符串
 * @param str
 * @returns 存在特殊字符返回true
 */
function isValidateFilePath(str){
  var re=/["\/\\:*?"<>|]/;
  return str.match(re);
}


 /**
  * 对Date的扩展，将 Date 转化为指定格式的String
  * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符
  * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
  * eg:
  * (new Date()).pattern("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
  * (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04
  * (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04
  * (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04
  * (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
  */
 Date.prototype.pattern=function(fmt) {
     var o = {
     "M+" : this.getMonth()+1, //月份
     "d+" : this.getDate(), //日
     "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
     "H+" : this.getHours(), //小时
     "m+" : this.getMinutes(), //分
     "s+" : this.getSeconds(), //秒
     "q+" : Math.floor((this.getMonth()+3)/3), //季度
     "S" : this.getMilliseconds() //毫秒
     };
     var week = {
     "0" : "/u65e5",
     "1" : "/u4e00",
     "2" : "/u4e8c",
     "3" : "/u4e09",
     "4" : "/u56db",
     "5" : "/u4e94",
     "6" : "/u516d"
     };
     if(/(y+)/.test(fmt)){
         fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
     }
     if(/(E+)/.test(fmt)){
         fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
     }
     for(var k in o){
         if(new RegExp("("+ k +")").test(fmt)){
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
         }
     }
     return fmt;
}


/**
 * 转换日期字符串
 * @param time 时间戳  --时间为空则为系统当前时间
 * @param format  日期转换格式
 */
function getFormatDateStr(time , format){
	var timeStr = "";
	if(time){
		var timeDate =new Date(parseInt(time,10));
	    timeStr = new Date(timeDate).pattern(format);
	}else{
		timeStr = new Date(new Date()).pattern(format);
	}
    return timeStr;
}

/**
 * 转换日期字符串
 * @param time 时间戳
 * @param format  日期转换格式
 */
function getFormatDateTimeStr(time , format){
	var timeStr = "";
	if(time){
		var timeDate =new Date(parseInt(time,10));
	    timeStr = new Date(timeDate).pattern(format);
	}else{
		//timeStr = new Date(new Date()).pattern(format);
	}
    return timeStr;
}

/**
 * 将时间戳转换为字符串 --- 多少天多少小时多少分钟多少秒
 * @param milliSeconds
 * @return
 */
function getTimeMiliBirdDesc(milliSeconds){
	var days = Math.floor(milliSeconds/(60*60*24));
	var milliSeconds = milliSeconds-(days*24*60*60);
	var hours = Math.floor(milliSeconds/(60*60));
	var milliSeconds = milliSeconds-(hours*60*60);
	var minutes = Math.floor(milliSeconds/60);
	var milliSeconds = milliSeconds-(minutes*60);
	var  seconds = Math.floor(milliSeconds);
	var sb = "";
	if(days != 0){
		sb += days + "天";
	}
	if(hours != 0){
		sb += hours+ "小时";
	}
	if(minutes != 0){
		sb += minutes+"分钟";
	}
	if(seconds != 0){
		sb += seconds+"秒";
	}
	return sb;
}


/**
 * 将时间戳转换为字符串 --- 多少天多少小时多少分
 * @param milliSeconds
 * @return
 */
function getTimeMilisecondDesc(milliSeconds){
	if(!milliSeconds || milliSeconds == ''){
		return "";
	}
	var days = Math.floor(milliSeconds/(60*60*24));
	var milliSeconds = milliSeconds-(days*24*60*60);
	var hours = Math.floor(milliSeconds/(60*60));
	var milliSeconds = milliSeconds-(hours*60*60);
	var minutes = Math.floor(milliSeconds/60);
	var milliSeconds = milliSeconds-(minutes*60);

	var sb = "";
	if(days != 0){
		sb += days + "天";
	}
	if(hours != 0){
		sb += hours+ "小时";
	}
	if(minutes != 0){
		sb += minutes+"分钟";
	}
	/*if(seconds != 0){
		sb += seconds+"秒";
	}*/
	return sb;
}

 /**
  * 处理frameset,左边是菜单,右边是功能区,菜单不随着功能区滚动的问题
  * @param menuId
  * @param mainId
  * @param minHeight
  * @param url
  * @return
  */
 function doFramesetScroll(menuId, mainId, minHeight, url) {
   try {
     var main = document.getElementById(mainId);
     var menu = document.getElementById(menuId);
  //   menu.scrolling = "no";
     menu.contentWindow.document.body.style.height = "auto";
     menu.contentWindow.document.attachEvent && menu.contentWindow.document.attachEvent("onmousewheel", function(e) {
       var top = (main.contentWindow.document.documentElement || main.contentWindow.document.body).scrollTop;
       if (e.wheelDelta >= 120) {
         main.contentWindow.scrollTo(0, top - 50);
       }
       else {
         main.contentWindow.scrollTo(0, top + 50);
       }
     });
     main.onload = main.onreadystatechange = function() {
       if (!this.readyState || this.readyState == "complete") {
         menu.contentWindow.scrollTo(0, 0);
         main.contentWindow.document.body.style.minHeight = parseInt(minHeight-160) + "px";
         if (main.contentWindow.attachEvent) {
           main.contentWindow.attachEvent("onscroll", function(e) {
             menu.contentWindow.scrollTo(0, main.contentWindow.document.documentElement.scrollTop);
             return false;
           });
         }
         else if (main.contentWindow.addEventListener) {
           main.contentWindow.addEventListener("scroll", function(e) {
             menu.contentWindow.scrollTo(0, main.contentWindow.document.documentElement.scrollTop);
             return false;
           }, false);
         }
       }
     };
     main.src = url;
   } catch (e) {

   } finally {

   }
}

 /**
  *读取cookie
  *@param name 名称
  */
function getCookie(name){
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if (arr != null){
    	return unescape(arr[2]);
    }else{
    	return null;
    }
    return null;
}

/**
 * 设置cookie
 * @param name 名称
 * @param value 值
 * @param Days  时间
 */
function setCookie(name , value , Days){
	var exp  = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);//天数
	document.cookie = name + "="+ escape (value) + ";path=/;expires=" + exp.toGMTString();
}



/**
 * 消息提示
 * @param msrg
 * @param cntrlId 绑定消息的控件
 * @param type  消息类型[info|error||warning|forbidden|stop|blank] 默认为info
 * @param width 宽度
 * @return
 */
function messageMsg(msrg, cntrlId,type ,width ) {
	if(!width){
		width = 320;
	}
    var msrgDom = "<table class=\"MessageBox\" align=\"center\"  style=\"width:" + width + "px\">";
    if(!type){
        type = "info";
    }
    msrgDom += " <tr>  <td class=\"msg " + type + "\">";
    msrgDom +=  "<div class=\"\" style=\"\">" + msrg + "</div>"
      + " </td> </tr> </table>";
    $("#" + cntrlId).html(msrgDom);
}

function startLoading(container){
	var loadingPic = $("<center><img style='margin-top:40px;' src='"+systemImagePath+"/other/loading1.gif' /></center>");
	$(container).append(loadingPic);
}

function endLoading(container){
	$(container).html("");
}

/**
 * 将form的属性 设置清空
 * form : 表单对象
 */
function setFormClearValue(form){
	$(form).find("input[name][type=text]").each(function(i,obj){
		$(obj).val('');
	});
	$(form).find("input[name][type=hidden]").each(function(i,obj){
		$(obj).val('');
	});
	$(form).find("textarea[name]").each(function(i,obj){
		 $(obj).val('');
	});
	$(form).find("select[name]").each(function(i,obj){
		$(obj).val('');
	});
	$(form).find("input[name][type=checkbox]").each(function(i,obj){
		if($(obj).attr("checked")){
			//$(obj).attr("checked" , false);
		}else{
			//json[$(obj).attr("name")] = 0;
		}
	});
	$(form).find("input[name][type=radio][checked]").each(function(i,obj){
		//$(obj).attr("checked" , false);
	});

	$(form).find("input[name][type=password]").each(function(i,obj){
		$(obj).val();
	});
}

/*---------------------------------------------------------------
 *jquery扩展，加载技术文件和css文件  zhp 2013-12-01
 *主要是动态引入 文件  不需要引入的页面 可以不引入
 *demo 例子
 *$.includePath = "sss";
 *$.include(['css/css.css',
 *  		'js/test.js',
 *   		]);
 * $.includePath = ""; //注意这里 要把这个全局变量 设置还原
 ---------------------------------------------------------------*/
$.extend({
   includePath: '',
   include: function(file)
   {
       var files = typeof file == "string" ? [file] : file;
       for (var i = 0; i < files.length; i++)
       {
           var name = files[i].replace(/^\s|\s$/g, "");
           var att = name.split('.');
           var ext = att[att.length - 1].toLowerCase();
           var isCSS = ext == "css";
           var tag = isCSS ? "link" : "script";
           var attr = isCSS ? " type='text/css' rel='stylesheet' " : " language='javascript' type='text/javascript' ";
           var link = (isCSS ? "href" : "src") + "='" + $.includePath + name + "'";
           if ($(tag + "[" + link + "]").length == 0) document.write("<" + tag + attr + link + "></" + tag + ">");
       }
   }
});

/*----------------------------------------------------------------------------------
 * jbox 文件引入 zhp 2013-12-01 |************在需要的页面拷贝 此段代码 即可************|
 *在jquery 引入之后执行
 * $.includePath = '<%=contextPath1%>/common/jbox-v2.3/jBox/';
 * $.include(['jquery.jBox-2.3.min.js',
 *  		'i18n/jquery.jBox-zh-CN.js',
 *  		'Skins/Default/jbox.css'
 * ]);
 *
---------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------
 * 模板格式化（正则替换）
---------------------------------------------------------------------------------*/
 var FormatModel = function(str,model){
	    for(var k in model){
	        var re = new RegExp("{"+k+"}","g");
	        str = str.replace(re,model[k]);
	    }
	    return str;
	}

$.fn.group=function(){
	var curr = $(this);
	curr.children().each(function(i,obj){
		$(obj).click(function(){
			curr.children().each(function(i1,obj1){
				$(obj1).removeClass("active");
			});
			$(this).addClass("active");
		});
	});
}



/**
 * 添加Tab页
 *tabName：标签名称
 *tabURl 路径
 */
function addNewTabs(tabName, tabUrl){
	if(!$('#mainTabs').tabs('exists',tabName)){//判断是否存在路径
		 $('#mainTabs').tabs('add',{
				title:  tabName,
				content: '<iframe width="100%" height="100%" frameborder="0"  src="' + tabUrl + '" style="width:100%;height:100%;"></iframe>',
				closable: true

			});
	 }else{
		 $('#mainTabs').tabs('select',tabName);
	 }
}

function createNewWork(flowId,initData){
	var url = contextPath+"/flowRun/createNewWork.action";
	var param = {};
	if(initData){
		for(var key in initData){
			param[key] = initData[key];
		}
	}
	param["fType"] = flowId;
	var json = tools.requestJsonRs(url,{fType:flowId});
	if(json.rtState){
		window.openFullWindow(contextPath+"/system/core/workflow/flowrun/prcs/index.jsp?runId="+json.rtData.runId+"&frpSid="+json.rtData.frpSid+"&flowId="+flowId+"&isNew=1","流程办理");
	}else{
		alert(json.rtMsg);
	}
}

//是否开启业务引擎
function isOpenBisEngine(type){
	var json = tools.requestJsonRs(contextPath+"/bisConfig/isOpenBisEngine.action",{type:type});
	return json.rtData;
}

//通过post打开窗体
function openPostWindow(url,param,target){
	var form = $("#_SYS_HIDDEN_FORM");
	if(form.length==0){
		form = $("<form id='_SYS_HIDDEN_FORM'></form>");
		$("body").append(form);
	}
	form.attr("method","post").attr("target",target).attr("action",url).html("");

	for(var key in param){
		var input = $("<input type='hidden' name='"+key+"'/>")
		input.attr("value",param[key]);
		form.append(input);
	}
	form.submit();
}

String.prototype.EndWith=function(s){
	  if(s==null||s==""||this.length==0||s.length>this.length)
	     return false;
	  if(this.substring(this.length-s.length)==s)
	     return true;
	  else
	     return false;
	  return true;
	 }

	 String.prototype.StartWith=function(s){
	  if(s==null||s==""||this.length==0||s.length>this.length)
	   return false;
	  if(this.substr(0,s.length)==s)
	     return true;
	  else
	     return false;
	  return true;
	 }

	 /**
	  * 统一关闭窗体方法
	  */
	 function CloseWindow(){
		 try{
			 if(window.external && window.external.IM_OA){
				 window.external.IM_Close();
			 }else{
				window.close();
			 }
		 }catch(e){
			 window.close();
		 }
	 }
	 (function($){
/*模态框*/
$.fn.modal=function(order){
	var modal = this;
	var cookie,modalName;
	/*var date = new Date();*/
	var timestamp = Date.parse(new Date());
	var zIndex = timestamp/1000;
	var zhezhao = '<div id="modal-box"></div>';
	var modalClass = $(modal).attr("class");
	var scrTop = $(window).scrollTop();
	var _width = document.documentElement.clientWidth;  //屏幕宽
	var _height = document.documentElement.clientHeight; //屏幕高
	if(typeof(order)=="undefined"){
		addZhezhao();
		addModal();
	}else if (order=="show"){
		addZhezhao();
		addModal();
		showModal();
		modalCss();
	}else if(order=="hide"){
		hideModal();
	};
	function addZhezhao (){
		$("body").prepend(zhezhao);
		};
		function addModal(){
			if(modalClass.indexOf(" ") > 0 ){
			var name = modalClass.split(" ");
			for(var i=0;i<name.length;i++){
				if(name[i].substring(0,6)=="modal-"){
					cookie = name[i];
					break;
				}
			}
			modalName = cookie.substring(6);
			$(".modal-"+ modalName).fadeIn(100);
		}else{
			modalName = modalClass.substring(6);
			$(".modal-"+ modalName).fadeIn(100);
		};
		var boxWidth = $(".modal-"+ modalName).width();
		var boxHeight = $(".modal-"+ modalName).height();

		/*$("#modal-box").css("zIndex",date.getTime());
		$(".modal-"+ modalName).css("zIndex",(date.getTime()+10));*/
		$("#modal-box").css("zIndex",zIndex);
		$(".modal-"+ modalName).css("zIndex",zIndex);
		$(".modal-"+ modalName).css({position:"fixed", top: ((_height - boxHeight) / 2) +"px", left: (_width - boxWidth) / 2 + "px" });
		$(".modal-"+ modalName).on("click",".modal-win-close,.modal-btn-close",function(){
			$("#modal-box").remove();
			$(".modal-"+ modalName).find("input[type=text],textarea").html("").val("");
			$(".modal-"+ modalName).hide();
		});
		$(".modal-"+ modalName + " .modal-header").css(
				{"width":"100%",
				"height":"38px",
				"background-color":"#8ab0e6"}
			);
		$(".modal-"+ modalName + " .modal-header .modal-title").css(
				{"color":"#fff",
				"font-size":"16px",
				"line-height":"38px",
				"float":"left",
				"margin-left":"20px"}
			);
		$(".modal-"+ modalName + " .modal-header .modal-win-close").css(
				{"color":"#fff",
				"font-size":"16px",
				"line-height":"38px",
				"float":"right",
				"cursor":"pointer",
				"margin-right":"20px"}
			);
		$(".modal-"+ modalName + " .modal-body").css(
			{
			"padding":"10px",
			"-moz-box-sizing": "border-box",
		    "-webkit-box-sizing": "border-box",
		    "-o-box-sizing": "border-box",
		    "-ms-box-sizing": "border-box",
			"background-color":"#f4f4f4"}
		);
		$(".modal-"+ modalName + " .modal-footer").css(
			{"width":"100%",
			"height":"53px",
			"line-height":"60px",
			"background-color":"#f4f4f4"}
		);
		$(".modal-"+ modalName + " .modal-footer input").css(
			{"margin-top":"12px",
			"float":"right",
			"margin-right":"20px"}
		);
	};
	function showModal(){
		//console.log(modal);
		$(modal).fadeIn(100);
	};
	function hideModal(){
		$("#modal-box").remove();
		$(modal).hide();
	};
	function modalCss() {
		var boxWidth = $(modal).width();
		var boxHeight = $(modal).height();
		$("#modal-box").css("zIndex",zIndex);
		$(modal).css("zIndex",(zIndex+1));
		$(modal).css({position:"fixed", top: ((_height - boxHeight) / 2 - 50) +"px", left: (_width - boxWidth) / 2 + "px" });
		$(modal).on("click",".modal-win-close,.modal-btn-close",function(){
			$("#modal-box").remove();
			$(modal).find("input[type=text],textarea").html("").val("");
			$(modal).hide();
		});
	};
};
$(".modal-confirm").on("click",function(){
	var onclick = $(this).attr("onclick");
	if(onclick == "undefined"){
		$("#modal-box").remove();//移除黑色背景
		$(".modal-win-close").click();//移除模态框
	}
});
//确认的按钮写在onclick的函数里
// $("#modal-box").remove();//移除黑色背景
// $(".modal-win-close").click();//移除模态框

})(jQuery);