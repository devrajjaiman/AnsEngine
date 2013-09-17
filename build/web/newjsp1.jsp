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
        <%@ page import="java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
       
	</head>
    <body>

	<%   //java.util.Date now= new java.util.Date();
        //String DATE_FORMAT = "yyyy-MM-dd";

        
       // SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
       // String s3 = sdf.format(now) ;

        int idc=Integer.parseInt(request.getParameter("idc"));
          HttpSession sess1=request.getSession(true);
          String s= (String)request.getSession().getAttribute("user") ;
	    long  s3 = System.currentTimeMillis();
	    String s1 = request.getParameter("title");
            String s2 = request.getParameter("your_message");
           // int count=0;
             String sss="";
              int no;
		 try{

                      Class.forName("com.mysql.jdbc.Driver");
               Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                       //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       //Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                       String add="";
                            if(idc==1){add="C Language";}
                            if(idc==2){add="C++ language";}
                            if(idc==3){add="java";}
                            if(idc==4){add="html";}
                             if(idc==5){add=" php";}
                             if(idc==6){add=" sql";}
                             if(idc==7){add=" net";}
                             if(idc==8){add=" allother";}
                             if(idc==9){add=" adobe";}
                             if(idc==10){add=" game";}
                             if(idc==11){add=" project";}
 //out.println(s);
// out.println(s1);
// out.println(s2);
 //out.println(s3);
 //out.println("2");
 //out.println(add);
                       ResultSet rset = st.executeQuery("select *from education");
                          Boolean bool = rset.last();
                        
                        
                          no = rset.getInt("qid");
                          no++;
              
                    sss="insert into  education values('"+s+"','"+s1+"','"+s2+"',"+idc+",'"+s3+"' ,'"+add+"',"+no+ ")";
                            //if(idc==1){ sss="insert into  clanguage values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            //if(idc==2){ sss="insert into  cclanguage values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            //if(idc==3){ sss="insert into  java values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            //if(idc==4){ sss="insert into  html values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            // if(idc==5){ sss="insert into  php values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                             //if(idc==6){ sss="insert into  sql values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                             //if(idc==7){ sss="insert into  net values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                             //if(idc==8){ sss="insert into  allother values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            // if(idc==9){ sss="insert into  adobe values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                            // if(idc==10){ sss="insert into  game values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}
                             //if(idc==11){ sss ="insert into  project values('"+s+"','"+s1+"','"+s2+"',"+no+",'"+s3+"')";}

                       st.execute(sss);
                        //String sss1=    "insert into like values("+no+","+count+")";
                       //st.execute(sss1);
                       
					

					response.sendRedirect("cc.jsp?idc="+idc);
			cn.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }
%>
    </body>
</html>
