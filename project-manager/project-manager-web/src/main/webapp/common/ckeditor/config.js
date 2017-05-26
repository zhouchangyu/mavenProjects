CKEDITOR.editorConfig = function( config ){
	config.extraPlugins = 'xinput,xtextarea,xradio,xselect,xcheckbox,xcalculate,xfetch,xlist,xseal,xmacrotag,xmacro,ximg,xdocnum,xfeedback,pubmodel,imgupload,xdatasel,xmobileseal,xmobilehandseal,xvoice,xh5hw,xupload,ximg,xsql,quickfill,xautonumber,xqianming';
	config.menu_groups = "clipboard,form,tablecell,tablecellproperties,tablerow,tablecolumn,table,anchor,link,flash,hiddenfield,imagebutton,button,div,xinput,xtextarea,xradio,xselect,xcheckbox,xcalculate,xfetch,xlist,xseal,xmacrotag,xmacro,ximg,xdocnum,xfeedback,xdatasel,xmobileseal,xmobilehandseal,xvoice,xupload,ximg,xh5hw,xsql,xautonumber,xqianming";
	config.allowedContent = true;
	config.baseFloatZIndex = 100;// 编辑器的z-index值 
	config.removePlugins='forms';
	
	
	//config.uiColor = '#FFF'; // 背景颜色 
	//config.undoStackSize =20; //撤销的记录步数 plugins/undo/plugin.js 
	//config.resize_enabled = true;// 取消 “拖拽以改变尺寸”功能 plugins/resize/plugin.js 
	//config.toolbarLocation = 'top';//工具栏的位置 可选：bottom 
//	config.toolbarCanCollapse = true;//工具栏是否可以被收缩
//	config.toolbarStartupExpanded = true;//工具栏默认是否展开

	config.toolbar = 'MyToolbar';// 工具栏（基础'Basic'、全能'Full'、自定义）plugins/toolbar/plugin.js 
	 
    config.toolbar_MyToolbar =
    [
            { name: 'document', items : [ 'Source','NewPage','Preview' ] },
            { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
        	{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
            { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
            '/',
            { name: 'styles', items : ['Font', 'Styles','FontSize','TextColor','BGColor','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'  ] },
            { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
            { name: 'insert', items :[ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'
             ,'Iframe' ] },
            { name: 'links', items : [ 'Link','Unlink','Anchor' ]},
            { name: 'tools', items : [ 'Maximize','-','pubmodel','imgupload','quickfill' ] }
    ]; 
    
//    config.font_style={
//    		element:"span",
//    };
    
    config.fontSize_defaultLabel="14px";//默认字体大小
    //字体编辑时可选的字体大小 plugins/font/plugin.js
    config.fontSize_sizes='8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;72/72px'
	//设置字体大小时 使用的式样 plugins/font/plugin.js
    config.fontSize_style = {
        element   : 'span',
       styles   : { 'font-size' : '#(size)' },
        overrides : [ {element : 'font', attributes : { 'size' : null } } ]
    };
    config.tabSpaces = 4;//当用户键入TAB时，编辑器走过的空格数，(&nbsp;) 当值为0时，焦点将移出编辑框 plugins/tab/plugin.js 
    config.enterMode = CKEDITOR.ENTER_DIV;//编辑器中回车产生的标签 ，可选：CKEDITOR.ENTER_BR或CKEDITOR.ENTER_DIV 
    config.font_names='方正小标宋_GBK/方正小标宋_GBK;方正楷体_GBK/方正楷体_GBK;方正兰亭粗黑_GBK/方正兰亭粗黑_GBK;方正隶书_GBK/方正隶书_GBK;方正美黑_GBK/方正美黑_GBK;方正书宋_GBK/方正书宋_GBK;方正魏碑_GBK/方正魏碑_GBK;华文细黑/华文细黑;宋体/宋体;黑体/黑体;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;
   
};

