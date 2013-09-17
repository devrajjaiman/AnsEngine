<%--
    Document   : edit
    Created on : 29 May, 2013, 6:02:57 PM
    Author     : tc
--%>
<%@page import ="javax.servlet.http.HttpServletRequest" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.servlet.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%

            String user ="" ;
            Cookie ct[] = request.getCookies();
            HttpSession sess = request.getSession(true);
            user = (String) sess.getAttribute("user");
         if (user == null) {
            response.sendRedirect("index.jsp");
            }
         if(ct == null || sess.isNew())
	    {
            response.sendRedirect("index.jsp");
            }

	  else
	     {
		    for(int i=0;i<ct.length;i++)
			{
			   if(ct[i].getName().equals("user"))
			   {

				  user = ct[i].getValue();
				  break;
			   }
			}
		 }
%>

<html>

<head>
  <title>Education_forum</title>
</head>

<body>



             <%
               String s = request.getParameter("F_name");
	       String s1 = request.getParameter("L_name");
               String s2 = request.getParameter("N_name");
               String uname = request.getParameter("U_name");
               String s3 = request.getParameter("Email");
               String pass = request.getParameter("Password");
               String s4 = request.getParameter("C_password");
		String ss ="";

		 try{
                       //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		     // ResultSet rs = st.executeQuery("Select * from register");

			 //st.executeUpdate("UPDATE register SET('"+s+"','"+s1+"','"+s2+"','"+uname+"','"+s3+"','"+pass+"','"+s4+"')");
                          st.executeUpdate("UPDATE register SET F_name='"+s+"',L_name='"+s1+"',N_name='"+s2+"',Email='"+s3+"',Passwaord='"+pass+"',C_Password='"+s4+"' WHERE U_name='"+user+"'" );
                            // ResultSet rs = st.executeQuery("Select * from register where U_Name='"+uname+"'AND Password='"+pass+"'");

		         ss = "Your profile edited successfully";
                         response.sendRedirect("home.jsp");
			cn.close();

			}
			 catch(Exception e)
                         {
                           out.println(e.getMessage()+"a");
                        }
	         %>



</body>
</html>


