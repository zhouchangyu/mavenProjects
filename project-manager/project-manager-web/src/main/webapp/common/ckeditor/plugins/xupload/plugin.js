CKEDITOR.plugins.add('xupload', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xupload', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xupload/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"附件上传控件",360,245,{buttons:{"确定":"ok","关闭":true},submit:function(v){
	    			if(v=="ok"){
        				if(validate()){
        					editor.insertHtml(toDomStr());
        					return true;
        				}
        				return false;
        			}
	    		}});
	    	}
	    });
        editor.ui.addButton('xupload', {
            label: "附件上传控件",
            command: 'xupload',
            icon: this.path + 'images/code.jpg'
        });
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xupload:{
					label : "附件上传控件",
					command : 'xupload',
					group : 'xupload',
					order : 5
				}
			});
		}
		
		if ( editor.contextMenu )
		{
			editor.contextMenu.addListener( function( element, selection )
				{
					if ( !element || element.isReadOnly() )
						return null;

					var isTag = element.hasAscendant( 'img', 1 );
					
					if ( isTag && element.getAttribute('xtype')=="xupload")
					{
						return {
							xupload : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});