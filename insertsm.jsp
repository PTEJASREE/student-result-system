<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<html>
<body style="background-color:#03989e; margin-top:20%; margin-left:40%;">
<style>
a {
font-size: 1.2rem;
}
.ia {
padding-bottom: 10%;
}
</style>
<%
try{
String regno=request.getParameter("regno");
String sem=request.getParameter("sem");
int s1=Integer.valueOf(request.getParameter("s1"));
int s2=Integer.valueOf(request.getParameter("s2"));
int s3=Integer.valueOf(request.getParameter("s3"));
int s4=Integer.valueOf(request.getParameter("s4"));
int s5=Integer.valueOf(request.getParameter("s5"));
int l1=Integer.valueOf(request.getParameter("l1"));
int l2=Integer.valueOf(request.getParameter("l2"));
int l3=Integer.valueOf(request.getParameter("l3"));
String reg="r";
String query="select * from studentdetails where RegNo="+regno;
Class.forName("com.mysql.jdbc.Driver"); //loading 4th driver
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
while(rs.next())
reg=rs.getString("Regulation");
st.close();
rs.close();
String tn="grade"+reg;
Class.forName("com.mysql.jdbc.Driver"); //loading 4th driver
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
PreparedStatement pst=conn.prepareStatement("insert into "+tn+" values(?,?,?,?,?,?,?,?,?,?)");
pst.setString(1,regno);
pst.setString(2,sem);
pst.setInt(3,s1);
pst.setInt(4,s2);
pst.setInt(5,s3);
pst.setInt(6,s4);
pst.setInt(7,s5);
pst.setInt(8,l1);
pst.setInt(9,l2);
pst.setInt(10,l3);
int r=pst.executeUpdate();
if(r==0)
{
%>
<p>Inserion Failure</p>
<a class="ia" href="insertsm.html">Go back to Marks Insertion Page</a>
<a href="admin.jsp">Go Back to Admin Page</a>
<%
}
else{
%>
<jsp:forward page="insertsm.html"></jsp:forward>
<%
conn.close();
}
}
catch(Exception e)
{
%>
<h2>Reg No. not registered or Data already exists cannot reinsert</h2>
<br>
<a class="ia" href="insertsm.html">Go back to Marks Insertion Page</a>
<a href="admin.jsp">Go Back to Admin Page</a>
<br>
<%
}
%>
</body>
<html>
