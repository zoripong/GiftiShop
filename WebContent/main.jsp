<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.StringTokenizer, java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="Reader.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
		String fileName = request.getParameter("MENU_NAME");
		MenuReader menuReader = new MenuReader(application.getRealPath("./data/products/"+fileName+".txt"));
		
	%>
	<jsp:include page="/include/html/menu.jsp" flush="false" />
	<section id="sc_items">
		<%= menuReader.createItemList() %>
</section>

