CKEDITOR.plugins.add('ximg', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('ximg', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/ximg/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"图片上传控件",360,245,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('ximg', {
            label: "图片上传控件",
            command: 'ximg',
            icon: this.path + 'images/code.jpg'
        });
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				ximg:{
					label : "图片上传控件",
					command : 'ximg',
					group : 'ximg',
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
					
					if ( isTag && element.getAttribute('xtype')=="ximg")
					{
						return {
							ximg : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});