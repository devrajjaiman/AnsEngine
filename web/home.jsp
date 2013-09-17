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

  <title>Categories</title>
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
           <table style=" margin-top: 40px;" class="tablebg" width="100%" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <th colspan="2"><font color="white">forum</font></th>
                        
                        <th width="50"><font color="white">posts</font></th>
                        <th width="100"><font color="white"> last post</font></th>
                         
                   </tr>

                     <%
               try{
                           // out.println("<h1>"+idc+"</h1>");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                 //     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                     //  Connection cn = DriverManager.getConnection("jdbc:odbc:db");
                        Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                        PreparedStatement counter = cn.prepareStatement("SELECT COUNT(id) FROM education where id = ?");
                         PreparedStatement post = cn.prepareStatement("Select * from education where id=?");
                        String sc=null;
                       int count=0;
                      
                        //ResultSet res = st.executeQuery("SELECT COUNT(id) FROM education where id = 1");
                    
                    
                       
                  %>
                    <tr><% int s=1;%>
                        <td class="row1" width="50" align="center"><img src="images/cc.jpg" width="50" height="70" alt="C Language" title="C Language" /></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s%>" >C Language</a>
	                             <p class="forumdesc">One of the most popular programming languages of all time. C has also greatly influenced many other popular programming languages.</p>
                        </td>
                       
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                <%       counter.setInt(1,1);
                       ResultSet r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                <%         
                                post.setInt(1,1);
                       ResultSet rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s1=2;%>
                         <td class="row1" width="50" align="center"><img src="images/c++.jpg" width="50" height="70" alt="C++ Language" title="C++ Language"/></td>
                         <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s1%>">C++ Language</a>
	                             <p class="forumdesc">An object-oriented programming (OOP) language that is viewed by many as the best language for creating large-scale applications. Also, one of my personal favorites.</p>
                         </td>
                        
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                <%            counter.setInt(1,2);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                   <%         
                                post.setInt(1,2);
                        rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s3=3;%>
                        <td class="row1" width="50" align="center"><img src="images/java.jpg" width="50" height="70" alt="java / Jsp" title="java / Jsp"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s3%>">java / Jsp</a>
	                             <p class="forumdesc">Developed by Sun, Java is widely used on the Web for both client and server processing. Java is also slang for "coffee".</p>
                        </td>
                        
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,3);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">   <%
                                post.setInt(1,3);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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


                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%></p></td>
                    </tr>
                    <tr><% int s4=4;%>
                        <td class="row1" width="50" align="center"><img src="images/html1.jpg" width="50" height="70" alt="HTML /CSS /Javascript / Webdevelopment" title="HTML /CSS /Javascript / Webdevelopment"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s4%>">HTML /CSS /Javascript / Webdevelopment</a>
	                             <p class="forumdesc">One of the most popular programming languages of all time. C has also greatly influenced many other popular programming languages.</p>
                        </td>
                       
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,4);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                   <%         
                                post.setInt(1,4);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s5=5;%>
                        <td class="row1" width="50" align="center"><img src="images/php4.jpg" width="50" height="70" alt="PHP" title="PHP"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s5%>">PHP</a>
	                             <p class="forumdesc">An open source, server-side, HTML embedded scripting language used to create dynamic Web pages. If you want to create sweet websites, you better learn this!</p>
                        </td>
                       
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,5);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">   <%
                                post.setInt(1,5);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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


                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%></p></td>
                    </tr>
                    <tr><% int s6=6;%>
                        <td class="row1" width="50" align="center"><img src="images/sql.jpg" width="50" height="70" alt="SQL & Database" title="SQL & Database"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s6%>">SQL & Database</a>
	                             <p class="forumdesc">Everything SQL and Databases related in here!</p>
                        </td>
                       
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,6);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                   <%         
                                post.setInt(1,6);
                      rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s7=7;%>
                        <td class="row1" width="50" align="center"><img src="images/.net.jpg" width="50" height="70" alt=".Net / C#" title=".Net / C#"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s7%>">.Net / C#</a>
                                        <p class="forumdesc">the .NET Framework provides a comprehensive and consistent programming model for building applications that have visually stunning user experiences and seamless and secure communication</p>
                        </td>
                        
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,7);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">   <%
                                post.setInt(1,7);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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


                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%></p></td>
                    </tr>
                    <tr><% int s8=8;%>
                        <td class="row1" width="50" align="center"><img src="images/all.jpg" width="50" height="70" alt="All Other Programming Languages" title="All Other Programming Languages"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s8%>">All Other Programming Languages</a>
	                             <p class="forumdesc">I think it's pretty obvious what this section is for</p>
                        </td>
                        
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,8);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                   <%         
                                post.setInt(1,8);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s9=9;%>
                        <td class="row1" width="50" align="center"><img src="images/adobe.jpg" width="50" height="70" alt="Adobe /Dreamweaver /Flash /Photoshop" title="Adobe /Dreamweaver /Flash /Photoshop"/></td>
                        <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s9%>">Adobe /Dreamweaver /Flash /Photoshop</a>
	                             <p class="forumdesc">Too lazy to code by hand? Then Dreamweaver is perfect for you!.When you want to make cartoons and annoying banner ads.How could we ever get a distorted image of celebrities without it?</p>
                        </td>
                        
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,9);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">   <%
                                post.setInt(1,9);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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


                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%></p></td>
                    </tr>
                    <tr><% int s10=10;%>
                         <td class="row1" width="50" align="center"><img src="images/animation.jpg" width="50" height="70" alt="Game Design / Animation" title="Game Design / Animation"/></td>
                         <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s10%>">Game Design / Animation</a>
	                             <p class="forumdesc">For all game design discussion including Unity and the Unreal Development Kit and animation related.</p>
                        </td>
                       
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%            counter.setInt(1,10);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                            </p></td>
                        <td  class="row2" width="50" align="center"><p class="topicdetails">
                                   <%         
                                post.setInt(1,10);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                            </p></td>
                    </tr>
                    <tr><% int s11=11;%>
                         <td class="row1" width="50" align="center"><img src="images/tutorial.jpg" width="50" height="70" alt="Tutorials / Projects" title="Tutorials / Projects"/></td>
                         <td class="row1" width="600"><a class="forumlink"  href="cc.jsp?idc=<%= s11%>">Tutorials / Projects</a>
	                             <p class="forumdesc">Tutorials made by forum users. Have something to teach? Post your tutorial here!This is where you may post your  Source projects.</p>
                         </td>
                        
                         <td  class="row2" width="50" align="center"><p class="topicdetails">
                                     <%            counter.setInt(1,11);
                        r1 = counter.executeQuery();
                       while (r1.next()){
                            count = r1.getInt(1);
                    out.println(count);
                        }%>
                             </p></td>
                         <td  class="row2" width="50" align="center"><p class="topicdetails">
                                    <%         
                                post.setInt(1,11);
                       rs = post.executeQuery();
                            rs.afterLast();
                       while(rs.previous())
                           {  String un=rs.getString(1);
                              //String qus=rs.getString(2);
                                   //  String des= rs.getString(3);
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

                
                 out.println(" "+time+"  "+unit+" ago  "); out.println("</br>"+"posted");  out.println("by");
                 out.print(un);
                 break;
                               }%>
                             </p></td>
                    </tr>
                    <%      cn.close();
			}
			 catch(Exception e)
                   {
                           out.println(e.getMessage());
                    }

                %>




           </tbody>
   </table>

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

