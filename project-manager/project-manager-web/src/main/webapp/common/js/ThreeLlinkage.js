document.ready=function(){
	$("body").on("click",".cascadingInput",function(e){
		var url = $(this).attr("url");
		$(this).parent().addClass("cascadingTd");
		var $tdNode = $(this).parent(".cascadingTd");
		if($tdNode.find(".pageBox").css("display") == "block"){
			return;
		}
		var ml = $(this).attr("mulSelect");
		var text = $(this).val();
		if(ml == "true"){
			var params = {mulSelect:true}
			if(text != "" && text.charAt(text.length - 1) != ","){
				$(this).val(text + ",")
			}
		}
		addPageBox(url,params,$tdNode,function(){
			$(this).next(".pageBox").show();
		});
		e.stopPropagation();
	});

//	$("body").on("change",".cascadingInput",function(e){
//		var text = $(this).val();
//
//	});
//
	$("body").on("blur",".cascadingInput",function(e){
//		var text = $(this).val();
//		var lastStr = text.charAt(text.length - 1);
//		if(lastStr == ","){
//			$(this).val(text.substring(0,text.length-1));
//		}

//		var url = $(this).attr("url");
//		var idList = $(this).siblings("input[type='hidden']").val();
//		var idArray = idList.split(",");
//		var text = $(this).val();
//		var textArray = text.split(",");
//		$.each(idArray,function(index,value){
//			checkId(url,{check:value},function(data){
//				/*的*/
//				if(textArray[index] == data.rows[0].CONTENT){
//					top.$.jBox.tip("输入的内容有不正确项！",'info' , {_timeout:2000});
//					return;
//				}
//			});
//		});

	});

	/*跳转页码*/
	$("body").on("click",".pageIndexBox .pageIndexList li",function(){
		//var index = $(this).text();
		/*考虑到一个页面可能有多个相同class的元素，这里使用的是选择临近的分页盒来操作*/
		$(this).addClass("active").siblings().removeClass("active");
		//$(this).closest('.pageIndexBox').prev(".pageContent").find(".pageBoxList").eq(index-1).show().siblings().hide();
	});
	/*单击最后一页*/
	$("body").on("click",".pageIndexBox .last",function(){
		var index = $(this).prev(".pageIndexList").find("li:last-child").text();
		$(this).siblings('.pageIndexList').find("li:last-child").addClass("active").siblings().removeClass("active");
		$(this).closest('.pageBox').find(".pageBoxList").eq(index).show().siblings().hide();
	});
	/*点击第一页*/
	$("body").on("click",".pageIndexBox .first",function(){
		var index = $(this).prev(".pageIndexList").find("li:first-child").text();
		$(this).siblings('.pageIndexList').find("li:first-child").addClass("active").siblings().removeClass("active");
		$(this).closest('.pageBox').find(".pageBoxList").eq(index).show().siblings().hide();
	});

	/*点击内容的某一项*/
//	$("body").on("click",".pageBoxList li",function(e){alert(1);
////	$(".pageBoxList li").click(function(e){
//
//
//	});
	/*点击空白处隐藏盒子*/
	$("body").click(function(event) {
		var $node = $(event.target);
		if(!$node.hasClass("endPage") || !$node.hasClass("dataItem") || !$node.hasClass("changePage") || !$node.hasClass("morePage")){
			$(".pageBox").parent().remove();
			//window._current_page = undefined;
		}
	});
}

	var _page_url ,//请求地址
	_page_dom ,
	_current_page,
	_timeout,
	_inputText,
	mulSelect;

	var yScrollLength = 0;
	var xScrollLength = 0;

	$(window).scroll(
		function getPageScroll() {
			if (self.pageYOffset) {
				yScrollLength = self.pageYOffset;
				XScrollLength = self.pageXOffset;
			} else if (document.documentElement	&& document.documentElement.scrollTop) {
				yScrollLength = document.documentElement.scrollTop;
				xScrollLength = document.documentElement.scrollLeft;
			} else if (document.body) {
				yScrollLength = document.body.scrollTop;
				xScrollLength = document.body.scrollLeft;
			}
			var arrayPageScroll = new Array(xScrollLength, yScrollLength);
			return arrayPageScroll;
	});
/*
	分页
	参数 url 访问的地址,
	参数 para = {
					page:1,-----传输的页码
					rows:10-----传输的分页
				}
*/

function addPageBox(url,para,$tdNode,callback){
	/*检查是否是模糊查询*/
	if($tdNode.find(".cascadingInput").val() != ''){
		likeQuery($tdNode.find(".cascadingInput").val(),$tdNode);
		return;
	}
	//para = para || {page:1,rows:10};
	$.extend(para,{page:1,rows:10});

	_page_url = url;
	_page_dom = $tdNode;
	ajax_getPage(url,para,function(data){
		renderPage(data,$tdNode);
		callback();
	});
}

function addText($liNode){
	var text = $liNode.text();
	var id = $liNode.attr("id");//获取选中元素
	var $input = $liNode.closest("td").find(".cascadingInput");
	var mulSelect = $input.attr("mulSelect");
	var finalResult = $liNode.attr("finalresult");
	var code = $liNode.attr("code");
	var oldText = $input.val();
	/*判断是否是多选*/
	if(mulSelect == 'true'){//多选
		if(oldText === ""){//原输入框空
			//检测是否回填一级,
			if(finalResult === "false" || finalResult === false){
				return;
			}
			if(code && code!="undefined"){
				$liNode.closest('td').find(".cascadingInput").val(text);
				$liNode.closest('td').find('input[type="hidden"]').val(code);
				return;
			}
			$liNode.closest('td').find(".cascadingInput").val(text);
			$liNode.closest('td').find('input[type="hidden"]').val(id);
		}else{
			/*检查去重*/
			oldText = oldText + ",";
			var oldTextArray = oldText.split(",");
			var check = false;
			$.each(oldTextArray,function(index,value){
				if(value == text){
					top.$.jBox.tip("输入的内容不能重复！",'info' , {_timeout:2000});
					check = true;
					return;
				}
			});
			if(check){
				return;
			}
			//检测是否回填一级
			if(finalResult === "false" || finalResult === false){
				return;
			}
			/*检测写入隐藏的域的值，回填id还是code**/
			if(code && code!="undefined"){
				$liNode.closest('td').find(".cascadingInput").val(text);
				$liNode.closest('td').find('input[type="hidden"]').val(code);
				return;
			}
			if(_inputText === ""){
				$input.val(text);
			}else{
				$input.val(_inputText + "," + text);
			}
			/*拼接ID*/
//			var oldId = $liNode.closest('td').find('input[type="hidden"]').val();
//			$liNode.closest('td').find('input[type="hidden"]').val(oldId + "," + id);
		}
		$liNode.closest(".pageBox").show();
	}else{//单选
		//检测是否回填一级
		if(finalResult === "false" || finalResult === false){
			return;
		}
		/*检测写入隐藏的域的值，回填id还是code**/
		if(code && code!="undefined"){
			$liNode.closest('td').find(".cascadingInput").val(text);
			$liNode.closest('td').find('input[type="hidden"]').val(code);
			return;
		}
		$liNode.closest('td').find(".cascadingInput").val(text);
		$liNode.closest('td').find('input[type="hidden"]').val(id);
	}
	/*获取第一个id然后请求后台 返回ID对应的name 验证是否是输入框的第一个name*/
	var firstId = $liNode.closest("td").find('input[type="hidden"]').val();
	var url;
	//if(firstId.indexOf(",") > 0){
		firstId = id.split(",")[0];
		//var url = "/teeInstructRegistController/inPersonCheck.action";
		url = $liNode.closest("td").find(".cascadingInput").attr("url");

	//}
	checkId(url,{check:firstId},function(data){
		/*验证是否和第一个name是相同的*/
		var wholeName = oldText;

		var firstName = wholeName.split(",")[0];
		if(firstName == data.rows[0].CONTENT){
			top.$.jBox.tip("首项输入错误！",'info' , {_timeout:2000});
		}
	});
}

function renderPage(data,$tdNode){
	/*如果没有下一级直接隐藏当前的内容*/
	if(data.rows.length === 0){
		$tdNode.find(".pageBox").parent().remove();
		return;
	}
	var arr_content=[],arr_index=[];
	arr_content.push('<div style="position:relative;">');
	arr_content.push('<div style="display:block" class="pageBox">');
		arr_content.push('<div class="pageContent">');
			arr_content.push('<ul class="pageBoxList">');
	var json = data;
	var total = data.total;
	var totalPage = Math.ceil(total/10);
	/*渲染内容*/
	var content = json.rows;
	for(var li in content ){
		arr_content.push('<li class="dataItem" code="'+content[li].code+'" finalresult = "'+ content[li].finalresult +'" hasChildren="'+content[li].hasChildren+'" onclick="toNextLevel(this)" id="'+content[li].id+'">'+content[li].content+'</li>');
	}
	arr_content.push('</ul>');
	arr_content.push('</div>');
	/*渲染页码*/
	arr_content.push('<div class="pageIndexBox">');
		arr_content.push('<span class="first endPage" onclick="changePage(1,'+totalPage+')"><span><<</span></span>');
		arr_content.push('<ul class="pageIndexList">');
		if(_current_page && _current_page > 3 ){//点击页大于3页
			if(_current_page < (totalPage - 2)){//有更多页
				arr_content.push('<span class="dotLeft morePage">...</span>');
				for(var i =  _current_page - 2;i<=(_current_page + 2);i++){
					arr_content.push('<li class="changePage" onclick="changePage('+i+','+totalPage+')">'+i+'</li>');
				}
				arr_content.push('<span class="dotRight morePage">...</span>');
			}else{//没有更多页
				arr_content.push('<span class="dotLeft morePage">...</span>');
				for(var i =  (_current_page - 2);i<=totalPage;i++){
					arr_content.push('<li class="changePage" onclick="changePage('+i+','+totalPage+')">'+i+'</li>');
				}
			}
		}
		if( (_current_page && _current_page <= 3 )){//点击的是前三页
			for(var i = 1;i<=totalPage;i++){
				arr_content.push('<li class="changePage" onclick="changePage('+i+','+totalPage+')">'+i+'</li>');
			}
			if(totalPage > 5){
				arr_content.push('<span class="dotRight morePage">...</span>');
			}
		}
		if(!_current_page){//首次加载，未点击页码
			if(totalPage > 5){
				for(var i =  1;i<=5;i++){
					arr_content.push('<li class="changePage" onclick="changePage('+i+','+totalPage+')">'+i+'</li>');
				}
				arr_content.push('<span class="dotRight morePage">...</span>');
			}else{
				for(var i = 1;i<=totalPage;i++){
					arr_content.push('<li class="changePage" onclick="changePage('+i+','+totalPage+')">'+i+'</li>');
				}
			}
		}
		arr_content.push('</ul>');
		arr_content.push('<span class="last endPage" onclick="changePage('+totalPage+','+totalPage+')"><span>>></span></span>');
	arr_content.push('</div>');
	arr_content.push('</div>');
	if($tdNode.find(".pageBox").length !== 0){
		$tdNode.find(".pageBox").parent().remove();
	}
	$tdNode.append(arr_content.join(""));
	$(".pageBox").parent().hide();
	$tdNode.find(".pageBox").parent().show();
	/*添加当前选中页码颜色*/
	$(".pageIndexList li").each(function(index,$tdNode){
		if(_current_page && $($tdNode).text() == _current_page){
			$($tdNode).addClass("active");
		}
		if(!_current_page){
			$(".pageIndexList li").eq(0).addClass("active");
		}
	});
	/*设置分页器的位置*/
	setCss();
}
function setCss(){
	var $pageBox = $(_page_dom).find(".pageBox");
	$pageBox.css({"position":"absolute"});
	adaptScreen(_page_dom.find(".cascadingInput") , $pageBox);

}

function adaptScreen(target,panel){
	//var domOffset = target.offset();
	var domOffset = target.position();
	var leftLength = domOffset.left;
	var topLength = domOffset.top;
	if (isBrowserVersonTop()) { //判断是否需要处理兼容模式
		topLength = topLength + yScrollLength;
	}
	var domHeight = target.outerHeight();
	var panelHeight = panel.outerHeight();
	var showheight = topLength + panelHeight + 31;

	var bodyHeight = $("body").height();
	if(showheight > bodyHeight){//面板超出显示范围
		panel.css( {
			//left : target.position().left + "px",
			left:0,
			//top : target.offset().top - panelHeight + "px"
			top: 0 - domHeight - panelHeight + "px"
		});
	}else{//面板在显示范围内
		panel.css( {
			//left : target.position().left - 5  + "px",
			left:0,
			//top : target.offset().top + domHeight + "px"
			top:"0px"
		});
	}
}

function changePage(index,totalPage){

	var val = _page_dom.find(".cascadingInput").val();
	var para;
	if(val !== ''){//判断当前是不是模糊查询
		var mulSelect = _page_dom.find(".cascadingInput").attr("mulSelect");
		if(mulSelect == "true"){
			val = val.replace("，",",");
			val = val.split(",")[val.split(",").length - 1];
		}
		para = {
				key:val,
				page:index,
				rows:10
		};
	}else{
		para = {
				page:index,
				rows:10
		}
	}
	_current_page = index;
	ajax_getPage(_page_url,para,function(data){
		renderPage(data,_page_dom);
	});
}
function ajax_getPage(url,para,callback){
	$.ajax({
		url:url,
		type:"post",
		data:para,
		dataType:"json",
		success:function(data){
			callback(data);
		}
	});
}
function toNextLevel(node){
	//var id = node.id;
	var id = $(node).attr("id");
	//var children = node.children;
	var children = $(node).attr("haschildren");
	if(!children){
		return;
	}
	var para = {
		id:id,
		page:1,
		rows:10
	};
	ajax_getPage(_page_url,para,function(data){
		renderPage(data,_page_dom);
	});
	var $liNode = $(node);
	addText($liNode);

	if(window.event.stopPropagation){
		window.event.stopPropagation();
	}else{
		window.event.cancelBubble = true;
	}
	return false;
}
var a=1;
function likeQuery(key,$tdNode){
	_current_page = undefined;
	var url = $tdNode.find(".cascadingInput").attr("url");
	/*判断是否是多选，模糊查询只查询发送最后一个*/
	var mulSelect = $tdNode.find(".cascadingInput").attr("mulSelect");
	if(mulSelect == "true"){
		key = key.replace("，",",");
		var inputText = key;
		$tdNode.find(".cascadingInput").val(key);
		key = key.split(",")[key.split(",").length - 1];
		var textArray = inputText.split(",");
		textArray.pop();
		_inputText =  textArray.join(",");
	}
	var para = {
		key:key
	};
	_page_url = url;
	_page_dom = $tdNode;
	clearTimeout(_timeout);
	_timeout = setTimeout(ajax_key(url,para,function(data){
		renderPage(data,$tdNode);
	}),300);
}

function ajax_key(url,para,callback){
	$.ajax({
		url:url,
		type:"post",
		data:para,
		dataType:"json",
		success:function(data){
			callback(data);
		}
	});
}

function checkId(url,para,callback){
	$.ajax({
		url:url,
		type:"post",
		data:para,
		dataType:"json",
		success:function(data){
			callback(data);
		}
	});
}


