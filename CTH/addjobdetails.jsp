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
if(session.getAttribute("company") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
    if(document.frm.txtrole.value=="")
    {
      alert("Enter Job Role");
      document.frm.txtrole.focus();
      return false;
    }
	
    if(document.frm.txtdesc.value=="")
    {
      alert("Enter Job Requirment ");
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
<form name="frm" method="post" action="" onSubmit="return validateForm()">
	 <table width="800" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Add Job Details</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td>Enter Job Role :</td>
	  <td>
	
	 <textarea class="txt" rows="2" cols="80" name="txtrole"></textarea></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	   <tr>
	  <td valign="top">Enter Job Requirment :</td>
	  <td>
	
	 <textarea class="txt" rows="8" cols="80" name="txtdesc"></textarea></td>
	  </tr>
	  
	  
	
	  
	  <tr><td height="15"></td></tr>
	
	    <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Save" class="font_b"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	  </tr>

	 </table>
</form>	  <%
if(request.getMethod().equals("POST"))
{
String desc="",role="";
int ext=0;
role=request.getParameter("txtrole");
desc=request.getParameter("txtdesc");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();

smt.executeUpdate("insert into jobmaster(jcid,jrole,jdesc)values("+session.getAttribute("company")+",'"+role+"','"+desc+"')");
out.println("<script language='javascript'> alert('Job Details Added Successfully.'); </script>");
con.close();

}
catch(Exception e)
{
out.println(e);
}
}
%>
	</table>
</td></tr>

<tr valign="top">

<table width="100%" height="0" border="0" align="center"><tr><td align="center">
	 <table width="1000" align="center">
	 	  
	  
	  <tr>
	     <td colspan="6" align="center" class="font_head"><b>Job Details</b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	  <td  width="80"><div align="center"> <font color="#FFFFFF"> PROCESS</font></div></td>
	        <td width="220"><div align="center"> <font color="#FFFFFF">JOB ROLE</font></div></td>
				  <td  width="400"><div align="center"> <font color="#FFFFFF">JOB REQUIRMENT</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">DATE</font></div></td>
				 <td  width="80"><div align="center"> <font color="#FFFFFF"> DELETE</font></div></td>
				 
                 </tr> 
       <%      
try
{								
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select * from jobmaster where jcid="+session.getAttribute("company")+" and jstatus='Active'");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String d= rs2.getString("jdesc");
			String dte= rs2.getString("jdate");
		

%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
                    <td><div align="center"><a href="processjob.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Process this Job?');"><font color="#FF0000" size="4"><b>Process ?</b></font></a></div>
        <td ><div align="center"> <font color="#FFFFFF"><%=r%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=d%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=dte%></div></td>
              <td><div align="center"><a href="deletejob.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Delete this Job?');"><font color="#FF0000" size="4"><b>Delete ?</b></font></a></div>
             
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
</tr>

</table>



  
	  </body>
</html>

