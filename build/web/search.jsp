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

  <title>Education_forum</title>
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
          <h1><a href="home.jsp">Education</a></h1>
          <h2>Forum</h2>
          <%=new java.util.Date() %>.
              <div id="cA">
<h3</h3>
<form action="search.jsp" method="post">
                            <div id="search">
                                <input type="text" size="30" class="search" name="search"  value="Search" />
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

                <li><a href="#">Edit</a></li>
                <li><a href='logout.jsp'>Log Out</a></li>

              </ul>
            </li>
            <li><a href="contact.jsp">Contact Us</a></li>


          </ul>
        </div>

  </div>
    <div id="site_content">


        <div class="content">
            <h1 style="margin: 35px 0 0 0;">Threads</h1>
            <h1 style="margin: -70px 0 0 350px;"><a href="newjsp2.jsp">Add New Threads</a></h1>

            <table style="background-color: red" width="1000" align="center" border="0" cellpadding="0" cellspacing="0" >

            <tr  bgcolor="red">
                <td width="300" height="50"><font color="#800080">Auther</font></td>
                <td width="300"><font color="#800080">Title</font></td>
                <td width="400"><font color="#800080">Description</font></td>
                <td width="100"><font color="#800080">Time</font></td>
            </tr>

            <% try{   String sr=request.getParameter("search");
                       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


                       ResultSet rs = st.executeQuery("Select * from student where qust LIKE '%"+sr+"%' OR qust LIKE '%"+sr+"'OR qust LIKE '"+sr+"%'");
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


                                      %><tr>
                                          <td height="50"><%= un %></td>
                                          <td><a href="cshow.jsp?id=<%= no%>"><%= qus %></a></td>
                                      <td><%=des %></td>
                                      <td valign="top"><%
			   if(user.equals(un))
			   {
			      String link2 = "delete.jsp?id="+id ;
				 %>
                                 <a href=<%= link2 %> style="text-decoration:none">
			<img src="del.png" />
			</a>
			<%
			   }
			   %>




                                          <br><% out.println(" "+time+"  "+unit+" ago  ");%></td>
                                      </tr>
                                          <%   }



			cn.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }

%>




        </table>

        <p></p>







        <h1 style="margin: 15px 0 0 0;"></h1>


      </div>
    </div>
    <div id="scroll">
      <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
    </div>
      <div id="footer">
      <p>designed by @ Trilok Burdak</p>

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

