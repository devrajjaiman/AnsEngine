<%-- 
    Document   : newjsp
    Created on : 29 Aug, 2012, 11:10:25 PM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE HTML>
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
          <h1><a href="index.html">Education</a></h1>
          <h2>Forum</h2>
        </div>
      </div>
      
        <div id="menu_container">
          <ul class="sf-menu" id="nav">
            <li><a href="index.html">Home</a></li>
            <li><a href="examples.html">Log in/Sign up </a></li>
            <li><a href="page.html">A Page</a></li>
            <li><a href="another_page.html">Another Page</a></li>
            <li><a href="#">Example Drop Down</a>
              <ul> 
                <li><a href="#">Drop Down One</a></li>
                <li><a href="#">Drop Down Two</a>
                  <ul>
                    <li><a href="#">Sub Drop Down One</a></li>
                    <li><a href="#">Sub Drop Down Two</a></li>
                    <li><a href="#">Sub Drop Down Three</a></li>
                    <li><a href="#">Sub Drop Down Four</a></li>
                    <li><a href="#">Sub Drop Down Five</a></li>
                  </ul>
                </li>
                <li><a href="#">Drop Down Three</a></li>
                <li><a href="#">Drop Down Four</a></li>
                <li><a href="#">Drop Down Five</a></li>
              </ul>
            </li>
            <li><a href="contact.html">Contact Us</a></li>
          </ul>
        </div>
  
  </div>
    <div id="site_content">
      <div id="sidebar_container">
       
        <div class="sidebar">
          <h3>Latest News</h3>
          <h4>New Website Launched</h4>
          <h5>January 1st, 2012</h5>
          <p>2012 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="#">Read more</a></p>
        </div>
      
        <div class="sidebar">
          <h3>Useful Links</h3>
          <ul>
             
            <li><a href="#">First Link</a></li>
            <li><a href="#">Another Link</a></li>
            <li><a href="#">And Another</a></li>
            <li><a href="#">Last One</a></li>
          </ul>
        </div>
       
        <div class="sidebar">
          <h3>More Useful Links</h3>
          <ul>
            <li><a href="#">First Link</a></li>
            <li><a href="#">Another Link</a></li>
            <li><a href="#">And Another</a></li>
            <li><a href="#">Last One</a></li>8
          </ul>
        </div>
      </div>
        <script type="text/javascript">

function check()
	{      
		var v =  document.forms["myform"]["F_name"].value;
		
		 if(v==null||v == "")
		 	 { alert("Please Enter First Name");
			 return false;

			 }
                    
			


		  var v1 =  document.forms["myform"]["L_name"].value;
		  if (v1==null||v1 == "")
		 	 { alert("Please Enter Last name ");  return false; }
			
			var v3 =  document.forms["myform"]["Password"].value;
		 if(v3==null||v3 == "")
		 	 { alert("Please Enter New Password ");
                             return false;}
			

		var v4 =  document.forms["myform"]["C_password"].value;
		 if(v4==null||v4 == "")
		 	 { alert("Please Enter Confirm Password");
                             return false;}
			

			if(v3 != v4)
				{	alert("Both Password Shoud be Same");  return false;}
			
                        var   v2 =  document.forms["myform"]["Email"].value;
		 if (v2==null||v2 == ""){ alert("Please Enter Email Address ");  return false; }
		 	

                            var atpos=document.forms["myform"]["Email"].value.indexOf("@");
                            var dotpos=document.forms["myform"]["Email"].value.lastIndexOf(".");
                            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                                 alert("Not a valid e-mail address");
                                 return false;
                            }
                      
                       

		
                               else{return true;}



		}

</script>
        <div class="content">
        <h1 style="margin: 35px 0 0 0;">Log In</h1>
           <%
        int flag=0;
        Cookie c[]=request.getCookies();
        Cookie ct=null;
        for(int i=0;i<c.length;i++)
            {
              if(c[i].getName().equals("user"))
                  {
                     ct=c[i];
                     flag=1;
                    break;
                   }
               }

           if(flag==1&&session.getAttribute(ct.getName())!=null)
           {
               response.sendRedirect("index.jsp");
             }
         %>

          <form name="myform1" id="contact" action="cookie.jsp" method="post" >
          <div class="form_settings">
                <span>Email:</span> <%if(flag==1)

                { out.println( "<b>"+ct.getValue()+"</b>");
                  }
             else if(flag==0)
                 {
                   %>
                   <p><input class="contact" type="text" name="Email" value="" /></p>
                   <%
                   }
        %>
            
            <p><span>Password:</span><input class="contact" type="password" name="Password" value="" /></p>


            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Login" /></p>
          </div>
        </form>
        <p align="center"><a href="#">Forgot your password ?</a></p>


<p ></p>




       
        <h1 style="margin: 15px 0 0 0;">Sign Up</h1>
      <form name="myform" id="contact" action="register.jsp" method="post" onsubmit="return check()">
          <div class="form_settings">
            <p><span>First Name:</span><input class="contact" type="text" name="F_name" value=""  /></p>
            <p><span>Last Name:</span><input class="contact" type="text" name="L_name" value="" /></p>
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
      <p><a href="index.html">Home</a> | <a href="examples.html">Examples</a> | <a href="page.html">A Page</a> | <a href="another_page.html">Another Page</a> | <a href="contact.html">Contact Us</a></p>
      <p>Copyright &copy; CSS3_two | <a href="http://www.css3templates.co.uk">design from css3templates.co.uk</a></p>
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

