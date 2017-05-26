CKEDITOR.plugins.add('xcheckbox', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xcheckbox', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xcheckbox/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"复选框控件",360,245,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xcheckbox', {
            label: "复选框控件",
            command: 'xcheckbox',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('xcheckbox', this.path + 'dialogs/xcheckbox.js');
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xcheckbox:{
					label : "复选框控件属性",
					command : 'xcheckbox',
					group : 'xcheckbox',
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
					
					if ( isInput && element.getAttribute('xtype')=="xcheckbox" && element.getAttribute('type')=="checkbox")
					{
						return {
							xcheckbox : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});