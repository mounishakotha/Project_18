<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	background-color:#cccccc;
}
.but{
	
	font-size: 18px;
	background-color: #008CBA; /*blue*/
	padding: 20px 20px;
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
.f1{
	top:40%;
	left: 20%;
	position: fixed;
}
.f2{
	top:40%;
	left: 65%;
	position: fixed;
}
</style>
</head>
<body>
<%
String req = request.getParameter("req");
String state = request.getParameter("status");
//session.removeAttribute("b"); 
String user = (String)session.getAttribute("username");
Connection con = null;
int status=0;
try{
	Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e){
	System.out.println(e);
}
try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","anila");
	PreparedStatement ps = con.prepareStatement("update request set status = ? where request=?");
	ps.setString(1,state);
	ps.setString(2,req);
	status= ps.executeUpdate();
}
catch(Exception e){
	System.out.println(e);
}
if(status==1){
	%>
	<p style="text-align:center; color: black; font-size: 30px;">Updated</p>
	<form class="f2" action="staff.jsp" method="post">
	<button class="but">Go to Home page</button>
	</form>
	<%
}
else{
	%>
	 <p style="color:red"> Not updated </p>
	<%
}
%>
</body>
</html>