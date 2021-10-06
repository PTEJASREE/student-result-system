<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<html>
<head>
<style>
body {
margin: 0;
font-family: Arial, Helvetica, sans-serif;
background: linear-gradient(90deg, #026a6e 0.4%, #03989e 0 ,#026a6e);
}
h1 {
margin-top: 4%;
font-size: 2 rem;
padding-left: 30%;
}
a,p {
margin-top: 2%;
font-size: 1.3rem;
padding-left: 30%;
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
padding: 14px 16px;
text-decoration: none;
font-size: 1.35rem;
}
.topnav a:hover {
background-color: #015457;
}
.topnav a.active {
color: white;
}
.topnav-right {
float: right;
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
padding: 8px 20px;
text-decoration: none;
float: right;
margin-right: 7.2%;
margin-top: 1%;
}
.ia {
font-size: 1.35rem;
color: white;
text-decoration: none;
display: block;
margin-top: 2%;
}
</style>
</head>
<body>
<div class="topnav">
<div class="topnav-right">
<a class="active" href="admin.jsp">Home</a>
<a href="addstudentdetail.html">AddStudent</a>
<a href="insertsm.html">AddGrades</a>
<a href="updatesm.html">UpdateGrades</a>
</div>
</div>
<form class="" action="index.html" method="post">
<button class="btn" type="submit" name="button">Log Out</button>
</form>
<h1>Welcome to Admin Page</h1>
<%
int t19=0,t20=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(RegNo) as total19 from studentdetails where Regulation='r19'");
while(rs.next())
{
t19=rs.getInt(1);
}
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st1=con1.createStatement();
ResultSet rs1=st1.executeQuery("select count(RegNo) as total20 from studentdetails where Regulation='r20'");
while(rs1.next())
{
t20=rs1.getInt(1);
}
%>
<p>Total Registered Students:<%=t19+t20%></p>
<p>Total 2019 Registered Students:<%=t19%></p>
<p>Total 2020 Registered Students:<%=t20%></p>
<a class="ia" href="viewtables1.jsp">> View Registered Student Details</a>
<a class="ia" href="viewtables2.jsp">> View 2019 Student Grades</a>
<a class="ia" href="viewtables3.jsp">> View 2020 Student Grades</a>
</body>
</html>
