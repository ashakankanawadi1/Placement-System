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
<table width="100%" height="600" border="0" align="center"><tr><td align="center">
	 <table width="800" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="5" align="center" class="font_head"><b>New Account Request</b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
			       <td width="220"><div align="center"> <font color="#FFFFFF">STUDENT NAME</font></div></td>
				  <td  width="120"><div align="center"> <font color="#FFFFFF">USN</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">EMAIL-ID</font></div></td>
				 <td  width="80"><div align="center"> <font color="#FFFFFF"> ACCEPT</font></div></td>
				 <td  width="80"><div align="center"> <font color="#FFFFFF"> REJECT</font></div></td>
                 </tr> 
       <%      
try
{								
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select * from students where status='Wait'");
while(rs2.next())
{
int id=rs2.getInt("sid");
		String nam= rs2.getString("sname");
		String email= rs2.getString("semail");
			String usn= rs2.getString("susn");
		

%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
                
      <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=usn%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=email%></div></td>
                 <td><div align="center"><a href="acceptaccount.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Accept this Student?');"><font color="#FF0000" size="4"><b>Accept ?</b></font></a></div>
             <td><div align="center"><a href="rejectaccount.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Reject this Student?');"><font color="#FF0000" size="4"><b>Reject ?</b></font></a></div>
             
                </tr>
                <%
  

}
con.close();
}
catch(Exception e)
{
out.println(e);

}
%>
	
	 </table>
	 
	 
	 
</td></tr></table>


  
  
	  </body>
</html>
