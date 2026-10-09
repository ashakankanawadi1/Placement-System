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
<table width="100%" height="600" border="0"  align="center">

<tr><td>

<table width="1200" align="center">	  
	  <tr>
	     <td colspan="6" align="center" class="font_head"><b>Job Details</b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	        <td width="220"><div align="center"> <font color="#FFFFFF">JOB ROLE</font></div></td>
				  <td  width="400"><div align="center"> <font color="#FFFFFF">JOB REQUIRMENT</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">DATE</font></div></td>
				 </tr> 
       <%      
try
{								
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select * from jobmaster where jcid="+session.getAttribute("company")+" and jstatus='Close'");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String d= rs2.getString("jdesc");
			String dte= rs2.getString("jdate");
		

%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
        <td ><div align="center"> <font color="#FFFFFF"><%=r%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=d%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=dte%></div></td>
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
	 
	 
	</td></tr>
<tr valign="top"><td align="center">
	 <table width="1200" align="center">
	 	  
	  
	  <tr>
	     <td colspan="6" align="center" class="font_head"><b>Interview Complete Result </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> STUDENT NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">EMAIL-ID</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">USN</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">MOBILE -NO</font></div></td>
				   <td  width="100"><div align="center"> <font color="#FFFFFF"> RESUME</font></div></td>
	              <td  width="100"><div align="center"> <font color="#FFFFFF"> STATUS</font></div></td>
				  </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,students.sname,students.semail,students.susn,students.smobile,students.resume from jobapplications inner join students on jobapplications.asusn=students.susn  where ajid="+request.getParameter("id")+"");
while(rs2.next())
{
int id=rs2.getInt("aid");
String st= rs2.getString("around");

		String nam= rs2.getString("sname");
		String em= rs2.getString("semail");
			String us= rs2.getString("susn");
			String mb= rs2.getString("smobile");
			String re= rs2.getString("resume");
		
%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
   <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
                    <td ><div align="center"> <font color="#FFFFFF"><%=em%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=us%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=mb%></div></td>
					
					<td align="center"><a href="Resume/<%=re%>" target="blank"><font color="#fff">View</font></a></td>
              <%
			  if(st.equals("Rejected"))
			  {
			  %>
			  <td bgcolor="#FF0000"><div align="center"> <font color="#fff"><%=st%></div></td>
			  <%
			  }
			  else
			  {
			  %>
			  <td ><div align="center"> <font color="#FFFFFF"><%=st%></div></td>
			  <%
			  
			  }
			  %>
			   
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
