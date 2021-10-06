<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<html>
<body style="background-color:#03989e; margin-top:20%; margin-left:40%;">
<style media="screen">
p {
font-size: 1.3rem;
}
</style>
<%
try
{
String regno=request.getParameter("regno");
String batch=request.getParameter("batch");
String reg=request.getParameter("regulation");
String name=request.getParameter("name");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String mobile=request.getParameter("mobile");
String pmobile=request.getParameter("pmobile");
String aadhar=request.getParameter("aadhar");
String bloodgrp=request.getParameter("bloodgrp");
Class.forName("com.mysql.jdbc.Driver"); //loading 4th driver
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
PreparedStatement ps=con.prepareStatement("insert into studentdetails values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,regno);
ps.setString(2,batch);
ps.setString(3,reg);
ps.setString(4,name);
ps.setString(5,fname);
ps.setString(6,mname);
ps.setString(7,mobile);
ps.setString(8,pmobile);
ps.setString(9,aadhar);
ps.setString(10,bloodgrp);
int r=ps.executeUpdate();
if(r==0)
{
%>
<p>Insertion Failure</p>
<a href="admin.jsp">Go back to Admin Page</a>
<%
}
else{
%>
<jsp:forward page="addstudentdetail.html"></jsp:forward>
<%
}
con.close();
}
catch(Exception e)
{
%>
<p>Data already exists cannot reinsert</p>
<a href="admin.jsp">Go back to Admin Page</a>
<%
}
%>
</body>
</html>
