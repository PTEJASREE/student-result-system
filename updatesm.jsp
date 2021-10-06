<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<html>
<body>
<style>
body {
background-color:#03989e;
}
a{
font-size:1.2rem;
padding:40px;
}
a{
font-size:1.2rem;
padding:40px;
}
</style>
<%
try{
String regno=request.getParameter("regno");
String sem=request.getParameter("sem");
String subname=request.getParameter("sub");
String grade=request.getParameter("marks");
String reg="r";
String query="select * from studentdetails where RegNo="+regno;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
while(rs.next())
reg=rs.getString("Regulation");
st.close();
rs.close();
String tn="grade"+reg;
String query1="update "+tn+" set "+subname+"="+grade+" where RegNo="+regno;
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
PreparedStatement ps1=con1.prepareStatement(query1);
int r=ps1.executeUpdate();
if(r==0)
out.println("failure");
else{
%>
<jsp:forward page="updatesm.html"></jsp:forward>
<%
}
%>
<br>
<a href="admin.jsp">Go back to Admin Page</a>
<%
con1.close();}
catch(Exception e)
{%>
<%@include file="updatesm.html"%>
<p>Enter Valid Data (or)
</p>
<p>Regno is not registered in studentdetails</p>
<%}%>
</body>
</html>
