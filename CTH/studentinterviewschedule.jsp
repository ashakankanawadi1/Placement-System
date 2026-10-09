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
<%
if(session.getAttribute("apy") == null)
	{
	
    }	 
	else
	{
	session.removeAttribute("apy");
	out.println("<script language='javascript'> alert('Applied Successfully.'); </script>");
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
<table width="100%" height="500" border="0" align="center"><tr><td align="center">
	 <table width="1200" align="center">
	 	  
	  
	  <tr>
	     <td colspan="6" align="center" class="font_head"><b>Job Details -- Interview </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> COMPANY NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">JOB ROLE</font></div></td>
				  <td  width="400"><div align="center"> <font color="#FFFFFF">JOB REQUIRMENT</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">DATE</font></div></td>
				   <td  width="100"><div align="center"> <font color="#FFFFFF"> APPLY</font></div></td>
	 
				  </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,company.cname from jobmaster inner join company on jobmaster.jcid=company.cid where jstatus='Active'");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String d= rs2.getString("jdesc");
			String dte= rs2.getString("jdate");
		String nam= rs2.getString("cname");
ext1=0;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con1=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt1=con1.createStatement();
ResultSet rs22=stmt1.executeQuery("select * from jobapplications where ajid="+id+" and asusn='"+session.getAttribute("student")+"'");
while(rs22.next())
{
ext1=1;
}
  rs22.close();
if(ext1==1)
{

}
else
{
%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
   <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
                    <td ><div align="center"> <font color="#FFFFFF"><%=r%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=d%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=dte%></div></td>
					       <td><div align="center"><a href="stdapply.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Apply this Job?');"><font color="#FF0000" size="4"><b>Apply ?</b></font></a></div>
       
               </tr>
                <%
  }


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
