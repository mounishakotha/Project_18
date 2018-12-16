<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	/*background-image: url("paste image address here");*/
	background-color: #990000;
}
th,tr{
   border: 1px solid black;
   background-color: #f2f2f2;
   padding: 10px;
}
table{
    border-color: black;
    width: 80%;
    left: 7%;
   border: 1px solid black;
   background-color: #f2f2f2;
   column-fill: auto;
   position: absolute;
}
#tab
{
    align-content: center;
    padding-left: 500px;
    padding-top: 20px;
}
p{
    
    font-size: 30px;
    text-align: CENTER;
}
</style>
</head>
<body>
<div>
            <p> STATUS OF THE REQUESTS </p>
        </div>
        <div id="tab">
            <table id="stat">
                <tr>
                    <th>Reference Number</th>
                    <th>Requests</th>
                    <th>Assigned To</th>
                    <th>Status</th>
                </tr>
                <%
String user = (String)session.getAttribute("username");
Connection con = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e){
	System.out.println(e);
}
try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","anila");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from request where username = '"+user+"'");
	while(rs.next()){
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
</tr>

<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
            </table>
        </div>
</body>
</html>