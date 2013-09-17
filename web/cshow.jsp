<%--
    Document   : newjsp
    Created on : 29 Aug, 2012, 11:10:25 PM
    Author     : tc
--%>

<%@page import ="javax.servlet.http.HttpServletRequest" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.servlet.*" %>
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

  <title>Problem Details</title>
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
</style>
   <script type="text/javascript">
     
            function check()
            {
                var v =  document.forms["ff"]["reply"].value;
                if(v==null||v == "")
		 	 { alert("Please Enter quote");
			   return false;
                         }
                 else{
                      return true;
                     }
            }
     </script>

</head>
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
           <%= new java.util.Date() %>.
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
           
            <h3>Threads </h3>
      
             <% int idc=Integer.parseInt(request.getParameter("idc"));%>
             <% int qid=Integer.parseInt(request.getParameter("qid"));%>

            <%
            try
            {


                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");

                    ///Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                      // Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                       
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                       ResultSet rs = st.executeQuery("Select * from education where qid="+qid);
                       Statement st1 = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                    //ResultSet rs1 = st1.executeQuery("Select * from like where id="+id);
                   
                       while(rs.next())
                           {  String un=rs.getString(1);
                              String qus=rs.getString(2);
                                     String des= rs.getString(3);
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

                                   //   while(rs1.next()){
                   // int like=Integer.parseInt(rs1.getString(2));
                     %>

       <table style="margin:10px 0 0 0;" class="tablebg" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                     <th colspan="2" height="20"><font color="white">forum</font></th>
                     <th width="50"><font color="white">Posted</font></th>
                </tr>
                <tr>
                      <td height="60" class="row1" width="50" align="center" valign="top"><font size="4" color="#ffffff"><%= un %></font></td>
                      <td  height="60" class="row1" width="600" align="center" valign="top"><font size="4" color="#000000"><%= qus %></font>
                      </td>
                      <td height="60"  class="row2" width="50" align="center"><%
			   if(user.equals(un))
			   {    String qrt= "frt";
			      String link2 = "delete.jsp?qid="+qid+"idc="+idc+"qst="+qrt ;
				 %>
                                    <a href=<%= link2 %> style="text-decoration:none">
                                      <img src="images/del.png" title="delete" alt="delete"/>
			            </a>
			     <%
			     }
			      %>
                           <p class="topicdetails"><% out.println(" "+time+"  "+unit+" ago  ");%></p>
                      </td>
                </tr>
                <tr>
                    <td height="150" class="row1" width="600" colspan="3" valign="top">
	                             <p class="forumdesc"><%=des %> </p>
                </tr>
                <tr>
                     <th colspan="2" height="20"><font color="white"></font></th>
                     <th width="50"><font color="white"></font></th>
                </tr>
        </tbody>
     </table>
                                          
                <%       }
                           cn.close();
			}
			 catch(Exception e)
                        {
                           out.println(e.getMessage());
                         }

                %>
     <table style="margin:20px 0 0 0;" class="tablebg" width="100%" cellpadding="0" cellspacing="0">
         <tbody>
            <tr>
                <th colspan="" height="25"><font color="white">Comments</font></th>
            </tr>
         </tbody>
     </table>

    <%
       try{
                       
               Class.forName("com.mysql.jdbc.Driver");
               Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");  
                    //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       //Connection cn = DriverManager.getConnection("jdbc:odbc:db");
               Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = st.executeQuery("Select * from commant where qid="+qid);


                       while(rs.next())
                           {
                                    int cid=Integer.parseInt(rs.getString(1));
                                    String un=rs.getString(2);
                                     String cm= rs.getString(3);
                                      String dat=rs.getString(4);
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

                                      %>
        <table style="margin:20px 0 0 0;" class="tablebg" width="100%" cellpadding="0" cellspacing="0">
              <tbody>
                <tr>
                    <th colspan="2" height="20"><font color="white">forum</font></th>
                    <th width="50"><font color="white">Posted</font></th>
                </tr>
                <tr>
                    <td height="30" class="row1" width="50" align="center" valign="top"><font size="4" color="#ffffff"><%= un %></font></td>
                    <td  height="30" class="row1" width="600" align="center" valign="top">
                    </td>
                    <td height="30"  class="row2" width="50" align="center">
			         <%   if(user.equals(un))
			   {             String qst="frttrf";
                                         String link2 = "delete.jsp?qid="+qid+"&idc="+idc+"&cid="+cid+"&qst="+qst  ;
				 %>
                                    <a href=<%= link2 %> style="text-decoration:none">
                                     <img src="images/del.png" title="delete" alt="delete" />
                                    </a>
                            <%
			   }
			   %>
                           <p class="topicdetails"><% out.println(" "+time+"  "+unit+" ago  ");%></p>
                    </td>
                </tr>
                <tr>
                     <td height="150" class="row1" width="600" colspan="3" valign="top">
                            <p class="forumdesc"><%=cm %> </p>
                     </td>
                </tr>
      </tbody>
   </table>
                                    
    
                          <%         }
                                          	cn.close();
			             }
			             catch(Exception e)
                                          {
                                                 out.println(e.getMessage());
                                            }

                            %>

     <form name="ff" id="contact" action="cshow1.jsp" method="post" onSubmit=" return check()" >
                 <div class="form_settings">
                          <input type="hidden" name="uname" value="<%= user %>" />
                          <input type="hidden" name="qid" value="<%= qid %>" />
                          <input type="hidden" name="idc" value="<%= idc %>" />
                          <p><span><font color="#ff00ff" size="4">Reply With Quote</font></span><textarea  class="contact textarea" rows="5" cols="50" name="reply" ></textarea></p>
                          <p style="padding-top: 15px"><span>&nbsp;</span><input  class="submit" type="submit" name="contact_submitted" value="Reply" /></p>
                </div>
    </form>


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

