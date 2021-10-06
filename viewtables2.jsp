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
select{
  font-size: 1.2rem;
  padding: 1px 5px;
}
button{
  background-color: white;
  border:5px;
  padding: 3px 8px;
  font-size: 1.2rem;
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
String order=request.getParameter("order");
String sem=request.getParameter("sem");
if(order == null){
order="RegNo";
sem="s1";
}
String q1="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='1' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q2="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='2' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q3="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='3' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q4="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='4' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q5="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='5' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q6="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='6' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q7="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='7' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
String q8="select RegNo,s1,s2,s3,s4,s5,l1,l2,l3 from grader19 where sem='8' and RegNo in (select RegNo from studentdetails where Regulation='r19')";
if(sem.equals("1")&& !order.equals("RegNo"))
{
  q1=q1+" order by "+order +" desc";
}
if(sem.equals("2")&& !order.equals("RegNo"))
{
  q2=q2+" order by "+order +" desc";
}
if(sem.equals("3")&& !order.equals("RegNo"))
{
  q3=q3+" order by "+order +" desc";
}
if(sem.equals("4")&& !order.equals("RegNo"))
{
  q4=q4+" order by "+order +" desc";
}
if(sem.equals("5")&& !order.equals("RegNo"))
{
  q5=q5+" order by "+order +" desc";
}
if(sem.equals("6")&& !order.equals("RegNo"))
{
  q6=q6+" order by "+order +" desc";
}
if(sem.equals("7")&& !order.equals("RegNo"))
{
  q7=q7+" order by "+order +" desc";
}
if(sem.equals("8")&& !order.equals("RegNo"))
{
  q8=q8+" order by "+order +" desc";
}
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st1=con1.createStatement();
ResultSet rs1=st1.executeQuery(q1);
%>
<form class="" action="viewtables2.jsp" method="post">
  <label for="order">Sort By:</label>
  <select name="order" >
    <option value="RegNo">RegNo</option>
    <option value="s1">sub1</option>
    <option value="s2">sub2</option>
    <option value="s3">sub3</option>
    <option value="s4">sub4</option>
    <option value="s5">sub5</option>
    <option value="l1">lab1</option>
    <option value="l2">lab2</option>
    <option value="l3">lab3</option>
  </select>
  <select name="sem">
    <option value="1">sem1</option>
    <option value="2">sem2</option>
    <option value="3">sem3</option>
    <option value="4">sem4</option>
    <option value="5">sem5</option>
    <option value="6">sem6</option>
    <option value="7">sem7</option>
    <option value="8">sem8</option>
  </select>
  <button type="submit" name="button">SORT</button>
</form>
<h2 id="sem191">2019 Students 1st Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>English</th>
<th>Mathematics-1</th>
<th>Mathematics-2</th>
<th>Applied Chemistry</th>
<th>C Language</th>
<th>C Lab</th>
<th>Chemistry Lab</th>
<th>English Lab</th>
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
</tr>
<%}
con1.close();
st1.close();
rs1.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st2=con2.createStatement();
ResultSet rs2=st2.executeQuery(q2);
%>
<h2 id="sem192">2019 Students 2nd Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>DLD</th>
<th>Mathematics-3</th>
<th>Applied Physics</th>
<th>Python</th>
<th>Engineering Drawing</th>
<th>Applied Physics Lab</th>
<th>Python Lab</th>
<th>CommunicationSkills Lab</th>
</tr>
<%
while(rs2.next())
{%>
<tr>
<td><%=rs2.getString(1)%></td>
<td><%=rs2.getString(2)%></td>
<td><%=rs2.getString(3)%></td>
<td><%=rs2.getString(4)%></td>
<td><%=rs2.getString(5)%></td>
<td><%=rs2.getString(6)%></td>
<td><%=rs2.getString(7)%></td>
<td><%=rs2.getString(8)%></td>
<td><%=rs2.getString(9)%></td>
</tr>
<%}
con2.close();
st2.close();
rs2.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st3=con3.createStatement();
ResultSet rs3=st3.executeQuery(q3);
%>
<h2 id="sem193">2019 Students 3rd Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Mathematics-4</th>
<th>Software Engineering</th>
<th>Advanced Data Structures</th>
<th>Object Oriented Programming</th>
<th>Computer Organisation</th>
<th>OOP Lab</th>
<th>ADS Lab</th>
<th>C++ Lab</th>
</tr>
<%
while(rs3.next())
{%>
<tr>
<td><%=rs3.getString(1)%></td>
<td><%=rs3.getString(2)%></td>
<td><%=rs3.getString(3)%></td>
<td><%=rs3.getString(4)%></td>
<td><%=rs3.getString(5)%></td>
<td><%=rs3.getString(6)%></td>
<td><%=rs3.getString(7)%></td>
<td><%=rs3.getString(8)%></td>
<td><%=rs3.getString(9)%></td>
</tr>
<%}
con3.close();
st3.close();
rs3.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con4=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st4=con4.createStatement();
ResultSet rs4=st4.executeQuery(q4);
%>
<h2 id="sem193">2019 Students 4th Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Probability and Statistics</th>
<th>Advanced Java Programming</th>
<th>Operating Systems</th>
<th>Database Management Systems</th>
<th>Design and Analysis of Algorithms</th>
<th>Operating Systems Lab</th>
<th>AJP Lab</th>
<th>DBMS Lab</th>
</tr>
<%
while(rs4.next())
{%>
<tr>
<td><%=rs4.getString(1)%></td>
<td><%=rs4.getString(2)%></td>
<td><%=rs4.getString(3)%></td>
<td><%=rs4.getString(4)%></td>
<td><%=rs4.getString(5)%></td>
<td><%=rs4.getString(6)%></td>
<td><%=rs4.getString(7)%></td>
<td><%=rs4.getString(8)%></td>
<td><%=rs4.getString(9)%></td>
</tr>
<%}
con4.close();
st4.close();
rs4.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con5=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st5=con5.createStatement();
ResultSet rs5=st5.executeQuery(q5);
%>
<h2>2019 Students 5th Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Computer Networks</th>
<th>Web Technologies</th>
<th>Application Development</th>
<th>Cyber Security</th>
<th>Automata Theory</th>
<th>Application Development Lab</th>
<th>Advanced Coding</th>
<th>Web Development Lab</th>
</tr>
<%
while(rs5.next())
{%>
<tr>
<td><%=rs5.getString(1)%></td>
<td><%=rs5.getString(2)%></td>
<td><%=rs5.getString(3)%></td>
<td><%=rs5.getString(4)%></td>
<td><%=rs5.getString(5)%></td>
<td><%=rs5.getString(6)%></td>
<td><%=rs5.getString(7)%></td>
<td><%=rs5.getString(8)%></td>
<td><%=rs5.getString(9)%></td>
</tr>
<%}
con5.close();
st5.close();
rs5.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con6=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st6=con6.createStatement();
ResultSet rs6=st6.executeQuery(q6);
%>
<h2>2019 Students 6th Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Data Mining</th>
<th>object oriented Software Engineering</th>
<th>Artificial Intelligence</th>
<th>Compiler Design</th>
<th>Cloud Computing</th>
<th>Software Engineering Lab</th>
<th>Competitive Coding</th>
<th>Network Programming Lab</th>
</tr>
<%
while(rs6.next())
{%>
<tr>
<td><%=rs6.getString(1)%></td>
<td><%=rs6.getString(2)%></td>
<td><%=rs6.getString(3)%></td>
<td><%=rs6.getString(4)%></td>
<td><%=rs6.getString(5)%></td>
<td><%=rs6.getString(6)%></td>
<td><%=rs6.getString(7)%></td>
<td><%=rs6.getString(8)%></td>
<td><%=rs6.getString(9)%></td>
</tr>
<%}
con6.close();
st6.close();
rs6.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con7=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st7=con7.createStatement();
ResultSet rs7=st7.executeQuery(q7);
%>
<h2>2019 Students 7th Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>Big Data Analysis</th>
<th>IOT</th>
<th>Machine Learning</th>
<th>Cryptography</th>
<th>Network Security</th>
<th>Competitive coding Lab</th>
<th>Big Data Analytics Coding</th>
<th>IOT Lab</th>
</tr>
<%
while(rs7.next())
{%>
<tr>
<td><%=rs7.getString(1)%></td>
<td><%=rs7.getString(2)%></td>
<td><%=rs7.getString(3)%></td>
<td><%=rs7.getString(4)%></td>
<td><%=rs7.getString(5)%></td>
<td><%=rs7.getString(6)%></td>
<td><%=rs7.getString(7)%></td>
<td><%=rs7.getString(8)%></td>
<td><%=rs7.getString(9)%></td>
</tr>
<%}
con7.close();
st7.close();
rs7.close();
%>
</table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con8=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st8=con8.createStatement();
ResultSet rs8=st8.executeQuery(q8);
%>
<h2>2019 Students 8th Semester Grades</h2>
<table>
<tr>
<th>Registration Number</th>
<th>UML</th>
<th>Data Warehousing</th>
<th>Professional Elective 1</th>
<th>Design patterns</th>
<th>Elective2</th>
<th>Application Development Lab</th>
<th>Advanced Coding</th>
<th>Emp Skills Lab</th>
</tr>
<%
while(rs8.next())
{%>
<tr>
<td><%=rs8.getString(1)%></td>
<td><%=rs8.getString(2)%></td>
<td><%=rs8.getString(3)%></td>
<td><%=rs8.getString(4)%></td>
<td><%=rs8.getString(5)%></td>
<td><%=rs8.getString(6)%></td>
<td><%=rs8.getString(7)%></td>
<td><%=rs8.getString(8)%></td>
<td><%=rs8.getString(9)%></td>
</tr>
<%}
con8.close();
st8.close();
rs8.close();
%>
</table>
</body>
</html>
