<%--
    Document   : newjsp2
    Created on : 30 Aug, 2012, 12:18:00 AM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%   String user ="" ;
      HttpSession sess = request.getSession(true);
           user = (String) sess.getAttribute("user");
   if (user == null) {
        response.sendRedirect("index.jsp");
   }%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <link rel="stylesheet" type="text/css" id="theme" href="css/style.css" />
        <script type="text/javascript">
            function check(){
                var v =  document.forms["ff"]["title"].value;

		 if(v==null||v == "")
		 	 { alert("Please Enter Subject");
			 return false;

			 }




		  var v1 =  document.forms["ff"]["your_message"].value;
		  if (v1==null||v1 == "")
		 	 { alert("Please Enter Message ");  return false; }
                else{return true;}
            }
        </script>



       <%@ page import="java.sql.*" %>
        <%@ page import="javax.servlet.*" %>
         <%
      int flag = 0;
	 
      Cookie ct[] = request.getCookies();
	 
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
          <h1><a href="#">Education</a></h1>
          <h2>Forum</h2>
           <%= new java.util.Date() %>.
        </div>
      </div>

        <div id="menu_container">
          <ul class="sf-menu" id="nav">
            <li><a href="home11.jsp">Home</a></li>
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
    <body>
        <h2> Hi friends</h2>
        <%
       // String succ= " ";
        //succ= request.getParameter("succ");
        //int i= 0;
       //i = Integer.parseInt(request.getParameter("msg"));
       //if(succ.equals(" ")){
                 // out.println(succ);
                //}
          %>
        <form  name="ff" id="contact" action="mail.jsp" method="post" onsubmit="return check()">
            <div class="form_settings">
              <p><span>Subject</span><textarea  class="contact textarea" rows="2" cols="20" name="title"  ></textarea></p>

            <p><span>Message</span><textarea class="contact textarea" rows="5" cols="50" name="your_message"></textarea></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Submit" /></p>
          </div>
        </form>
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
