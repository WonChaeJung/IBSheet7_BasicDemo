<%@page contentType="text/xml;charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%
	RequestDispatcherrd= request.getRequestDispatcher("/sheet/js/jsp/Down2Excel.jsp");
	rd.forward(request,response);
	out.flush();
	out = pageContext.pushBody();
%>