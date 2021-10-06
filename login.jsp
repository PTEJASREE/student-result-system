<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String id=request.getParameter("un");
String n=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from adminlogin where un='"+id+"' and pwd='"+n+"'");
if(rs.next())
{
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%}
else
{%>
<p>Invalid credentials</p>
<%@include file="adminlogin.html"%>
<%}
con.close();
%>
