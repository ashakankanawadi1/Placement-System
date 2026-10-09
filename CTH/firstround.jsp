<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*, java.io.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>

<body>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("Jdbc:Odbc:cth");
java.sql.Statement smt = con.createStatement();
smt.executeUpdate("update jobapplications set around='1 Round' where aid="+request.getParameter("id")+"");
con.close();
response.sendRedirect("addjobdetails.jsp");
}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>
