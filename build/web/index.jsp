<%-- 
    Document   : index
    Created on : May 30, 2013, 3:19:09 PM
    Author     : Sunny
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE HTML>
<%@page import ="java.sql.*;" %>
<%@ page import="java.util.Calendar"%>


<html>

<head>
  <title>Answer to all Technical Languages Problems</title>
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
          <h1><a href="index.jsp">AnsEngine</a></h1>
          <h2>Education Forum</h2>
          <h3 align="center"> Good
        <%
                Calendar calendar = Calendar.getInstance();
                if (calendar.get(Calendar.AM_PM) == Calendar.AM) {
                        out.print("Morning");
                     }
                else {
                        out.print("Afternoon");
                     }
        %>
          </h3>
   

         <%= new java.util.Date()%>
        
        </div>
      </div>

        <div id="menu_container">
                 <ul class="sf-menu" id="nav">
                  <h2 style="margin: 35px 0 0 -20px;">Welcome To Education Forum</h2>
                </ul>
        </div>
    </div>
        <div id="site_content">
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
        <div class="content">
             <h1 style="margin: 60px 0 0 0;">Log In</h1>
              <%
                   
                    String user ="" ;
                    Cookie ct[] = request.getCookies();
                    HttpSession sess = request.getSession(true);
                     user = (String) sess.getAttribute("uname");
                     if(ct == null || sess.isNew())
                     {
                         }
                   else
	              {
		        for(int i=0;i<ct.length;i++)
			  {
			    if(ct[i].getName().equals("uname"))
			      {    
                                  user = ct[i].getValue();
				  response.sendRedirect("home.jsp");
				  break;
			       }
			   }
                   
             
		       }


                String uname = request.getParameter("U_Name");
                String pass = request.getParameter("Password");
		String ss ="";
                
		 try{
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                      Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		      ResultSet rs = st.executeQuery("Select * from register");

			if(uname == null && pass == null)
			{  }
                        else
		       {
                            // ResultSet rs = st.executeQuery("Select * from register where U_Name='"+uname+"'AND Password='"+pass+"'");
                              while(rs.next())
					     {  
						   if(rs.getString(4).equals(uname) && rs.getString(6).equals(pass))
							{      Cookie c = new Cookie("uname",uname);
                                                                c.setMaxAge(3600);
								response.addCookie(c);

								HttpSession sess1 = request.getSession(true);
								sess1.setAttribute("user",uname);
								sess1.setAttribute("pass",pass);
								sess1.setMaxInactiveInterval(10000);
                                                                
								response.sendRedirect("home.jsp");
							
                                                            }
					       }

					 ss = "User Name or Password Wrong";
					 }
			cn.close();
                         
			}
			 catch(Exception e)
                         {
                           out.println(e.getMessage()+"a");
                        }
	         %>
       
    

          <form name="myform1" id="contact" action="index.jsp" method="post" onsubmit="return check1()">
          <div class="form_settings">
                 <span>User Name:</span>   <p><input class="contact" type="text" name="U_Name" value="" required=required /></p>
                 <p><span>Password:</span><input class="contact" type="password" name="Password" value="" required=required/></p>
                 <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Login" /></p>
           </div>
          </form>
             <p align="center"><a href="forget.jsp">Forgot your password ?</a></p>
           <p> <% out.println(ss); %></p>
        <p ></p>

   <h1 style="margin: 15px 0 0 0;">Sign Up</h1>
      <form name="myform" id="contact" action="register.jsp" method="post" onsubmit="return check()">
          <div class="form_settings">
             <p><span>First Name:</span><input class="contact" type="text" name="F_name" value=""  /></p>
              <p><span>Last Name:</span><input class="contact" type="text" name="L_name" value="" /></p>
              <p><span>Nick Name:</span><input class="contact" type="text" name="N_name" value="" /></p>
              <p><span>User Name:</span><input class="contact" type="text" name="U_name" value="" /></p>
              <p><span>Email:</span><input class="contact" type="text" name="Email" value="" /></p>
              <p><span>New Password:</span><input class="contact" type="password" name="Password" value="" /></p>
              <p><span>Confirm Password:</span><input class="contact" type="password" name="C_password" value="" /></p>
              <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Submit" /></p>
          </div>
       </form>
     </div>
    </div>
       <div id="scroll">
          <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
       </div>
      <div id="footer">
          <p align="center">developed by Team AnsEngine</p>
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

