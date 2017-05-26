CKEDITOR.plugins.add('xcalculate', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xcalculate', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xcalculate/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"计算控件",408,390,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xcalculate', {
            label: "计算控件",
            command: 'xcalculate',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('xcalculate', this.path + 'dialogs/xcalculate.js');
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				xcalculate:{
					label : "计算控件属性",
					command : 'xcalculate',
					group : 'xcalculate',
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
					
					if ( isInput && element.getAttribute('xtype')=="xcalculate" && element.getAttribute('type')=="text")
					{
						return {
							xcalculate : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});