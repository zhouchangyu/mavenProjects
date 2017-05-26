CKEDITOR.dialog.add('xh5hw', function(editor){
	var nameCode = null;
    var escape = function(value){
        return value;
    };
    return {
        title: 'H5手写签批控件',
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
			},{
				type:'select',
				label:'笔记粗细',
				id:'weight',
				'default':'3',
				items : [ [ '1' ], [ '2' ], [ '3' ], [ '4' ],['5'],['6'],['7'],['8'],['9'],['10']]
			},{
				type:'select',
				label:'颜色',
				id:'color',
				'default':'red',
				items : [ [ '红色','red' ], [ '蓝色','blue' ], [ '黑色','black' ]]
			}]
        }],
        onOk: function(){
			var title = this.getValueOf("cb","title");
			var width = this.getValueOf("cb","width");
			var height = this.getValueOf("cb","height");
			var weight = this.getValueOf("cb","weight");
			var color = this.getValueOf("cb","color");
			
			var html = "<img xtype=\"xh5hw\" title=\""+title+"\" src=\""+(contextPath+"/common/images/workflow/handseal.png")+"\"";
			
			if(nameCode && nameCode!=null){
				html+=" name=\""+nameCode+"\" id=\""+nameCode+"\" w=\""+width+"\" h=\""+height+"\" weight=\""+weight+"\" color=\""+color+"\"";
			}else{
				maxItem++;
				html+=" name=\"DATA_"+maxItem+"\" id=\"DATA_"+maxItem+"\" w=\""+width+"\" h=\""+height+"\" weight=\""+weight+"\" color=\""+color+"\"";
			}
			
			html+="/>";
			editor.insertHtml(html);
        },
        onShow: function(){
			var selection = editor.getSelection();
			var ranges = selection.getRanges();
			var element = selection.getSelectedElement();
			
			if(element!=null && element.getAttribute('xtype')=='xh5hw'){
				nameCode = element.getAttribute('name');
				var title = this.getContentElement("cb","title");
				var height = this.getContentElement("cb","height");
				var width = this.getContentElement("cb","width");
				var weight = this.getContentElement("cb","weight");
				var color = this.getContentElement("cb","color");
				
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
				
				if(element.getAttribute("weight")){
					weight.setValue(element.getAttribute("weight"));
				}else{
					weight.setValue("3");
				}
				
				if(element.getAttribute("color")){
					color.setValue(element.getAttribute("color"));
				}else{
					color.setValue("red");
				}

			}else{
				nameCode = null;
				var height = this.getContentElement("cb","height");
				var width = this.getContentElement("cb","width");
				var weight = this.getContentElement("cb","weight");
				var color = this.getContentElement("cb","color");
				height.setValue("100");
				width.setValue("200");
				weight.setValue("3");
				color.setValue("red");
			}
			
        }
    };
});
