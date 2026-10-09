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
<script>
function validateForm()
{
if(document.frm.txtname.value=="")
    {
      alert("Enter IT Company Name");
      document.frm.txtname.focus();
      return false;
    }
	
	if(document.frm.txtemail.value=="")
    {
      alert("Enter Email -Id");
      document.frm.txtemail.focus();
      return false;
    }
	var x=document.forms["frm"]["txtemail"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Invalid Email-Id");
  return false;
  }
	
	 if(document.frm.txtpass.value=="")
    {
      alert("Create Password");
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
 <table width="460" align="center" border="0">
	 <form name="frm" method="post" action="" onSubmit="return validateForm()">
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>New IT Company</b></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td class="font_normal">Enter Company Name :</td>
	  <td>
	 
	  <input type="text" name="txtname" size="30"></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td class="font_normal">Email-Id :</td>
	  <td>
	 
	  <input type="text" name="txtemail" size="30"></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	
	  	  
	   <tr>
	  <td class="font_normal">Create Password :</td>
	  <td>
	 
	  <input type="password" name="txtpass" size="30"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	
	   <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Save" class="font_b"/>
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
String pass,email,nam;
int ext=0;

nam=request.getParameter("txtname");
email=request.getParameter("txtemail");
pass=request.getParameter("txtpass");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from company where cname='"+nam+"' or  cemail='"+email+"'");
while(rs.next())
{
ext=1;
}
if(ext==1)
{
out.println("<script language='javascript'> alert('Name / Email-Id are Already there.'); </script>");

}
else
{
smt.executeUpdate("insert into company(cname,cemail,cpass)values('"+nam+"','"+email+"','"+pass+"')");
out.println("<script language='javascript'> alert('Company Added Successfully.'); </script>");
}
}
catch(Exception e)
{
out.println(e);
}
}
%>	

   
  
	  </body>
</html>