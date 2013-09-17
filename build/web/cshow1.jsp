<%--
    Document   : index
    Created on : Mar 29, 2012, 10:15:01 PM
    Author     : Tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
      int flag = 0;
	  String user ="" ;
      Cookie ct[] = request.getCookies();
	  HttpSession sess = request.getSession(true);
           user = (String) sess.getAttribute("user");
   if (user == null) {
        response.sendRedirect("index.jsp");
   }
            if(ct == null || sess.isNew())
	  { flag = 0;
            response.sendRedirect("index.jsp");
          }

	  else
	     {
		    for(int i=0;i<ct.length;i++)
			{
			   if(ct[i].getName().equals("user"))
			   {
			      flag = 1;
				  user = ct[i].getValue();
				  break;
			   }
			}
		 }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		  <title>Login</title>
        <%@ page import="java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
 
	</head>
    <body>

	  <%
         try{
             //int s=Integer.parseInt(request.getParameter("id"));
               //  HttpSession sess1=request.getSession(true);
               // String s1= (String)request.getSession().getAttribute("user") ;
             long  s3 = System.currentTimeMillis();
              String s2 = request.getParameter("reply");
            int s = Integer.parseInt(request.getParameter("qid"));
              int idc = Integer.parseInt(request.getParameter("idc"));
              String s1 = request.getParameter("uname");

//out.println(s);
//out.println(s1);
//out.println(s2);
//out.println(s3);

            
              Class.forName("com.mysql.jdbc.Driver");
               Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                      // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       //Connection cn1 = DriverManager.getConnection("jdbc:odbc:db");
                       Statement st1 = cn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


                          ResultSet rs1 = st1.executeQuery("Select * from commant");
                       int no1;
                      if (rs1.last())
                          { no1 = rs1.getInt(1);
                          no1++;
                       }
                       else { no1 = 1 ; }
                          
                          String sss = "insert into commant values("+no1+",'"+s1+"','"+s2+"','"+s3+"',"+s+")";
                       System.out.println(sss);
                       st1.execute(sss);

                       response.sendRedirect("cshow.jsp?qid="+s+"&idc="+idc);
			cn1.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }

%>
       
    </body>
</html>
