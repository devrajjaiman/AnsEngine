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
  <title>Edit Details</title>
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
        <!--<div id="cA">

     <form action="search.jsp" method="post">
            <div id="search">
                  <input type="text" size="30" class="search" name="search"  value="Search" />
                  <input  type="submit" class="submit" value="Go" />
            </div><!-- search -->
    <!--   </form>

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

  
           <script type="text/javascript">

           function check()
	   {
		var v =  document.forms["myform"]["F_name"].value;

		 if(v==null||v == "")
		 	 {    alert("Please Enter First Name");
			      return false;

			 }

                var v1 =  document.forms["myform"]["L_name"].value;
		  if (v1==null||v1 == "")
		 	 {  alert("Please Enter Last name ");
                             return false;
                         }

                 var v11 =  document.forms["myform"]["N_name"].value;
		  if (v11==null||v11 == "")
		 	 {   alert("Please Enter Nick name ");
                             return false;
                         }

                 var v12 =  document.forms["myform"]["U_name"].value;
		  if (v12==null||v12 == "")
		 	 {   alert("Please Enter User name ");
                             return false;
                         }
                var v3 =  document.forms["myform"]["Password"].value;
		 if(v3==null||v3 == "")
		 	 {   alert("Please Enter New Password ");
                             return false;
                         }


		var v4 =  document.forms["myform"]["C_password"].value;
		 if(v4==null||v4 == "")
		 	 {   alert("Please Enter Confirm Password");
                             return false;
                         }
                  if(v3 != v4)
				{	alert("Both Password Shoud be Same");
                                    return false;
                                }

                var   v2 =  document.forms["myform"]["Email"].value;
		 if (v2==null||v2 == "")
                        {      alert("Please Enter Email Address ");
                            return false;
                        }


                   var atpos=document.forms["myform"]["Email"].value.indexOf("@");
                    var dotpos=document.forms["myform"]["Email"].value.lastIndexOf(".");
                          if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
                          {
                                 alert("Not a valid e-mail address");
                                 return false;
                            }
            else{
                return true;
                }

    }

  </script>
        
             <h1 style="margin: 60px 0 0 0;">Edit Profile</h1>



                 <%
                  try{
                       //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                       Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                       Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		     ResultSet rs = st.executeQuery("Select * from register WHERE U_name = '"+user+"'" );
                     while(rs.next()){
                         %>

      <form name="myform" id="contact" action="update.jsp" method="post" onsubmit="return check()">
          <div class="form_settings">
              <p><span>First Name:</span><input class="contact" type="text" name="F_name" value="<%= rs.getString(1) %>"  /></p>
              <p><span>Last Name:</span><input class="contact" type="text" name="L_name" value="<%= rs.getString(2) %>" /></p>
              <p><span>Nick Name:</span><input class="contact" type="text" name="N_name"  value="<%= rs.getString(3) %>" /></p>
              <p><span>User Name:<font color="red">** unchangable</font></span><%= rs.getString(4) %><%out.println("");%></p>
              <p><span>Email:</span><input class="contact" type="text" name="Email" value="<%= rs.getString(5) %>" /></p>
              <p><span>New Password:</span><input class="contact" type="password" name="Password" value="<%= rs.getString(6) %>" /></p>
              <p><span>Confirm Password:</span><input class="contact" type="password" name="C_password" value="<%= rs.getString(7) %>" /></p>
              <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Submit" /></p>
          </div>
       </form>
                      <% }

                      cn.close();

			}
			 catch(Exception e)
                         {
                           out.println(e.getMessage()+"a");
                        }
	         %>
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

