<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<style>
@media print {
#printPageButton {
display: none;
}
a{
display:none;
}
}
td{
width: 230px
}
table,th,td{
border:1.5px solid black;border-collapse:collapse;
font-size:1.5rem;
margin:3.5%;
margin-left:5%;
}
th,td{
padding:4.5px;
}
a{
float: right;
margin-right:20%;
}
button{
font-size:1.5rem;
font-weight:bold;
margin-left:24%;
padding:0.5% 3.5%;
border: none;
}
</style>
<%
try
{
String regno=request.getParameter("regno");
String sem=request.getParameter("sem");
String reg="r";
String name="";
String query="select * from studentdetails where RegNo="+regno;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
while(rs.next())
{
reg=rs.getString("Regulation");
name=rs.getString("Name");
}
st.close();
rs.close();
Class.forName("com.mysql.jdbc.Driver"); //loading 4th driver
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement stmt=conn.createStatement();
String query1="select s1,s2,s3,s4,s5,l1,l2,l3 from grade"+reg+" where RegNo="+regno+" and sem="+sem;
ResultSet rst=stmt.executeQuery(query1);
String s1="",s2="",s3="",s4="",s5="",s6="",l1="",l2="",l3="",sem1="1",sem2="2",sem3="3",sem4="4",sem5="5",sem6="6",sem7="7",sem8="8";
if(sem.equals(sem1))
{
s1="English";
s2="Mathematics1";
s3="Mathematics2";
s4="Applied Chemistry";
s5="C Language";
l1="C Lab";
l2="Applied Chemistry Lab";
l3="English Lab";
}
else if(sem.equals(sem2))
{
s1="Digital Logic Design";
s2="Mathematics3";
s3="Applied Physics";
s4="Python";
s5="Engineering Drawing";
l1="Applied Physics Lab";
l2="Python Lab";
l3="CommunicationSkills Lab";
}
else if(sem.equals(sem3))
{
s1="Mathematics4";
s2="Software Engineering";
s3="Advanced Data Structures";
s4="Object Oriented Programming";
s5="Computer Organisation";
l1="OOP Lab";
l2="ADS Lab";
l3="C++ Lab";
}
else if(sem.equals(sem4))
{
s1="Probability and Statistics";
s2="Advanced Java Programming";
s3="Operating Systems";
s4="Database Management Systems";
s5="Design and 	Analysis of Algorithms";
l1="AJP Lab";
l2="DBMS Lab";
l3="OS Lab";
}
else if(sem.equals(sem5))
{
s1="Computer Networks";
s2="Web Technologies";
s3="Application Development";
s4="Cyber Security";
s5="Automata Theory";
l1="Application Development Lab";
l2="Advanced Coding";
l3="Web Development Lab";
}
else if(sem.equals(sem6))
{
s1="Data Mining";
s2="object oriented Software Engineering";
s3="Artificial Intelligence";
s4="Compiler Design";
s5="Cloud Computing";
l1="Software Engineering Lab";
l2="Competitive Coding";
l3="Network Programming Lab";
}
else if(sem.equals(sem7))
{
s1="Big Data Analysis";
s2="IOT";
s3="Machine Learning";
s4="Cryptography";
s5="Network Security";
l1="Competitive coding Lab";
l2="Big Data Analytics Coding";
l3="IOT Lab";
}
else if(sem.equals(sem8))
{
s1="UML";
s2="Data Warehousing";
s3="Professional Elective 1";
s4="Design patterns";
s5="Elective2";
l1="Application Development Lab";
l2="Advanced Coding";
l3="Emp Skills Lab";
}
while(rst.next())
{%>
<a href="sd.jsp">Go back to Studentpage</a>
<table>
<tr><td>Name            </td><td><%=name%></td></tr>
<tr><td>Registration Number</td><td><%=regno%></td></tr>
<tr><td>Semester</td><td><%=sem%></td></tr>
</table>
<table >
<tr><th style="text-align:left;">subject name</th><th>Marks</th></tr>
<tr><td><%=s1%></td><td style="text-align:center;"><%=rst.getString(1)%></td></tr>
<tr><td><%=s2%></td><td style="text-align:center;"><%=rst.getString(2)%></td></tr>
<tr><td><%=s3%></td><td style="text-align:center;"><%=rst.getString(3)%></td></tr>
<tr><td><%=s4%></td><td style="text-align:center;"><%=rst.getString(4)%></td></tr>
<tr><td><%=s5%></td><td style="text-align:center;"><%=rst.getString(5)%></td></tr>
<tr><td><%=l1%></td><td style="text-align:center;"><%=rst.getString(6)%></td></tr>
<tr><td><%=l2%></td><td style="text-align:center;"><%=rst.getString(7)%></td></tr>
<tr><td><%=l3%></td><td style="text-align:center;"><%=rst.getString(8)%></td></tr>
<%}
conn.close();
stmt.close();
int total;
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement stmt1=con1.createStatement();
String query2="select s1,s2,s3,s4,s5,l1,l2,l3,(s1+s2+s3+s4+s5+l1+l2+l3) as total from grade"+reg+" where RegNo="+regno+" and sem="+sem;
ResultSet rst1=stmt1.executeQuery(query2);
if(rst1.next())
{
double sgp=0;
if(rst1.getInt("s1")>=6&&rst1.getInt("s2")>=6&&rst1.getInt("s3")>=6&&rst1.getInt("s4")>=6&&rst1.getInt("s5")>=6&&rst1.getInt("l1")>=6&&rst1.getInt("l2")>=6&&rst1.getInt("l3")>=6)
{
total=rst1.getInt("total");
double t=8;
sgp=total/t;
sgp=(double) Math.round(sgp * 100) / 100;
}
%>
<tr><td>SGPA</td><td style="text-align:center;"><%=sgp%></td></tr>
</table>
<button id="printPageButton" onClick="window.print();">Print</button>
<%
}
else
{
%>
<jsp:forward page="result.html"></jsp:forward>
<%
}
%>
<%
}
catch(Exception e)
{
%>
<jsp:forward page="result.html"></jsp:forward>
<%
}
%>
</body>
</html>
