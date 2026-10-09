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
if(session.getAttribute("student") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
    if(document.frm.txtoldpass.value=="")
    {
      alert("Enter Old Password");
      document.frm.txtoldpass.focus();
      return false;
    }
	
    if(document.frm.txtnewpass.value=="")
    {
      alert("Enter New Password");
      document.frm.txtnewpass.focus();
      return false;
    }
	
		   
	 if(document.frm.txtrepass.value=="")
    {
      alert("Enter Confirm Password");
      document.frm.txtrepass.focus();
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
       
		<li class="has-submenu"><a href="#">My Details</a>
          <ul class="sub-menu">
            <li><a href="updatedetails.jsp">Update Details</a></li>
            <li><a href="uploadresume.jsp">Upload Resume</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">Study Material</a>
          <ul class="sub-menu">
            <li><a href="downloadnotes.jsp">Download Job Note's</a></li>
            <li><a href="downloadvideo.jsp">Download Training Video</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">Interview & Report</a>
          <ul class="sub-menu">
            <li><a href="studentinterviewschedule.jsp">Interview Schedule </a></li>
            <li><a href="studentinterviewreport.jsp">Interview Report</a></li>
            </ul>
        </li>
		<li class="has-submenu"><a href="#">My Account</a>
          <ul class="sub-menu">
		    <li><a href="studenthome.jsp">Home</a></li>
            <li><a href="schangepassword.jsp">Change Password</a></li>
            <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </li>
		
         </ul>
    </nav>
  </header>
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
<form name="frm" method="post" action="" onSubmit="return validateForm()">
	 <table width="360" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Change Password</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td>Old Password :</td>
	  <td>
	
	  <input type="password" name="txtoldpass" size="20" class="txt"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	   <tr>
	  <td>New Password :</td>
	  <td>
	  <input type="password" name="txtnewpass" size="20" class="txt"></td>
	  </tr>
	    <tr><td height="10"></td></tr>
	   <tr>
	  <td>Confirm Password :</td>
	  <td>
	
	  <input type="password" name="txtrepass" size="20" class="txt"></td>
	  </tr>
	  
	  
	
	  
	  <tr><td height="15"></td></tr>
	
	    <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Change" class="font_b"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	  </tr>

	 </table>
</form>	  <%
if(request.getMethod().equals("POST"))
{
String oldpass="",newpass="",repass="";
int ext=0,pgid1=0;
oldpass=request.getParameter("txtoldpass");
newpass=request.getParameter("txtnewpass");
repass=request.getParameter("txtrepass");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();
ResultSet rs=smt.executeQuery("select * from students where spass='"+oldpass+"' and susn='"+session.getAttribute("student")+"'");
while(rs.next())
{
ext=1;
}
if((ext==1) && (newpass.equals(repass)))
{
smt.executeUpdate("Update students set spass='"+newpass+"' where susn='"+session.getAttribute("student")+"'");
out.println("<script language='javascript'> alert('Password Updated Successfully.'); </script>");
}
else
{
out.println("<script language='javascript'> alert('Password Cannot be Changed.'); </script>");
}
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
	</table>
</td></tr></table>


  
	  </body>
</html>

