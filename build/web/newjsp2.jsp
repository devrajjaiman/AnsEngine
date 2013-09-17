<%-- 
    Document   : newjsp2
    Created on : 30 Aug, 2012, 12:18:00 AM
    Author     : tc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Thread</title>
        <link rel="stylesheet" type="text/css" id="theme" href="css/style.css" />
        <script type="text/javascript">
            function check(){
                var v =  document.forms["ff"]["title"].value;

		 if(v==null||v == "")
		 	 { alert("Please Enter title");
			 return false;

			 }




		  var v1 =  document.forms["ff"]["your_message"].value;
		  if (v1==null||v1 == "")
		 	 { alert("Please Enter description ");  return false; }
                else{return true;}
            }
        </script>

    </head>
    <body>
        <h1>Add a new Thread / Problem</h1><br> <% int idc=Integer.parseInt(request.getParameter("idc"));%>
        <form name="ff" id="contact" action="newjsp1.jsp?idc=<%= idc%>" method="post" onsubmit="return check()">
          <div class="form_settings">
            <p><span>Question</span><textarea   class="contact textarea" rows="2" cols="20" name="title"  ></textarea></p>
            
            <p><span>Description</span><textarea class="contact textarea" rows="5" cols="50" name="your_message"></textarea></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Submit" /></p>
          </div>
        </form>

    </body>
</html>
