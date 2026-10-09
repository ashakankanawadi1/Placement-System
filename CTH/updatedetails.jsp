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
	
if(document.frm.txtmob.value=="")
    {
      alert("Enter Mobile No");
      document.frm.txtmob.focus();
      return false;
    }
	var mb1 = document.frm.txtmob.value;
	 if(isNaN(mb1)||mb1.indexOf(" ")!=-1)
           {
              alert("Enter Mobile No In Digits")
              return false;
           }
		   if (mb1.length<10)
           {
                alert("Enter Minimum 10 characters For Mobile No");;
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
<%
   String nam="";
  String email="";
  String usn="";
  String mob="";

  try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
  java.sql.Statement stmt=con.createStatement();
  ResultSet rs2=stmt.executeQuery("select * from students where susn='"+session.getAttribute("student")+"'");
  while(rs2.next())
  {
		 nam= rs2.getString("sname");
		 email= rs2.getString("semail");
			 usn= rs2.getString("susn");
			 mob= rs2.getString("smobile");
  }
  con.close();
  }
  catch(Exception e)
  {
  out.println(e);
  }
  %>
	
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
 <table width="420" align="center" border="0">
	 <form name="frm" method="post" action="" onSubmit="return validateForm()">
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Update Details</b></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td class="font_normal">Enter Name :</td>
	  <td>
	 
	  <input type="text" name="txtname" value="<%=nam%>" disabled size="30"></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td class="font_normal">Email-Id :</td>
	  <td>
	 
	  <input type="text" name="txtemail" value="<%=email%>"  size="30"></td>
	  </tr>
	  <tr><td height="15"></td></tr>
	
	  <tr>
	  <td class="font_normal">Enter USN :</td>
	  <td>
	 
	  <input type="text" name="txtusn" disabled value="<%=usn%>" size="30"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	   <tr>
	  <td class="font_normal">Enter Mobile No :</td>
	  <td>
	 
	  <input type="text" name="txtmob" maxlength="10" size="30" value="<%=mob%>"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	
	   <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Update" class="font_b"/>
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
String em,mb;
int ext=0;

em=request.getParameter("txtemail");
mb=request.getParameter("txtmob");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("update students set semail='"+em+"',smobile='"+mb+"' where susn='"+session.getAttribute("student")+"'");
out.println("<script language='javascript'> alert('Details Updated Successfully.'); </script>");
 con.close();
}
catch(Exception e)
{
out.println(e);
}
}
%>	

   
	  </body>
</html>
