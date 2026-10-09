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
<table width="100%" height="500" border="0" align="center"><tr><td align="center">
	 <table width="1200" align="center">
	 	  
	  <tr>
	     <td colspan="7" align="center" class="font_head"><b>Assesment Detail's </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> STUDENT NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">EMAIL-ID</font></div></td>
				   <td  width="400"><div align="center"> <font color="#FFFFFF"> ASSESMENT</font></div></td>
	               <td  width="70"><div align="center"> <font color="#FFFFFF"> VIEW</font></div></td>
	              
				  <td  width="250"><div align="center"> <font color="#FFFFFF"> ACTION</font></div></td>
	    </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,students.sname,students.semail,students.susn,students.smobile,students.resume from jobapplications inner join students on jobapplications.asusn=students.susn  where ajid="+request.getParameter("id")+" and jobapplications.astatus='Accepted'");
while(rs2.next())
{
int id=rs2.getInt("aid");
String st= rs2.getString("around");
String tst= rs2.getString("atest");
String rst= rs2.getString("aupload");


		String nam= rs2.getString("sname");
		String em= rs2.getString("semail");
			String us= rs2.getString("susn");
			String mb= rs2.getString("smobile");
			
%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
   <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
                    <td ><div align="center"> <font color="#FFFFFF"><%=em%></div></td>
					<td ><div align="center"> <font color="#FFFFFF"><%=tst%></div></td>
					
					 <td align="center"><a target="_blank" href="ASM/<%=rst%>" target="blank"><font color="#fff">View</font></a></td>
               
			   
			   <td bgcolor="#FFFFFF"><div align="center">
			   <a href="selectstd.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Select this Student?');"><font color="#FF0000" size="4"><b>Select ?</b></font></a>&nbsp; |&nbsp;
			   <a href="rejectstd.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Rject this Student?');"><font color="#FF0000" size="4"><b>Reject ?</b></font></a>
			   
			   </div>
             
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

</table>


  
  
</body>
</html>
