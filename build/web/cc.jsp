<%--
    Document   : newjsp
    Created on : 29 Aug, 2012, 11:10:25 PM
    Author     : tc
--%>

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

  <title>Problems Listing</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta http-equiv="robots" content="noindex,nofollow" />
  <link rel="stylesheet" type="text/css" id="theme" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
 <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
<style type="text/css">
<!--
body,td,th {
	font-size: 0.8em;
}
body {
	background-image: url(images/pattern.jpg);
}
-->
</style></head>

<body> 
  <div id="main">
  <div id= "hh">
      <div id="logo">
        <div id="logo_text">

          <!-- class="logo_colour", allows you to change the colour of the text -->
           <% HttpSession sess3=request.getSession(true);%>
           <h3> <p align="right">Welcome   <%= sess3.getAttribute("user") %></p></h3>
          <h1><a href="home.jsp">AnsEngine</a></h1>
          <h2>Education Forum</h2>
          <%=new java.util.Date() %>.

   <div id="cA">
    <form action="search.jsp" method="post">
         <div id="search">
               <input type="text" size="30" class="search" name="search"  title="Search" />
                <input type="submit" class="submit" value="Go" />
         </div><!-- search -->
   </form>

 </div><!-- "cA" -->
        </div>
      </div>

        <div id="menu_container">
          <ul class="sf-menu" id="nav">
             <li><a href="home.jsp">Home</a></li>
             <li><a href="about.jsp" >About Us</a></li>
             <li><a href="#">Profile</a>
               <ul>
                  <li><a href="edit.jsp">Edit</a></li>
                  <li><a href='logout.jsp'>Log Out</a></li>
               </ul>
            </li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
        </div>

  </div>
    <div id="site_content">


        <div class="content">
             <% int idc=Integer.parseInt(request.getParameter("idc"));%>
            <h1 style="margin: 35px 0 0 0;"><I>Threads</I></h1>
            <h1 style="margin: -70px 0 0 350px;"><a href="newjsp2.jsp?idc=<%= idc%>"><I>Add New Threads</I></a></h1>
                 
               <%
               try{
                           // out.println("<h1>"+idc+"</h1>");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                 //     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                     //  Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                        Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                         PreparedStatement counter = cn.prepareStatement("SELECT COUNT(qid) FROM commant where qid = ?");
                        String sc=null;
                        int count=0;
                         sc="Select * from education where id='"+idc+"'";
                    
                         
                        ResultSet  rs = st.executeQuery(sc);
                        rs.afterLast();
                          while(rs.previous())
                            {
                                int no = rs.getInt(4);
                                String un=rs.getString(1);
                                String qus=rs.getString(2);
                                String des=rs.getString(3);
                                int id=Integer.parseInt(rs.getString(4));
                                String dat=rs.getString(5);
                                long time1 = Long.parseLong(dat);
                                int qid=Integer.parseInt(rs.getString(7));
                                long  time2 = System.currentTimeMillis();
                                long time = (time2-time1)/1000;
							   String unit = "seconds";
							   if(time > 60)
							     {
								     time = time / 60;
									 unit = "minutes";
									 if(time > 60)
							     {
								     time = time / 60;
									 unit = "hours";

									  if(time > 24)
							     {
								     time = time / 24;
									 unit = "days";
									  if(time > 7)
							     {
								     time = time / 7;
									 unit = "week";
								      if(time>30)
                                                                   {
                                                                      time=time /30;
                                                                      unit="month";
                                                                         if(time>365)
                                                                   {
                                                                      time=time /365;
                                                                      unit="year";


                                                                          }
								  }
								  }
								  }
                                                                  }
                                                                  }
                        %>

    <table style="margin:10px 0 0 0;" class="tablebg" width="100%" cellpadding="0" cellspacing="0">
        <tbody>
                <tr>
                    <th colspan="2" height="20" align="left"><font color="white" size="4" ><%= un %></font></th>
                    <th width="100"><font color="white">Posted</font></th>
                </tr>
                <tr>
                    <td colspan="2"  height="60" class="row1" width="600" align="left" ><a class="forumlink"  href="cshow.jsp?qid=<%= qid%>&idc=<%= idc %>"><%= qus %> </a>
	            </td>
                    <td height="60"  class="row2" width="50" align="center"><%
			   if(user.equals(un))
			   { //int qst= 258;
                               String qst= "frt";
			      String link2 = "delete.jsp?qid="+qid+"&idc="+idc+"&qst="+qst ;
				 %>
                                    <a href=<%= link2 %> style="text-decoration:none">
                                     <img src="images/del.png" title="delete" alt="delete"/>
			            </a>
			   <%
			   }
			   %>
                           <p class="topicdetails"><% out.println(" "+time+"  "+unit+" ago  ");%></p
                            ><p class="topicdetails">
                                             <%            counter.setInt(1,qid);
                     ResultSet   r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                if(count>0)   { out.print(count);out.println(""+"");out.print("comments"); }}%>
                            </p>
                    </td>
                </tr>
                <tr>
                    <td height="150" class="row1" width="600" colspan="3" valign="top">
	                          <p class="forumdesc"><%=des %> </p>
                </tr>
        </tbody>
    </table>

                <%   }
                        cn.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }

                %>


      

 <h1 style="margin: 15px 0 0 0;"></h1>


       </div>
    </div>
      <div id="scroll">
         <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
    </div>
      <div id="footer">
      <p>developed by Team AnsEngine</p>

    </div>
  </div>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
      $('.top').click(function() {$('html, body').animate({scrollTop:0}, 'fast'); return false;});
    });
  </script>
</body>
</html>

