<%-- 
    Document   : delete
    Created on : 28 Sep, 2012, 12:33:39 AM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="javax.servlet.http.HttpServletRequest" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.servlet.*" %>
 <%@ page import="java.util.*" %>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     	<%
	 try{

		        int qid = Integer.parseInt(request.getParameter("qid"));
                        int idc = Integer.parseInt(request.getParameter("idc"));
                      //  int qrt = Integer.parseInt(request.getParameter("qst"));
                        String qrt= request.getParameter("qst");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                       // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       //Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                          //int qrt1=258;
                          String qrt1= "frt";
                          String qrt2= "frttrf";
		        if(qrt1.equals(qrt)) {
                            
                           boolean  rs = st.execute("delete from education where qid = "+qid);
                           boolean  rs1 = st.execute("delete from commant where qid = "+qid);

			   response.sendRedirect("cc.jsp?idc="+idc);
                        }

                        if(qrt2.equals(qrt))
                            {  int cid = Integer.parseInt(request.getParameter("cid"));
                                 boolean  rs = st.execute("delete from commant where cid = "+cid);

			   response.sendRedirect("cshow.jsp?idc="+idc+"&qid="+qid);
                             
                               }

			cn.close();
					}
					 catch(Exception e)
                     {
                           out.println(e.getMessage());
                      }
			%>
    </body>
</html>
