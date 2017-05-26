<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tianee.oa.core.org.bean.TeePerson" %>

<%
	String runId = request.getParameter("runId");
	String frpSid = request.getParameter("frpSid");
	TeePerson loginUser = (TeePerson)session.getAttribute(TeeConst.LOGIN_USER);
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/upload.jsp" %>
<script type="text/javascript" src="<%=contextPath%>/common/js/tabs/tabs.js"></script>
<script type="text/javascript" charset="UTF-8">
	var runId = '<%=runId%>';
	var frpSid = '<%=frpSid%>';
	var userId = "<%=loginUser.getUuid()%>";
	function doInit(){
		
	}
</script>
 
</head>
<body onload="doInit()">
	<div id="innerTab" class="">
		<ul class="innerTabList" >
			<li class="innerTabItem active" src="form.jsp?runId=<%=runId%>&frpSid=<%=frpSid%>" ><span class="tabtext">发文头纸</span></li>
			<li class="innerTabItem" src="testAttachment.jsp?runId=<%=runId%>&frpSid=<%=frpSid%>" ><span class="tabtext">正文、附件</span></li>
			<li class="innerTabItem" src="handlePro.jsp?runId=<%=runId%>&frpSid=<%=frpSid%>" ><span class="tabtext">处理意见</span></li>
		</ul>
	</div>
	<div id="innerTabContent">
		<iframe id="iframe_tab" frameborder="0"></iframe>
	</div>
</body>
</html>