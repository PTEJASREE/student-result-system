<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<style>
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
padding:13px;
width:320px;
}
body {
margin: 0;
font-family: Arial, Helvetica, sans-serif;
background: linear-gradient(90deg, #026a6e 0.4%, #03989e 0 ,#026a6e);
}
.topnav {
padding-top: 1.1%;
padding-right: 6%;
overflow: hidden;
}
.topnav a {
float: left;
color: black;
text-align: center;
padding: 18px 16px;
text-decoration: none;
font-size: 1.35rem;
}
.topnav a:hover {
background-color: #015457 ;
}
.topnav a.active {
color:white;
}
.topnav-right {
float: right;
}
.s
{
padding-top: 40px;
padding-bottom: 25px;
}
button
{
margin: 5px;
margin-top: 14px;
padding: 10px 35px;
border-radius: 2px;
background-color: white;
border: none;
position: relative;
bottom: 4px;
}
.btn {
border: none;
background: white;
background-image: -webkit-linear-gradient(top, white, white);
background-image: -moz-linear-gradient(top, white, white);
background-image: -ms-linear-gradient(top, white, white);
background-image: -o-linear-gradient(top, white, white);
background-image: linear-gradient(to bottom, white, white);
border-radius: 5px;
font-family: Arial;
color: black;
font-size: 23px;
padding: 8px 20px 8px 20px;
text-decoration: none;
float: right;
margin-right: 6.5%;
}
</style>
</head>
<body>
<div class="topnav">
<div class="topnav-right">
<a class="active" href="sd.jsp">StudentInfo</a>
<a href="result.html">Results</a>
</div>
</div>
<form class="" action="index.html" method="post">
<button class="btn" type="submit" name="button">Exit</button>
</form>
<center>
<form class="s" action="sd.jsp" method="post">
<span style="font-weight:bold; font-size:23px;">
Enter Registration Number:
</span>
<input type="text" name="RegNo" value="" style="font-size:28px;">
<button type="submit" name="button" >Submit</button>
</form>
<%
String RegNo=request.getParameter("RegNo");
if(RegNo == null || RegNo.equals(""))
RegNo="1";
String query="select * from studentdetails where RegNo=";
query=query+RegNo;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
while(rs.next())
{
%>
<table>
<tr><td style="font-weight:bold;">Registration Number</td><td><%=rs.getString(1)%></td></tr>
<tr><td style="font-weight:bold;">Batch</td><td><%=rs.getString(2)%></td></tr>
<tr><td style="font-weight:bold;">Regulation</td><td><%=rs.getString(3)%></td></tr>
<tr><td style="font-weight:bold;">Name</td><td><%=rs.getString(4)%></td></tr>
<tr><td style="font-weight:bold;">Father Name</td><td><%=rs.getString(5)%></td></tr>
<tr><td style="font-weight:bold;">Mother Name</td><td><%=rs.getString(6)%></td></tr>
<tr><td style="font-weight:bold;">Mobile Number</td><td><%=rs.getString(7)%></td></tr>
<tr><td style="font-weight:bold;">Parent Mobile</td><td><%=rs.getString(8)%></td></tr>
<tr><td style="font-weight:bold;">Aadhar Number</td><td><%=rs.getString(9)%></td></tr>
<tr><td style="font-weight:bold;">Blood Group</td><td><%=rs.getString(10)%></td></tr>
</table>
<%
}%>
</center>
</body>
</html>
