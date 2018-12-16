<!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff</title>
<style type="text/css">
    body{
	/*background-image: url("paste image address here");*/
	background-color: #990000;
}
.but{
	font-size:20px;
	padding: 10px;
	color:black;
	background-color:aqua;
	border-radius: 25%;
	border: 5px solid white;
	cursor: pointer;
	position: fixed;
	top: 5%;
	left: 80%;
}
.drop_down{
    font-size:20px;
	padding: 20px;
	color:black;
	border: 5px solid black;
	background-color:aqua;
        border-radius: 25%;
	border: 5px solid black;
}
.top_banner{
	background-color: #ff9900;
	padding: 4px;
}
.button{
	font-size:20px;
	padding: 20px;
	color:black;
	border: 5px solid black;
	background-color:aqua;
	border-radius: 25%;
	border: 5px solid black;
	cursor: pointer;
}
.button:hover{
	border: 5px solid blue;
	background-color: white;
	padding: 30px;
	color:blue;
}
</style>
    </head>
    
    <body>
    <div class="top_banner"><p style="color: white; text-align: center; font-size: 30px;">Welcome <% out.print(session.getAttribute("username")); %></p>
<form action="logout.jsp" method="post"><!--action="logout.jsp"-->
<!-- <button class="but" type="submit">LOGOUT</button>
</form></div>
<br><br><br><br>
        <table cellpadding="10">
            <tr>
                <th>
        <form method="post" action="Status.html">
        <input type="button" name="button" value=" Add new services" class="button">
        </form>
                </th>
                
                <th>
        
        <input type="button" name="button" value="Manage service requests" class="button">
        
                </th>
                
            </tr>
        </table>
</body>
</html> -->

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
	background-color:#990000;
}
.button{
	font-size: 18px;
	background-color: #008CBA; /*blue*/
	padding: 20px 20px;
	border: none;
	color: white;
	border-radius: 25%;
	transition-duration: 0.2s;
	cursor: pointer;
	right: 3%;
	top: 3%;
	position:absolute;
}
.button:hover{
	background-color: white;
	color:#008CBA;
	border: 1px solid #008CBA;
}
.tab{
	padding: 10px;
	color: black;
	width: 85%;
	background-color:#cccccc;
	border: 2px solid black;
	top:25%;
	left: 7%;
	position:relative;
}
.but{
	font-size: 18px;
	background-color: #008CBA; /*blue*/
	padding: 10px 10px;
	border: none;
	color: white;
	border-radius: 25%;
	transition-duration: 0.2s;
	cursor: pointer;
}
.but:hover{
	background-color: white;
	color:#008CBA;
	border: 1px solid #008CBA;
}
.top_banner{
	background-color: #ff9900;
	padding: 4px;
}
#h{
	background-color:black;
	color:white;
	font-size: 25px;
	padding: 10px;
	height: 50px;
}
#t{
	font-size: 30px;
	padding: 10px;
}
tr,td{
	padding: 7px;
	font-size: 20px;
	padding: 10px;
	text-align: center;
}
tr:nth-child(odd){
	background-color: #f2f2f2; /*light grey*/
}
</style>
</head>
<body>
<div class="top_banner"><p style="color: white; text-align: center; font-size: 30px;">Welcome <% out.print(session.getAttribute("username")); %><% out.print("  ("+session.getAttribute("position")+")");%></p>
</div>
<table class="tab">
<tr id="h">

<td id="t">Request</td>
<td id="t">Username</td>
<td id="t">Type</td>
<td id="t">Remarks</td>
<td id="t">Status</td>

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
	ResultSet rs= st.executeQuery("select * from request");
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><form action="update.jsp?req=<%=rs.getString(1) %>" method="post">
<input type="text" name="status">
<button class="but">Update</button>
</form>
</td>
</tr>
	

<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
<form action="staff.jsp" method="post">
<button class="button">Home Page</button>
</form>
</body>
</html>