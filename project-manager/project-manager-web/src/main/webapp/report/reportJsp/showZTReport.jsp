
<%@ page contentType="text/html;charset=gbk" %>

<%@ page session="true" import="java.lang.StringBuffer"%>

<%
    request.setCharacterEncoding("utf-8");
	String reportId = request.getParameter("reportId");
	String reportFile = request.getParameter("reportFile");
	String paramFile = request.getParameter("paramFile");
	String reportTitle = request.getParameter("reportTitle");
	// 增加多语言处理 zhoukai 20160511
	String closeName = request.getParameter("closeName");
	if (reportTitle!=null) reportTitle = new String(reportTitle.getBytes("iso-8859-1"), "utf-8");
	if (closeName == null) {
		closeName = "close";
	}
	String userID = request.getParameter("userID");
	String deptID = request.getParameter("deptID");

%>

<html>
<head>
<title>report</title>
<LINK rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body oncontextmenu="window.event.returnValue=false">
<!--增加关闭按钮 zhoukai 20160511-->
<!--暂时去掉关闭按钮 zhoukai 20160511-->
<!--<div class="button_div"><input type="button" class="listbutton" onclick="window.close()" value="<%=closeName%>"/></div>-->
<table width=100% id="reportTable"><tr>
        <td >
	      
			
        </td>
       </tr>
       </table>
</body>
</html>
