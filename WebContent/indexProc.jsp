<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.StringTokenizer, java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="Reader.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
		String fileName = request.getParameter("MENU_NAME");
		System.out.println("오잉? :" +fileName);
		if(fileName==null)	
			fileName = "menu_00";
		
		MenuReader menuReader = new MenuReader(fileName, application.getRealPath("./data/products/"+fileName+".txt"));
	%>

<link rel="stylesheet" type="text/css" href="include/css/index.css">

<jsp:include page="/include/html/menu.jsp" flush="false" />
<section id="sc_items">
	<%= menuReader.createItemList() %>
</section>

