<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>customer</title>
<style type="text/css">
body{
	/*background-image: url("paste image address here");*/
	background-color: #990000;
}
.drop{
	font-size:20px;
	width:80%;
	padding: 10px;
	color:black;
	background-color:none;
	top: 35%;
	left: 5%;
	position: relative;
}
.drop_down{
	font-size:20px;
	width:80%;
	padding: 10px;
	color:black;
	background-color:#f2f2f2;
	top: 35%;
	left: 5%;
	position: relative;
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
<%

%>
<body>
<div class="top_banner"><p style="color: white; text-align: center; font-size: 30px;">Welcome <% out.print(session.getAttribute("username")); %><% out.print("  ("+session.getAttribute("position")+")");%></p>
<form action="logout.jsp" method="post"><!--action="logout.jsp"-->
<button class="but" type="submit">LOGOUT</button>
</form></div>
<br><br><br><br>
<table class="drop">
<tr>
<!-- <td>
<div>
<select class="drop_down">
            <option value="A">New pin request</option>
            <option value="B">Block credit card</option>
            <option value="C">Incorrect transaction</option>
            <option value="D">Statement request</option>
            <option value="other">Others</option>
</select>
</div></td>
-->
<td>
<form action="raise_customer.html" method="post">
<p style="text-align:center;"><button class="button">Raise the request</button></p>
</form>
</td>
<td>
<form action="status.jsp" method="post">
<p style="text-align:center;"><button class="button">Notifications</button></p>
</form>
</td>
</tr>
</table>
</body>
</html>