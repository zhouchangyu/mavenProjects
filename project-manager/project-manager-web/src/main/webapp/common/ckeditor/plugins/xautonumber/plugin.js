CKEDITOR.plugins.add('xautonumber', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xautonumber', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xautonumber/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"自动编号控件",360,245,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xautonumber', {
            label: "自动编号控件",
            command: 'xautonumber',
            icon: this.path + 'images/code.jpg'
        });
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xautonumber:{
					label : "自动编号控件",
					command : 'xautonumber',
					group : 'xautonumber',
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

					var isTag = element.hasAscendant( 'input', 1 );
					
					if ( isTag && element.getAttribute('xtype')=="xautonumber")
					{
						return {
							xautonumber : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});