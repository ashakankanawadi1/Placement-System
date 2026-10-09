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
	  <table width="100%" height="787" border="0" align="center">
<tr><td>
 <table width="1000" align="center">
	 	  

	  <tr>
	     <td colspan="8" align="center" class="font_head"><b>Interview Report </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> COMPANY NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">JOB ROLE</font></div></td>
				  <td  width="400"><div align="center"> <font color="#FFFFFF">JOB REQUIRMENT</font></div></td>
				  <td  width="200"><div align="center"> <font color="#FFFFFF">DATE</font></div></td>
				   <td  width="250"><div align="center"> <font color="#FFFFFF"> STATUS</font></div></td>
				  </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,company.cname,jobapplications.around from jobmaster inner join company on jobmaster.jcid=company.cid inner join jobapplications on jobapplications.ajid=jobmaster.jid  where jobapplications.asusn='"+session.getAttribute("student")+"' and jstatus='Active'");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String d= rs2.getString("jdesc");
			String dte= rs2.getString("jdate");
		String nam= rs2.getString("cname");
		String st= rs2.getString("around");
		String tt= rs2.getString("atest");
%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
   <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
                    <td ><div align="center"> <font color="#FFFFFF"><%=r%></div></td>
					 <td ><div align="center"> <font color="#FFFFFF"><%=d%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=dte%></div></td>
					
					 <%
			  if(st.equals("Assesment"))
			  {
			  %>
			  <td bgcolor="#000"><div align="center"> <font color="#fff">
			      			   <a href="uploadassement.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Upload Assement?');"><font color="#fff" size="3"><b><u>Assement Upload ?</u></b></font></a>
			  

				  </div></td>
			  <%
			  }
			  else
			  {
			  %>
			 <td ><div align="center"> <font color="#FF0000"><%=st%></div></td>
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
