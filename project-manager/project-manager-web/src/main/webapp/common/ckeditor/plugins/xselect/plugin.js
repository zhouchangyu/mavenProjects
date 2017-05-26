CKEDITOR.plugins.add('xselect', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xselect', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xselect/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"下拉列表控件",400,480,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xselect', {
            label: "下拉列表控件",
            command: 'xselect',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('xselect', this.path + 'dialogs/xselect.js');
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xselect:{
					label : "下拉列表控件属性",
					command : 'xselect',
					group : 'xselect',
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

					var tagName = element.hasAscendant( 'select', 1 );
					
					if ( tagName && element.getAttribute('xtype')=="xselect")
					{
						return {
							xselect : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});