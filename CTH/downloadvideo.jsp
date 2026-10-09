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
<table width="600" border="0" align="center" >
                <tr>
	     <td colspan="2" align="center" class="font_head"><b>Training Video's List</b></td>
	  </tr>
            <tr bgcolor="#FE7831">
			       <td  width="500"><div align="center"> <font color="#FFFFFF">TITLE</font></div></td>
				 <td  width="60"><div align="center"> <font color="#FFFFFF"> VIEW</font></div></td>
                 </tr> 
                <%

int id=0,cid=0,ccid=0;
String tit1="",fl1="",nam;


try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs;

rs=stmt.executeQuery("select  * from notes_videos where utype='Video'");

while(rs.next())
{
id=rs.getInt("nvid");
tit1=rs.getString("title");
fl1=rs.getString("fname");
String nam1="NV/"+fl1;
%>
<tr><td  height="5"></td></tr>
<tr bgcolor="#005EBB">
   <td><font color="#fff"><%=tit1%></font></td>
   <td align="center"><a href="videoplay.jsp?filename=<%=nam1%>" target="blank"><font color="#fff">View</font></a></td>
  
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
 
			</td></tr>
				</table>

</td></tr></table>


  
	  </body>
</html>
