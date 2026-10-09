<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,javazoom.upload.*,java.util.*, java.io.*" errorPage="" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@page import="java.util.*,java.io.InputStream,java.net.URL,java.io.DataInputStream,java.io.BufferedInputStream" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ page buffer="1112kb" %>
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
if(session.getAttribute("company") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
    if(document.frm.txtdesc.value=="")
    {
      alert("Enter Assesment Details");
      document.frm.txtdesc.focus();
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
         <li><a href="#"><font color="#FF0000"><%=session.getAttribute("cname")%></font></a></li>
		<li><a href="addjobdetails.jsp">Add Job Details</a></li>
		
		     <li><a href="companyinterviewreport.jsp">Interview Report</a></li>
			 
		<li class="has-submenu"><a href="#">My Account</a>
          <ul class="sub-menu">
		    <li><a href="companyhome.jsp">Home</a></li>
            <li><a href="cchangepassword.jsp">Change Password</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </li>
		
    </ul>
    </nav>
  </header>
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
 <form name="frm" method="post"  action="" onSubmit="return validateForm()">
		 <table width="800" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Assign Assesment Test</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	   <tr>
	  <td>Enter Details :</td>
	  <td>
	  <textarea name="txtdesc" rows="10" cols="80"></textarea></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	 
	
	    <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Assign" class="font_b"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	  </tr>

	 </table>
</form>	   <%
if(request.getMethod().equals("POST"))
{
String det="";
int ext=0;
det=request.getParameter("txtdesc");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();

//smt.executeUpdate("insert into assessmenttest(taid,ttest)values("+request.getParameter("id")+",'"+det+"')");

smt.executeUpdate("update jobapplications set around='Assesment',atest='"+det+"',aresult='Waiting' where aid="+request.getParameter("id")+"");
out.println("<script language='javascript'> alert('Assesment Assigned Successfully.'); </script>");
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

