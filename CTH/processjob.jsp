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
<table width="100%" height="787" border="0" align="center">
<tr><td>
 <table width="1000" align="center">
	 	  
	  
	  <tr>
	     <td colspan="6" align="center" class="font_head"><b>Job Details</b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="80"><div align="center"> <font color="#FFFFFF"> CLOSE</font></div></td>
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
ResultSet rs2=stmt.executeQuery("select * from jobmaster where jcid="+session.getAttribute("company")+" and jstatus='Active' and jid="+request.getParameter("id")+"");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String d= rs2.getString("jdesc");
			String dte= rs2.getString("jdate");
		

%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
              <td><div align="center"><a href="closejob.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Close this Job?');"><font color="#FF0000" size="4"><b>Close ?</b></font></a></div>
            
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
<tr valign="top"><td height="222" align="center">
	 <table width="1200" align="center">
	 	  
	  
	  <tr>
	     <td colspan="7" align="center" class="font_head"><b>New Interview Application's </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> STUDENT NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">EMAIL-ID</font></div></td>
				  <td  width="150"><div align="center"> <font color="#FFFFFF">USN</font></div></td>
				  <td  width="120"><div align="center"> <font color="#FFFFFF">MOBILE -NO</font></div></td>
				   <td  width="90"><div align="center"> <font color="#FFFFFF"> RESUME</font></div></td>
	              <td  width="100"><div align="center"> <font color="#FFFFFF"> STATUS</font></div></td>
				  <td  width="220"><div align="center"> <font color="#FFFFFF"> ACTION</font></div></td>
	    </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,students.sname,students.semail,students.susn,students.smobile,students.resume from jobapplications inner join students on jobapplications.asusn=students.susn  where ajid="+request.getParameter("id")+" and jobapplications.astatus='Apply'");
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
               <td ><div align="center"> 
			   
			   
			   <font color="#FFFFFF"><%=st%></div></td>
			   <td bgcolor="#FFFFFF"><div align="center">
			   <a href="select.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Select this Status?');"><font color="#FF0000" size="4"><b>Select ?</b></font></a> &nbsp; |&nbsp;
			   <a href="reject.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Reject this Status?');"><font color="#FF0000" size="4"><b>Reject ?</b></font></a>
			    
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



<tr valign="top"><td align="center">
	 <table width="1200" align="center">
	 	  
	  
	  <tr>
	     <td colspan="7" align="center" class="font_head"><b>Interview Application's </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> STUDENT NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">EMAIL-ID</font></div></td>
				  <td  width="150"><div align="center"> <font color="#FFFFFF">USN</font></div></td>
				  <td  width="120"><div align="center"> <font color="#FFFFFF">MOBILE -NO</font></div></td>
				   <td  width="90"><div align="center"> <font color="#FFFFFF"> RESUME</font></div></td>
	              <td  width="100"><div align="center"> <font color="#FFFFFF"> STATUS</font></div></td>
				  <td  width="350"><div align="center"> <font color="#FFFFFF"> ACTION</font></div></td>
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
String rst= rs2.getString("aresult");

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
               
			   <td ><div align="center">
			  <% if(rst.equals("Waiting"))
			   { %>
			    <a href="assmentresult.jsp?id=<%=id%>"><font color="#fff" size="4"><b><u><%=st%></u></b></font></a>
			  <%}
			   else
			   {
			   %>
			    <a href="assmentresult.jsp?id=<%=id%>"><font color="#FF0000" size="4"><b><u><%=st%></u></b></font></a>
			   <%
			   
			   }
			   %>
			    </div></td>
			   
			   <td bgcolor="#FFFFFF"><div align="center">
			   <a href="firstround.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Change this Status?');"><font color="#FF0000" size="4"><b>1 Round ?</b></font></a> &nbsp; |&nbsp;
			   <a href="secondround.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Change this Status?');"><font color="#FF0000" size="4"><b>2 Round ?</b></font></a>&nbsp; |&nbsp;
			   <a href="testround.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to Change this Status?');"><font color="#FF0000" size="4"><b>Assessment ?</b></font></a>
			   
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
