<%-- 
    Document   : logout
    Created on : 4 Sep, 2012, 12:52:50 AM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
	   HttpSession session1 = request.getSession(false);
	   String uname = ""+session1.getAttribute("aname");

	     Cookie c = new Cookie("aname",uname);
		 c.setMaxAge(0);
		 response.addCookie(c);
		 session1.removeAttribute("user");
                  session1.removeAttribute(c.getValue());
		 session1.removeAttribute("pass");
		 session1.invalidate();
		 response.sendRedirect("alogin.jsp");
                 %>
    </body>
</html>
