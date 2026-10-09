<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page buffer="1100kb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Campus Talent Hunt</title>
  
<style type="text/css">
<%@ include file="assets/css/fontawesome.css"%>
<%@ include file="assets/css/templatemo-grad-school.css"%>
<%@ include file="assets/css/owl.css"%>
<%@ include file="assets/css/lightbox.css"%>
<%@ include file="vendor/bootstrap/css/bootstrap.min.css"%>
</style>
<%
if(session.getAttribute("officer") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
</head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
       <a href="#"><em>Campus </em>Talent <em> Hunt</em> </a>
    </div>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
       
		<li class="has-submenu"><a href="#">Job Account's</a>
          <ul class="sub-menu">
            <li><a href="newstdaccount.jsp">New Account Request</a></li>
            <li><a href="viewstdaccount.jsp">View Student Account's</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">IT Company's</a>
          <ul class="sub-menu">
            <li><a href="newcompany.jsp">New Company</a></li>
            <li><a href="viewcompany.jsp">View Company's</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">Study Material</a>
          <ul class="sub-menu">
            <li><a href="uploadnotes.jsp">Upload Job Note's</a></li>
            <li><a href="uploadvideo.jsp">Upload Training Video's</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">Interview & Report</a>
          <ul class="sub-menu">
            <li><a href="interviewschedule.jsp">Interview Schedule </a></li>
            <li><a href="interviewreport.jsp">Interview Report</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">My Account</a>
          <ul class="sub-menu">
		    <li><a href="officerhome.jsp">Home</a></li>
            <li><a href="ochangepassword.jsp">Change Password</a></li>
            <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </li>
		
         </ul>
    </nav>
  </header>
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
 </br>
	</table>
</td></tr></table>


  
  
	  </body>
</html>
