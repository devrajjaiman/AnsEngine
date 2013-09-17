<%-- 
    Document   : mail.jsp
    Created on : 29 May, 2013, 5:02:00 PM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="sun.net.smtp.SmtpClient,java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String name= request.getParameter("");
	String client= request.getParameter("");
	String sub= request.getParameter("title");
	String msg= request.getParameter("your_message");
	String to= "devraj@gmail.com" ;
	//mail(to,sub,msg,client);
        String succ= "your mail has sent successfully";
        int i=1;
        response.sendRedirect("contact.jsp");
	%>
        <h1>Hello World!</h1>
    </body>
</html>
