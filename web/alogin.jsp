<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.HttpSessionEvent" %>

  <%
    String v1=request.getParameter("aname");
    String v2=request.getParameter("password");
    String flag="";
    
    //check if already login
	  String admin ="" ;
          Cookie ct[] = request.getCookies();
	  HttpSession sessionc = request.getSession(true);
          admin = (String) sessionc.getAttribute("aname");
          if ("devraj".equals(admin)) {
                response.sendRedirect("ahome.jsp");
          }

	  
    if(v1 == null || v2 == null){}
       else{
					   
      
        try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/jspdb","root","");
                Statement st=cn.createStatement();
                ResultSet rs = st.executeQuery("select * from admin where aname = '"+v1+"' and password = '"+v2+"'");
            
                while(rs.next()){
                
                    Cookie c = new Cookie("aname",v1);
                    c.setMaxAge(3600);
                    response.addCookie(c);
                    flag = "Login Successfull";
                    
                  
                    HttpSession session1 = request.getSession(true);
                    session1.setAttribute("aname",v1);
                    session1.setAttribute("pass",v2);
                    session1.setMaxInactiveInterval(1000);
                    // out.println(session1.getAttribute("aname"));
                    //  out.println(session.getAttribute("pass"));

                   response.sendRedirect("ahome.jsp");
                
                                                                                
                }                                                       
                    cn.close();
           }
    
        catch(ClassNotFoundException e){
              System.out.println("class error");
			}
        catch(SQLException e){
                    System.out.println(e.getMessage());
            }
        flag = "UserName or Password Wrong";
   }
                
                
%>
                   
    

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/ico" href="images/admin.ico" />	
		<title>Admin Login</title>		
		<link href="css/styles.css" type="text/css" media="screen" rel="stylesheet" />		
                <style type="text/css">
		img, div { behavior: url(iepngfix.htc) }
		</style>
                
	</head>
	<body id="login">
            
           
               
     

		<div id="wrappertop"></div>
			<div id="wrapper">
					<div id="content">
                                 
						<div id="header">
                                                    <h1><a href=""><img src="images/admin.jpg" alt="Admin" width="70" height="50"></a></h1>
						</div>
						<div id="darkbanner" class="banner320">
							<h2>Admin Login</h2>
						</div>
						<div id="darkbannerwrap">
						</div>
						<form name="form1" method="post" action="alogin.jsp">
						<fieldset class="form">
                        	                                                                                       <p>
								<label for="user_name">Admin:</label>
								<input name="aname" id="user_name" type="text" value="" required/>
							</p>
							<p>
								<label for="user_password">Password:</label>
								<input name="password" id="user_password" type="password" required/>
							</p>
                                                        <p><font color="red"> <% out.println(flag); %></font></p>
							<button type="submit" class="positive" name="Submit">
								<img src="images/key.png" alt="Announcement"/>Login</button>
								
                            						</fieldset>
						
						
					</div>
				</div>
              


<div id="wrapperbottom_branding"><div id="wrapperbottom_branding_text">By <a href="#" style='text-decoration:none'>Devraj Jaiman. Project Manager </a></div></div>