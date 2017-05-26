CKEDITOR.dialog.add('xmobilehandseal', function(editor){
	var nameCode = null;
    var escape = function(value){
        return value;
    };
    return {
        title: '移动手写控件',
        width: 340,
        height: 80,
        contents: [{
            id: 'cb',
			padding:0,
            elements: [{
				id:'title',
				label:'名称',
				type:"text"
			},{
				type:'text',
				label:'签批显示宽度',
				id:'width'
			},{
				type:'text',
				label:'签批显示高度',
				id:'height'
			}]
        }],
        onOk: function(){
			var title = this.getValueOf("cb","title");
			var width = this.getValueOf("cb","width");
			var height = this.getValueOf("cb","height");
			
			var html = "<img xtype=\"xmobilehandseal\" title=\""+title+"\" src=\""+(contextPath+"/common/images/workflow/handseal.png")+"\"";
			
			if(nameCode && nameCode!=null){
				html+=" name=\""+nameCode+"\" id=\""+nameCode+"\" w=\""+width+"\" h=\""+height+"\"";
			}else{
				maxItem++;
				html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" w=\""+width+"\" h=\""+height+"\"";
			}
			
			html+="/>";
			editor.insertHtml(html);
        },
        onShow: function(){
			var selection = editor.getSelection();
			var ranges = selection.getRanges();
			var element = selection.getSelectedElement();
			
			if(element!=null && element.getAttribute('xtype')=='xmobilehandseal'){
				nameCode = element.getAttribute('name');
				var title = this.getContentElement("cb","title");
				var height = this.getContentElement("cb","height");
				var width = this.getContentElement("cb","width");
				
				if(element.getAttribute("title")){
					title.setValue(element.getAttribute("title"));
				}
				
				if(element.getAttribute("h")){
					height.setValue(element.getAttribute("h"));
				}else{
					height.setValue("100");
				}
				
				if(element.getAttribute("w")){
					width.setValue(element.getAttribute("w"));
				}else{
					width.setValue("200");
				}

			}else{
				nameCode = null;
				var height = this.getContentElement("cb","height");
				var width = this.getContentElement("cb","width");
				height.setValue("100");
				width.setValue("200");
			}
			
        }
    };
});
