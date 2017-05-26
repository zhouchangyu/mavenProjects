(function(){
	window.SeniorReport=function(settings){
		this.reportId = settings.reportId;
		this.target = settings.target;
		this.params = settings.params||{};
		this.showTitle = settings.showTitle;//是否显示标题
		if(settings.showTitle==undefined){
			this.showTitle = true;
		}
		this.tplName;
		this.type;
		var curObj = this;
		
		this.table = $("<table class='table table-bordered table-striped' style='text-align:center;font-size:12px;width:auto;margin-top:20px;word-break: keep-all;' nowrap='nowrap'></table>");
		this.thead = $("<thead></thead>");
		this.theadTd1 = $("<td style='padding:0px;'></td>");
		this.theadTr1 = $("<tr></tr>");
		this.theadTr1.append(this.theadTd1);
		this.thead.append(this.theadTr1);
		this.tbody = $("<tbody></tbody>");
		this.tfoot = $("<tfoot></tfoot>");
		this.tfootTr1 = $("<tr><td></td></tr>");
		this.tfoot.append(this.tfootTr1);
		this.table.append(this.thead);
		this.table.append(this.tbody);
		this.table.append(this.tfoot);
		
		this.reportTemplate;
		this.tplName;
		this.header;
		this.body;
		this.footer;
		this.group;
		this.type;
		this.reportTemplate;
		
		this.headerSeq = [];
		this.columnSeq = [];
		this.footerSeq = [];
		this.extData = {};
		this.extDataReverse = {};
		this.pieExtData = {};
		this.pieExtDataReverse = {};
		this.rowsData = {};
		this.colsData = {};
		
		this.changeType=function(_type){
			curObj.type=_type;
			if(curObj.reverse==0){
				//生成图表
				curObj.originGraphics();
			}else{
				//生成图表
				curObj.reversegenGraphics();
			}
		}
		
		tools.requestJsonRs(contextPath+"/seniorReport/getReport.action",{uuid:curObj.reportId},true,function(json){
			curObj.reportTemplate = json.rtData;
			curObj.tplName = curObj.reportTemplate.tplName;
			curObj.header = eval("("+curObj.reportTemplate.header+")");
			curObj.body = eval("("+curObj.reportTemplate.body+")");
			curObj.footer = eval("("+curObj.reportTemplate.footer+")");
			curObj.group = curObj.reportTemplate.group;
			curObj.type = curObj.reportTemplate.chartType;
			curObj.reverse = curObj.reportTemplate.reverse;
			
			//判断是否为gez报表类型
			if(curObj.reportTemplate.resId!=0){
				curObj.target.html("<iframe style='width:100%;height:100%' src='"+gezAddr+"/reportmis/gezEntry.url?patternID=SR&resID="+curObj.reportTemplate.resId+"' frameborder=0></iframe>");
				return;
			}
			
			var parastr = curObj.reportTemplate.params||"";
			var sp = parastr.split("&");
			var tmpParams={};
				for(var i=0;i<sp.length;i++){
					if(sp[i]!=""){
						var s = sp[i].split("=");
						tmpParams[s[0]] = s[1];
					}
				}
				
				curObj.groupArr = [];//分组
				
				//分页大小
				var pageSize = settings.pageSize||curObj.reportTemplate.pageSize;
				if(pageSize==0){
					pageSize = 10000000;
				}
				var requestData = {reportId:curObj.reportId,page:1,rows:pageSize};
				
				//覆盖参数
				for(var key in curObj.params){
					tmpParams[key] = curObj.params[key];
				}
				
				for(var key in tmpParams){
					requestData[key] = tmpParams[key];
				}
			
			//获取数据集合
			tools.requestJsonRs(contextPath+"/seniorReport/reportDatas.action",requestData,true,function(_datas){
				curObj.datas = _datas.rtData;
				if(curObj.datas instanceof Array){
					curObj.series = [];//y轴
					curObj.categories = [];//x轴
					//数据矩阵
					curObj.rect = [];
					if(curObj.datas==null || !curObj.datas){
						curObj.target.html("<center><h4 style='font-family:微软雅黑'>无数据集合</h4></center>");
						return;
					}
					for(var i=0;i<curObj.datas.length;i++){
						var data = curObj.datas[i];
						//进行对号数据矩阵填充
						var r1 = [];
						for(var j=0;j<curObj.body.length;j++){
							if(curObj.body[j].exp.indexOf("=")==-1){//无表达式
								var fixed = curObj.header[j].fixed;
								var tmp = Number(data[curObj.body[j].exp]);
								if(isNaN(tmp)){
									tmp = 0;
								}
								if(fixed!=null && fixed!="0"){
									tmp = tmp.toFixed(Number(fixed));
								}
								r1.push(tmp+"");
							}else{//有表达式
								r1.push(curObj.body[j].exp);
							}
						}
					
						//行计算
						curObj.bodyRowCal(r1);
						
						curObj.rect.push(r1);
					}
					
					//列统计计算
					for(var i=0;i<curObj.footer.length;i++){
						if(curObj.footer[i].exp.indexOf("=SUM")!=-1){//处理SUM
							var total = 0;
							for(var j=0;j<curObj.rect.length;j++){
								total+=Number(curObj.rect[j][i]);
							}
							curObj.footer[i] = total;
						}else if(curObj.footer[i].exp.indexOf("=AVG")!=-1){
							var total = 0;
							for(var j=0;j<curObj.rect.length;j++){
								total+=Number(curObj.rect[j][i]);
							}
							curObj.footer[i] = total/curObj.datas.length;
						}else if(curObj.footer[i].exp.indexOf("=MAX")!=-1){
							var max = -99999999999;
							var v=0;
							for(var j=0;j<curObj.rect.length;j++){
								v = Number(curObj.rect[j][i]);
								if(max<v){
									max=v;
								}
							}
							curObj.footer[i] = max;
						}else if(curObj.footer[i].exp.indexOf("=MIN")!=-1){
							var min = 99999999999;
							var v=0;
							for(var j=0;j<curObj.rect.length;j++){
								v = Number(curObj.rect[j][i]);
								if(min>v){
									min=v;
								}
							}
							curObj.footer[i] = min;
						}else{
							curObj.footer[i] = "";
						}
						
						curObj.tfootTr1.append("<td>"+curObj.footer[i]+"</td>");
						curObj.footerSeq.push(curObj.footer[i]);
					}
					
					//渲染表头
					for(var i=0;i<curObj.header.length;i++){
						curObj.theadTr1.append("<th style='white-space: nowrap;'>"+curObj.header[i].field+"</th>");
						curObj.headerSeq.push(curObj.header[i].field);
						var colData = [];
						for(var j=0;j<curObj.rect.length;j++){
							colData.push(Number(curObj.rect[j][i]));
							curObj.extData[(curObj.header[i].field)+j] = curObj.datas[j];
							curObj.pieExtData["百分比"+j] = curObj.datas[j];
						}
						curObj.series.push({name:curObj.header[i].field,data:colData});
					}
					//渲染数据体
					for(var i=0;i<curObj.rect.length;i++){
						var render = ["<tr>"];
						render.push("<td style='text-align:left'>"+curObj.datas[i][curObj.group]+"</td>");
						curObj.columnSeq.push(curObj.datas[i][curObj.group]);
						curObj.groupArr.push(curObj.datas[i][curObj.group]);
						curObj.categories.push(curObj.datas[i][curObj.group]);
						for(var j=0;j<curObj.rect[i].length;j++){
							render.push("<td>"+curObj.rect[i][j]+"</td>");
							curObj.extDataReverse[(curObj.datas[i][curObj.group])+j] = curObj.datas[i];
							curObj.pieExtDataReverse["百分比"+i] = curObj.datas[i];
						}
						render.push("</tr>");
						curObj.tbody.append(render.join(""));
					}
					
					curObj.reverseRect = curObj.rectReverse(curObj.rect);//计算反转矩阵
					curObj.reverseCategories = [];//反转分组
					curObj.reverseSeries = [];//反转序列
					
					//计算反转分组
					for(var i=0;i<curObj.header.length;i++){
						curObj.reverseCategories.push(curObj.header[i].field);
					}
					
					//计算反转序列
					for(var i=0;i<curObj.groupArr.length;i++){
						var colData = [];
						for(var j=0;j<curObj.reverseRect.length;j++){
							colData.push(Number(curObj.reverseRect[j][i]));
						}
						curObj.reverseSeries.push({name:curObj.groupArr[i],data:colData});
					}
					
					if(settings.success){
						settings.success();
					}
				}else{//设计形式的报表
					var data = curObj.datas;
					curObj.series = [];//y轴
					curObj.categories = data.colsHeader;//x轴
					curObj.reverseCategories = data.rowsHeader;
					curObj.colsHeader = data.colsHeader;//x轴
					curObj.rowsHeader = data.rowsHeader;
					curObj.reverseSeries = [];
					curObj.rowsData = data.rowsData;
					curObj.colsData = data.colsData;
					var label = "data:image/jpg;base64,"+data.label;
					curObj.theadTd1.html("<img src=\""+label+"\" />");
					
					//数据矩阵
					curObj.rect = data.sumsValues;
					curObj.reverseRect = curObj.rectReverse(curObj.rect);//计算反转矩阵
					
					if(data.rowsHeader.length!=0 && data.colsHeader.length==0){
						for(var i=0;i<data.rowsHeader.length;i++){
							var render = ["<tr>"];
							render.push("<td>"+data.rowsHeader[i]+"</td>");
							render.push("<td>"+curObj.rect[0][i]+"</td>");
							curObj.series.push({name:data.rowsHeader[i],data:[curObj.rect[0][i]]});
							render.push("</tr>");
							curObj.tbody.append(render.join(""));
						}
						
						var desc = "";
						if(data.sums.type=="COUNT"){
							desc = "计数";
						}else if(data.sums.type=="DISTINCT"){
							desc = "计数投影";
						}else if(data.sums.type=="MAX"){
							desc = "最大值";
						}else if(data.sums.type=="MIN"){
							desc = "最小值";
						}else if(data.sums.type=="AVG"){
							desc = "平均值";
						}else if(data.sums.type=="SUM"){
							desc = "求和";
						}
						curObj.categories = [data.sums.name+"("+desc+")"];
						curObj.theadTr1.append("<td>"+data.sums.name+"("+desc+")"+"</td>");
						curObj.reverseSeries.push({name:data.sums.name+"("+desc+")",data:curObj.rect[0]});
						
					}else if(data.rowsHeader.length==0 && data.colsHeader.length!=0){
						
						for(var i=0;i<data.colsHeader.length;i++){
							var render = ["<tr>"];
							curObj.theadTr1.append("<td>"+data.colsHeader[i]+"</td>");
							render.push("</tr>");
						}
						
						
						var desc = "";
						if(data.sums.type=="COUNT"){
							desc = "计数";
						}else if(data.sums.type=="DISTINCT"){
							desc = "计数投影";
						}else if(data.sums.type=="MAX"){
							desc = "最大值";
						}else if(data.sums.type=="MIN"){
							desc = "最小值";
						}else if(data.sums.type=="AVG"){
							desc = "平均值";
						}else if(data.sums.type=="SUM"){
							desc = "求和";
						}
						
						var render = ["<tr>"];
						render.push("<td>"+data.sums.name+"("+desc+")"+"</td>");
						for(var i=0;i<data.sumsValues[0].length;i++){
							render.push("<td>"+data.sumsValues[0][i]+"</td>");
							curObj.reverseSeries.push({name:data.colsHeader[i],data:[data.sumsValues[0][i]]});
						}
						render.push("</tr>");
						curObj.tbody.append(render.join(""));
						curObj.series.push({name:data.sums.name+"("+desc+")",data:curObj.rect[0]});
						curObj.reverseCategories = [data.sums.name+"("+desc+")"];
						
						var tmpRect = curObj.rect;
						curObj.rect = curObj.reverseRect;
						curObj.reverseRect = tmpRect;
						
					}else{
						for(var i=0;i<data.rowsHeader.length;i++){
							var render = ["<tr>"];
							render.push("<td>"+data.rowsHeader[i]+"</td>");
							for(var j=0;j<curObj.rect[i].length;j++){
								render.push("<td>"+curObj.rect[i][j]+"</td>");
							}
							curObj.series.push({name:data.rowsHeader[i],data:curObj.rect[i]});
							render.push("</tr>");
							curObj.tbody.append(render.join(""));
						}
						for(var i=0;i<data.colsHeader.length;i++){
							curObj.theadTr1.append("<td>"+data.colsHeader[i]+"</td>");
							curObj.reverseSeries.push({name:data.colsHeader[i],data:curObj.reverseRect[i]});
						}
					}
					
					if(settings.success){
						settings.success();
					}
				}
				
			});
			
			
		});
		
		this.show = function(){
			if(curObj.reportTemplate.reverse==0){
				//生成图表
				curObj.originGraphics();
			}else{
				//生成图表
				curObj.reversegenGraphics();
			}
		}
		
		this.originGraphics=function(){
			try{
				curObj.target.highcharts().destroy();
			}catch(e){
				
			}
			curObj.reverse=0;
			this.genGraphics(curObj.categories,curObj.series,curObj.rect);
		}

		this.reversegenGraphics=function(){
			try{
				curObj.target.highcharts().destroy();
			}catch(e){
				
			}
			curObj.reverse=1;
			this.genGraphics(curObj.reverseCategories,curObj.reverseSeries,curObj.reverseRect);
		}
		
		this.showTable=function(t){
			$(t).html(curObj.table);
		}
		//导出excel
		this.exportExcel=function(){
			var iframe = $("#SYS_HIDDEN_DOWNLOAD_IFRAME");
			if(iframe.length==0){
				iframe = $("<iframe id='SYS_HIDDEN_DOWNLOAD_IFRAME' name='SYS_HIDDEN_DOWNLOAD_IFRAME' style='display:none'></iframe>");
				$("body").append(iframe);
			}
			
			var headerSeq;
			var columnSeq;
			var bodyData;
			if(curObj.reverse==0){//非反转
				headerSeq = tools.jsonArray2String(curObj.headerSeq);
				columnSeq = tools.jsonArray2String(curObj.columnSeq);
				bodyData = tools.jsonArray2String(curObj.rect);
			}else{//反转
				headerSeq = tools.jsonArray2String(curObj.columnSeq);
				columnSeq = tools.jsonArray2String(curObj.headerSeq);
				bodyData = tools.jsonArray2String(curObj.reverseRect);
			}
			window.openPostWindow(contextPath+"/seniorReport/exportExcel.action",{headerSeq:headerSeq,
				columnSeq:columnSeq,
				bodyData:bodyData,
				tplName:curObj.tplName,
				group:curObj.group,
				footerSeq:tools.jsonArray2String(curObj.footerSeq),
				reverse:curObj.reverse},"SYS_HIDDEN_DOWNLOAD_IFRAME");
		}
		
		this.bodyRowCal = function(arr){
			for(var i=0;i<arr.length;i++){
				if(arr[i].indexOf("=")!=-1){//表达式
					arr[i] = this.bodyExpCal(arr[i],arr,i);
				}
			}
		}

		//处理SUM(A1,A2,A3),并计算表达式
		this.bodyExpCal = function(exp,arr,index){
			//截取函数与参数值
			var FUNC_EXP = /(SUM|AVG|MAX|MIN)\([A-Z0-9,]+\)/gi;
			var r = "";
			var _exp = exp;
			while(r=FUNC_EXP.exec(exp)){
				_exp = _exp.replace(r[0],this.bodyExpCellCal(r[0],arr));
			}
			
			//处理单项cell,例如A1
			var CELL_EXP = /[A-Z]{1}[0-9]+/gi;
			var r = "";
			exp = _exp;
			while(r=CELL_EXP.exec(exp)){
				_exp = _exp.replace(r[0],this.bodyExpCellItemCal(r[0],arr));
			}
			
			var tmp = eval("("+_exp.replace("=","")+")");
			var fixed = curObj.header[index].fixed;
//			document.title = curObj.header[index].field;
			if(fixed!=null && fixed!="0"){
				tmp = tmp.toFixed(Number(fixed));
			}
			if(isNaN(tmp)){
				tmp = 0;
			}
			arr[index] = tmp+"";
			return tmp+"";
		}

		this.bodyExpCellCal = function(r,arr){
			var cells = r.substring(4,r.length-1).split(",");
			if(r.indexOf("SUM")!=-1){//总和
				var total = 0;
				for(var i=0;i<cells.length;i++){
					var tmp = arr[parseInt(cells[i].substring(1))-1];
					if(tmp.indexOf("=")!=-1){
						total+=Number(this.bodyExpCal(tmp,arr,parseInt(cells[i].substring(1))-1));
					}else{
						total+=Number(tmp);
					}
				}
				return total;
			}else if(r.indexOf("AVG")!=-1){//平均
				var total = 0;
				for(var i=0;i<cells.length;i++){
					var tmp = arr[parseInt(cells[i].substring(1))-1];
					if(tmp.indexOf("=")!=-1){
						total+=Number(this.bodyExpCal(tmp,arr,parseInt(cells[i].substring(1))-1));
					}else{
						total+=Number(tmp);
					}
				}
				return total/cells.length;
			}else if(r.indexOf("MAX")!=-1){//最大
				var max = -9999999999;
				var v = 0;
				for(var i=0;i<cells.length;i++){
					var tmp = arr[parseInt(cells[i].substring(1))-1];
					if(tmp.indexOf("=")!=-1){
						v = Number(this.bodyExpCal(tmp,arr,parseInt(cells[i].substring(1))-1));
					}else{
						v = Number(tmp);
					}
					if(max<v){
						max=v;
					}
				}
				return max;
			}else if(r.indexOf("MIN")!=-1){//最小
				var min = 999999999999;
				var v = 0;
				for(var i=0;i<cells.length;i++){
					var tmp = arr[parseInt(cells[i].substring(1))-1];
					if(tmp.indexOf("=")!=-1){
						v = Number(this.bodyExpCal(tmp,arr,parseInt(cells[i].substring(1))-1));
					}else{
						v = Number(tmp);
					}
					if(min>v){
						min=v;
					}
				}
				return min;
			}
			return "";
		}

		this.bodyExpCellItemCal = function(col,arr){
			var tmp = arr[parseInt(col.substring(1))-1];
			if(tmp.indexOf("=")!=-1){
				return this.bodyExpCellCal(tmp,arr);
			}else{
				return Number(tmp);
			}
		}


		//反转矩阵
		this.rectReverse = function (arr){
			if(arr==null || !arr[0]){
				return;
			}
			//定义一个数组存放转置后的数据
		    var arr1=[];
		    //把装置的数据放入一个数组arr1中
		    //1、初始化，确定有多少行
		    for(var i=0;i<arr[0].length;i++){
		        arr1[i]=[];
		    }
		    //2、先遍历旧数组，再动态添加数据
		    for(var i=0;i<arr.length;i++){
		        
		        for(var j=0;j<arr[i].length;j++){
		            //动态添加数据到arr1数组中
		            arr1[j][i]=arr[i][j];
		            
		        }
		        //document.writeln("<br/>");
		    }
		    return arr1;
		}

		this.genGraphics=function(_categories,_series,_rect){
			if(curObj.type=="table"){//只显示报表表格
				curObj.target.html(curObj.table);
				return;
			}
			if(curObj.type=="pie"){//饼状图
				var tmpSeries = new Array(_series.length);
				//过滤series
				for(var i=0;i<_series.length;i++){
					tmpSeries[i] = {};
					tmpSeries[i].data = [];
					tmpSeries[i].type = "pie";
					tmpSeries[i].name = "百分比";
					for(var j=0;j<_categories.length;j++){
						var arr = [];
						arr.push(_categories[j]);
						arr.push(Number(_rect[j][i]));
						tmpSeries[i].data.push(arr);
					}
				}
				
				$(curObj.target).highcharts({
			        chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false,
			            backgroundColor:"none"
			        },
			        title: {
			            text: (curObj.showTitle?curObj.tplName:"")
			        },
			        tooltip: {
			    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    color: '#000000',
			                    connectorColor: '#000000',
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			                },
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            }
			        },
			        series: tmpSeries
			    });
			}else if(curObj.type=="funnel"){//漏斗图
				
				//_categories
				//_series.data;
				var tempData = new Array();
				for(var jj = 0; jj<_categories.length ; jj++){
					var tempChildData = new Array();
					tempChildData.push(_categories[jj] );
					tempChildData.push(_series[0].data[jj] );
					tempData.push(tempChildData);
				}
	 			$(curObj.target).highcharts({
	 	        chart: {
	 	            type: 'funnel',
		 	            marginRight: 100
		 	        },
		 	        title: {
		 	        	text: (curObj.showTitle?curObj.tplName:""),
		 	            x: -50
		 	        },
		 	        plotOptions: {
		 	        	 series: {
		 	        		cursor: 'pointer',
		 	                dataLabels: {
		 	                    enabled: true,
		 	                    format: '<b>{point.name}</b> ({point.y:,.0f})',
		 	                    color: 'black',
		 	                    softConnector: true
		 	                },
		 	                neckWidth: '30%',
		 	                neckHeight: '25%',
			                events: {
			                	click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			                
		 	                //-- Other available options
		 	                // height: pixels or percent
		 	                // width: pixels or percent
		 	            }
		 	        },
		 	        legend: {
		 	            enabled: false
		 	        },
		 	        series: [{
		 	        	name:'数量',
		 	            data: tempData
		 	        }]
		 	    });
	 			 
			}
			else if(curObj.type=="polar"){//雷达图
				$(curObj.target).highcharts({
			        chart: {
			        	polar:true,
			            type: "line",
			            backgroundColor:"none"
			        },
			        title: {
			            text: (curObj.showTitle?curObj.tplName:"")
			        },
			        xAxis: {
			            categories: _categories
			        },
			        yAxis: {
			        	gridLineInterpolation: 'polygon',
				        lineWidth: 0,
				        min: 0
			        },
			        tooltip: {
			        	shared: false,
				        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y}</b><br>'
			        },
			        legend: {
				        align: 'right',
				        verticalAlign: 'top',
				        y: 70,
				        layout: 'vertical'
				    },
			        credits: {
			            enabled: false
			        },
			        plotOptions: {
			        	line: {
			        		cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                	click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            }
			        },
			        series: _series
			    });
			}else{//其他的图形不用进行数据格式转换
				$(curObj.target).highcharts({
			        chart: {
			            type: curObj.type,
			            backgroundColor:"none"
			        },
			        title: {
			            text: (curObj.showTitle?curObj.tplName:"")
			        },
			        xAxis: {
			            categories: _categories
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: '统计值'
			            }
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'right',
			            verticalAlign: 'middle',
			            borderWidth: 0
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:12px;font-weight:bold">{point.key}</span><table style="font-size:12px">',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y}</b></td></tr>',
			            footerFormat: '</table>',
			            shared: false,
			            useHTML: true
			        },
			        credits: {
			            enabled: false
			        },
			        plotOptions: {
			            column: {
			            	cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            },
			            bar: {
			            	cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            },
			            line: {
			            	cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            },
			            scatter: {
			            	cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            },
			            area: {
			            	cursor: 'pointer',
			                pointPadding: 0.2,
			                borderWidth: 0,
			                events: {
			                    click: function (event) {
			                    	curObj.clickEvent(this.name,event);
			                    }
			                }
			            }
			        },
			        series: _series
			    });
			}
		}
		
		this.clickEvent=function(name,event){
			
			var params = curObj.reportTemplate.ctParams;
			if(curObj.datas instanceof Array){//sql模式
				var data = null;
				if(curObj.reverse==0){//无反转
					data = curObj.extData[name+event.point.x];
				}else{//有反转
					data = curObj.extDataReverse[name+event.point.x];
				}
				if(curObj.type=="pie"){//如果是饼状图的话，则找出对应的系列数据
					data = curObj.pieExtData["百分比"+event.point.x];
				}
				for(var key in data){
					params = params.replace("{"+key+"}",encodeURI(data[key]));
				}
			}else{//设计模式
				
				var rowsData = curObj.rowsData[name];
				for(var key in rowsData){
					params = params.replace("{"+key+"}",encodeURI(rowsData[key]));
				}
				var colsData = curObj.colsData[name];
				for(var key in colsData){
					params = params.replace("{"+key+"}",encodeURI(colsData[key]));
				}
				
				var index = event.point.x;
				
				if(curObj.reverse==0){//无反转
					var rowsData = curObj.rowsData[curObj.colsHeader[index]];
					for(var key in rowsData){
						params = params.replace("{"+key+"}",encodeURI(rowsData[key]));
					}
					var colsData = curObj.colsData[curObj.colsHeader[index]];
					for(var key in colsData){
						params = params.replace("{"+key+"}",encodeURI(colsData[key]));
					}
				}else{//有反转
					var rowsData = curObj.rowsData[curObj.rowsHeader[index]];
					for(var key in rowsData){
						params = params.replace("{"+key+"}",encodeURI(rowsData[key]));
					}
					var colsData = curObj.colsData[curObj.rowsHeader[index]];
					for(var key in colsData){
						params = params.replace("{"+key+"}",encodeURI(colsData[key]));
					}
				}
				
			}
			
			switch(curObj.reportTemplate.ctType){
        	case 0:
        		//无穿透
        		break;
        	case 1://视图穿透类型
        		openFullWindow(contextPath+"/system/subsys/report/report_data_list.jsp?dfid="+curObj.reportTemplate.ctView+"&"+params);
        		break;
        	case 2://报表穿透类型
        		
        		break;
        	default:
        		break;
        	}
		}
	}
})();