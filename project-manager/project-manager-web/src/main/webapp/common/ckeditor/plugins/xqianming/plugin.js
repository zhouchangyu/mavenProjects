CKEDITOR.plugins.add('xqianming', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xqianming', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xqianming/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"签名控件",360,245,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xqianming', {
            label: "签名控件",
            command: 'xqianming',
            icon: this.path + 'images/code.jpg'
        });
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xqianming:{
					label : "签名控件",
					command : 'xqianming',
					group : 'xqianming',
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
					
					if ( isInput && element.getAttribute('xtype')=="xqianming")
					{
						return {
							xqianming : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});