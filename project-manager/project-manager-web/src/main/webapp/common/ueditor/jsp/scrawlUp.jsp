    <%@ page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"%>
        <%@ page import="sun.misc.BASE64Decoder" %>
        <%@ page import="java.io.BufferedReader"%>
    <%@ page import="java.io.IOException"%>
    <%@ page import="java.io.InputStream"%>
    <%@ page import="java.io.InputStreamReader"%>
    <%@ page import="java.io.OutputStream"%>
    <%@ page import="java.io.File"%>
    <%@ page import="java.io.FileOutputStream"%>
    <%@ page import="java.util.Date"%>

    <%
    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String param = request.getParameter("action");
    
    %>
