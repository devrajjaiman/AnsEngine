<%--
    Document   : index
    Created on : Mar 29, 2012, 10:15:01 PM
    Author     : Tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		  <title>Login</title>
        <%@ page import="java.sql.*" %>

	</head>
        <body bgcolor="#c0c0c0">

	<%
	    String s = request.getParameter("F_name");
	    String s1 = request.getParameter("L_name");
             String s2 = request.getParameter("N_name");
              String uname = request.getParameter("U_name");
            String s3 = request.getParameter("Email");
            String pass = request.getParameter("Password");
            String s4 = request.getParameter("C_password");
              
		 try{
                       //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                       Statement st = cn.createStatement();
                     
 st.executeUpdate("insert into register values('"+s+"','"+s1+"','"+s2+"','"+uname+"','"+s3+"','"+pass+"','"+s4+"')");
                       ResultSet rset = st.executeQuery("Select * from register");

                       %> <b style="color:#800080; font-size:18px; font-family:Verdana, Arial, Helvetica, sans-serif">

                           Welcome <% out.println(uname); %> ! Registration Successfully .
                       </b><br>
                       <br>
                       <br>
       

       <a href="index.jsp">Click here to log in</a>


       <%       
			cn.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }

%>

    </body>
</html>
