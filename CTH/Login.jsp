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
<script>
function validateForm()
{
 if(document.frm.txtuid.value=="")
    {
      alert("Enter User-Id");
      document.frm.txtuid.focus();
      return false;
    }
	 if(document.frm.txtpass.value=="")
    {
      alert("Enter Password");
      document.frm.txtpass.focus();
      return false;
    }
}
</script>
</head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
    <a href="#"><em>Campus </em>Talent <em> Hunt</em> </a>
    </div>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
        <li><a href="index.jsp">Home</a></li>
         <li><a href="newaccount.jsp">Create Account</a>
         <li><a href="Login.jsp">Login</a></li>
       </ul>
    </nav>
  </header>
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
 <table width="360" align="center" border="0">
	 <form name="frm" method="post" action="" onSubmit="return validateForm()">
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Login</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	  <tr>
	  <td class="font_normal">Select Type :</td>
	  <td>
	 
	  <select name="typ">
	  <option value="I">IT Company</option>
	   <option value="P">Placement Officer</option>
	    <option value="S">Student</option>
	  </select></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	  <tr>
	  <td class="font_normal">Enter User-Id :</td>
	  <td>
	 
	  <input type="text" name="txtuid" size="20"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	   <tr>
	  <td class="font_normal">Enter Password :</td>
	  <td>
	 
	  <input type="password" name="txtpass" size="20"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	
	   <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Login" class="font_b"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	  </tr>
	  
	   <tr><td height="5"></td></tr>
	      </form>
	</table>
</td></tr></table>

<%
if(request.getMethod().equals("POST"))
{
String uid,pass,typ="",nm="";
int ext=0,id=0;

uid=request.getParameter("txtuid");
pass=request.getParameter("txtpass");
typ=request.getParameter("typ");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();
if(typ.equals("P"))
{
ResultSet rs=smt.executeQuery("select * from officer where uid='"+uid+"' and pass='"+pass+"'");
while(rs.next())
{
ext=1;
}

if(ext==1)
{
 session.setAttribute("officer","officer");
	response.sendRedirect("officerhome.jsp");
}
else
{
out.println("<script language='javascript'> alert('Invalid User-Id OR Password.'); </script>");
}

}



if(typ.equals("S"))
{
ResultSet rs=smt.executeQuery("select * from students where susn='"+uid+"' and spass='"+pass+"' and status='Confirm'");
while(rs.next())
{
ext=1;
}

if(ext==1)
{
 session.setAttribute("student",uid);
	response.sendRedirect("studenthome.jsp");
}
else
{
out.println("<script language='javascript'> alert('Invalid User-Id OR Password.'); </script>");
}

}

if(typ.equals("I"))
{
ResultSet rs=smt.executeQuery("select * from company where cemail='"+uid+"' and cpass='"+pass+"'");
while(rs.next())
{
id=rs.getInt("cid");
nm=rs.getString("cname");
ext=1;
}

if(ext==1)
{
 session.setAttribute("company",""+id);
 session.setAttribute("cname",""+nm);
	response.sendRedirect("companyhome.jsp");
}
else
{
out.println("<script language='javascript'> alert('Invalid User-Id OR Password.'); </script>");
}

}



}
catch(Exception e)
{
out.println(e);
}
}
%>	

   <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
  
	  </body>
</html>
