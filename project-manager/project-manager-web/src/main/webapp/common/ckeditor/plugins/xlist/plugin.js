CKEDITOR.plugins.add('xlist', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xlist', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xlist/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"明细表",800,450,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xlist', {
            label: "明细表",
            command: 'xlist',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('xlist', this.path + 'dialogs/xlist.js');
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xlist:{
					label : "明细表属性",
					command : 'xlist',
					group : 'xlist',
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

					var tagName = element.hasAscendant( 'img', 1 );
					
					if ( tagName && element.getAttribute('xtype')=="xlist")
					{
						return {
							xlist : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});