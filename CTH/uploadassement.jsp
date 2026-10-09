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
if(session.getAttribute("student") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
     if(document.frm.uploadfile.value=="")
    {
      alert("Select Assesment to Upload");
      document.frm.uploadfile.focus();
      return false;
    }
	}
	</script>
</head>

<body>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="c:/uploads" />
</jsp:useBean>
   
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
<table width="100%" height="800" border="0"  align="center">

<tr><td>

<table width="1200" align="center">
	 	  
	  
	  <tr>
	     <td colspan="8" align="center" class="font_head"><b>Assesment Deatils </b></td>
	  </tr>
	  <tr bgcolor="#EA7500">
	   <td  width="200"><div align="center"> <font color="#FFFFFF"> COMPANY NAME</font></div></td>
	         <td width="220"><div align="center"> <font color="#FFFFFF">JOB ROLE</font></div></td>
				  <td  width="500"><div align="center"> <font color="#FFFFFF">ASSESMENT DETAILS</font></div></td>
				  </tr> 
       <%      
try
{						
int ext1=0;		
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt=con.createStatement();
ResultSet rs2=stmt.executeQuery("select *,company.cname,jobapplications.around from jobmaster inner join company on jobmaster.jcid=company.cid inner join jobapplications on jobapplications.ajid=jobmaster.jid  where jobapplications.asusn='"+session.getAttribute("student")+"' and jstatus='Active' and aid="+request.getParameter("id")+"");
while(rs2.next())
{
int id=rs2.getInt("jid");
		String r= rs2.getString("jrole");
		String nam= rs2.getString("cname");
		String tt= rs2.getString("atest");
%>
 <tr><td height="5"></td></tr>
  <tr bgcolor="#005EBB">
   <td ><div align="center"> <font color="#FFFFFF"><%=nam%></div></td>
                    <td ><div align="center"> <font color="#FFFFFF"><%=r%></div></td>
					  <td ><div align="center"> <font color="#FFFFFF"><%=tt%></div></td>
					
					
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
 <form name="frm" method="post" enctype="multipart/form-data" action="" onSubmit="return validateForm()">
		 <table width="450" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Upload Assesment</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	  
	 <tr>
	  <td>Select Assesment :</td>
	  <td>
	  <input type="file" name="uploadfile" class="txt">
            <input type="hidden" name="todo" value="upload"></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	
	    <tr>
	  <td align="center" ></td><td><input type="submit"  name="submit"  value="Upload" class="font_b"/>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
	  </tr>

	 </table>
</form>	   <%
	if (MultipartFormDataRequest.isMultipartFormData(request))
{

   String photoname="";
   String idname="";
    String adrname="";
   String agename="";
   String file_name="";
   // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
		 
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
         
					    UploadFile file3 = (UploadFile) files.get("uploadfile");
					
					  
                    
					
					adrname = file3.getFileName();
					
				   
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                 
					 upBean.store(mrequest, "uploadfile");
					
	     }
         else out.println("<BR> todo="+todo);

//=======================================================================================
int ext=0,iid=0;
	
				
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt = con.createStatement();



					
					File f1_adr = new File("c:/uploads/"+ adrname);
					String fadr = f1_adr.getAbsolutePath();
					FileInputStream inStream_adr = new FileInputStream(fadr);
                    int inBytes_adr = inStream_adr.available();
                    byte inBuf_adr[] = new byte[inBytes_adr];
                    int bytesread_adr = inStream_adr.read(inBuf_adr,0,inBytes_adr);
                    inStream_adr.close();
				    String fadr1 = f1_adr.getAbsolutePath();
					
					
				
				
				
			    File fadrf = new File("../webapps/examples/CTH/ASM/"+ session.getAttribute("student")+"_"+ adrname);
				fadr1 = session.getAttribute("student")+"_"+ adrname;
				FileOutputStream outStream_adr = new FileOutputStream(fadrf.getAbsolutePath());
                outStream_adr.write(inBuf_adr);
                outStream_adr.close();
				

	stmt.executeUpdate("update jobapplications set aupload='"+ fadr1 +"',aresult='Upload' where aid="+request.getParameter("id")+"");
	out.println("<script language='javascript'> alert('Assesment Uploaded Successfully..'); </script>");
	con.close();
	}
	catch(Exception e)
	{
	out.println(e);
	}
	
	}
%>


	
	
	</br>
	
	 
</td></tr></table>


 
  
	  </body>
</html>
