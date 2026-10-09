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
if(session.getAttribute("officer") == null)
	{
	response.sendRedirect("index.jsp");
    }	 
%>
<script>
function validateForm()
{
    if(document.frm.txttit.value=="")
    {
      alert("Enter Title");
      document.frm.txttit.focus();
      return false;
    }
	 if(document.frm.uploadfile.value=="")
    {
      alert("Select Video to Upload");
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
<table width="100%" height="600" border="0"  align="center"><tr><td align="center">
 <form name="frm" method="post" enctype="multipart/form-data" action="" onSubmit="return validateForm()">
		 <table width="450" align="center">
	 	  <tr bordercolor="#333333"><td height="5"></td></tr>
	  
	  <tr>
	     <td colspan="2" align="center" class="font_head"><b>Upload Job Note's</b></td>
	  </tr>
	  
	  <tr><td height="15"></td></tr>
	  
	  <tr>
	  <td>Enter Title :</td>
	  <td>
	
	  <input type="text" name="txttit" size="35" class="txt"></td>
	  </tr>
	  
	  
	  <tr><td height="10"></td></tr>
	  
	   <tr>
	  <td>Select File :</td>
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
</form>	  <%
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
String tit="";

				tit=mrequest.getParameter("txttit");
				
				
				
				
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement stmt = con.createStatement();

ResultSet rs32=stmt.executeQuery("select * from notes_videos ");
while(rs32.next())
{
iid=rs32.getInt("nvid");
}
iid=iid+1;

ResultSet rs31=stmt.executeQuery("select * from notes_videos where title='"+tit+"' ");
while(rs31.next())
{
ext=1;
}
if(ext==1)
{
out.println("<script language='javascript'> alert('You Have Already Uploaded this Title'); </script>");
return;
}

					
					File f1_adr = new File("c:/uploads/"+ adrname);
					String fadr = f1_adr.getAbsolutePath();
					FileInputStream inStream_adr = new FileInputStream(fadr);
                    int inBytes_adr = inStream_adr.available();
                    byte inBuf_adr[] = new byte[inBytes_adr];
                    int bytesread_adr = inStream_adr.read(inBuf_adr,0,inBytes_adr);
                    inStream_adr.close();
				    String fadr1 = f1_adr.getAbsolutePath();
					
					
				
				
				
			    File fadrf = new File("../webapps/examples/CTH/NV/"+ iid+"_"+ adrname);
				fadr1 = iid+"_"+ adrname;
				FileOutputStream outStream_adr = new FileOutputStream(fadrf.getAbsolutePath());
                outStream_adr.write(inBuf_adr);
                outStream_adr.close();
				

	stmt.executeUpdate("insert into notes_videos(utype,title,fname)values('Video','"+ tit +"','"+ fadr1 +"')");
	out.println("<script language='javascript'> alert('Video Uploaded Successfully..'); </script>");
	}
	catch(Exception e)
	{
	out.println(e);
	}
	
	}
%>


	
	</br>
	
	 <table width="600" border="0" align="center" >
                 <tr>
	     <td  align="center" class="font_head" colspan="2"><b>Training Video's List</b></td>
	  </tr>
            <tr bgcolor="#FE7831">
			       <td  width="500"><div align="center"> <font color="#FFFFFF">TITLE</font></div></td>
				 <td  width="80"><div align="center"> <font color="#FFFFFF"> DELETE</font></div></td>
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
   <td><a href="videoplay.jsp?filename=<%=nam1%>" target="blank"><font color="#fff"><%=tit1%></font></a></td>
    <td align="center"><a  href="del_video.jsp?filename=<%=fl1%>" onclick="return confirm('Are you sure you want to Delete this Video?');"><font color="#FF0000">Delete</a></td>
  </tr>
           <%
  

}
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
