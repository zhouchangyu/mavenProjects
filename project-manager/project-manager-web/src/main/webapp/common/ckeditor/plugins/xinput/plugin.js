CKEDITOR.plugins.add('xinput', {
    requires: ['dialog'],
    init: function(editor){
        var b = editor.addCommand('xinput', {
        	exec:function(){
	    		var url = contextPath+"/common/ckeditor/plugins/xinput/plugin.jsp";
	    		top.$.jBox.open("post:"+url,"单行输入框",360,340,{buttons:{"确定":"ok","关闭":true},submit:function(v){
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
        editor.ui.addButton('xinput', {
            label: "单行输入框",
            command: 'xinput',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('xinput', this.path + 'dialogs/xinput.js');
		
		if ( editor.addMenuItems ){
			editor.addMenuItems(
			{
				input:{
					label : "单行输入框属性",
					command : 'xinput',
					group : 'xinput',
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
					
					if ( isInput && element.getAttribute('xtype')=="xinput" && element.getAttribute('type')=="text")
					{
						return {
							input : CKEDITOR.TRISTATE_OFF
						};
					}

					return null;
				} );
		}
    }
});