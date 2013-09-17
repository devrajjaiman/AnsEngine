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
	   HttpSession sess = request.getSession(false);
	   String uname = ""+sess.getAttribute("user");

	     Cookie c = new Cookie("uname",uname);
		 c.setMaxAge(0);
		 response.addCookie(c);
		 sess.removeAttribute("user");
                  sess.removeAttribute(c.getValue());
		 sess.removeAttribute("pass");
		 sess.invalidate();
		 response.sendRedirect("index.jsp");
                 %>
    </body>
</html>
