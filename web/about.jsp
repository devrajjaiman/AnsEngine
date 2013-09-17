<%--
    Document   : newjsp
    Created on : 29 Aug, 2012, 11:10:25 PM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE HTML>
<%   String user ="" ;
      HttpSession sess = request.getSession(true);
           user = (String) sess.getAttribute("user");
   if (user == null) {
        response.sendRedirect("index.jsp");
   }%>
<html>

<head>  <%@ page import="java.sql.*" %>
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

  <title>About Team AnsEngine</title>
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
          <h1><a href="home.html">AnsEngine</a></h1>
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
            <h3 style="margin: 35px 0 0 0;">Hi friends</h3>
            <h4 style="margin: 35px 0 0 100px;">Thanks for visiting  Education Forum</h4>
          
            <h2>Trilok Burdak</h2>
             <p>    Enthusiastic, Dynamic, Positive, Independent,</p>
            <p>    Decision Maker, Effective, Strong Willed.</p>
            <p>    Addicted to Coding, Adventures & Movies.</p>


            <br>
          <h2 >Devraj Jaiman</h2>
            <p>    Enthusiastic, Dynamic, Positive, Independent,</p>
            <p>    Decision Maker, Effective, Strong Willed.</p>
            <p>    Addicted to Coding, Adventures & Movies.</p>
            <br>
            <h2 >Afajal Ali</h2>
            <p>    Enthusiastic, Dynamic, Positive, Independent,</p>
            <p>    Decision Maker, Effective, Strong Willed.</p>
            <p>    Addicted to Coding, Adventures & Movies.</p>







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

