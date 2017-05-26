CKEDITOR.plugins.add('xdatasel', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xdatasel', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xdatasel/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"数据选择控件",360,360,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xdatasel', {
            label: "数据选择控件",
            command: 'xdatasel',
            icon: this.path + 'images/code.jpg'
        });
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xdatasel:{
					label : "数据选择控件",
					command : 'xdatasel',
					group : 'xdatasel',
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

					var isInput = element.hasAscendant( 'input', 1 );
					
					if ( isInput && element.getAttribute('xtype')=="xdatasel")
					{
						return {
							xdatasel : CKEDITOR.TRISTATE_OFF
						};
					} 
					return null;
				} );
		}
    }
});