<%@page import="java.sql.*"%>
<html>
<head>
<style>
body{
background-color:#03989e;
margin-left:4%;
margin-top:2%;
}
table{
background-color:white;
margin:0.5%;
}
table, th, td {
text-align:center;
  border: 1.5px solid black;border-collapse:collapse;
}
td,th{
font-size:1.2rem;
padding:20px;
}
a{
color:white;
position:absolute;
right:50px;
font-size:1.2rem;
}
</style>
</head>
<body>
<a href="admin.jsp">Go back to Admin page</a>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from studentdetails where Regulation='r19'");
%>
<h2 id="vsd19">R19 (2019) Student Details</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Batch</th>
<th>Regulation</th>
<th>Student Name</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Mobile Number</th>
<th>Parent Mobile Number</th>
<th>Aadharcard Number</th>
<th>Blood Group</th>
</tr>
<%
while(rs.next())
{%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
</tr>
<%}
con.close();
st.close();
rs.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st1=con1.createStatement();
ResultSet rs1=st1.executeQuery("select * from studentdetails where Regulation='r20'");
%>
<h2 id="vsd20">R20 (2020) Student Details</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Batch</th>
<th>Regulation</th>
<th>Student Name</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Mobile Number</th>
<th>Parent Mobile Number</th>
<th>Aadharcard Number</th>
<th>Blood Group</th>
</tr>
<%
while(rs1.next())
{%>
<tr>
<td><%=rs1.getString(1)%></td>
<td><%=rs1.getString(2)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><%=rs1.getString(5)%></td>
<td><%=rs1.getString(6)%></td>
<td><%=rs1.getString(7)%></td>
<td><%=rs1.getString(8)%></td>
<td><%=rs1.getString(9)%></td>
<td><%=rs1.getString(10)%></td>
</tr>
<%}
con1.close();
st1.close();
rs1.close();
%>
</table>
</body>
</html>
