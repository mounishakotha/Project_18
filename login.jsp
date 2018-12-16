<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" 
import = "dbs_project.LoginMain"
contentType="text/html; 
charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String pos = "";
LoginMain l = new LoginMain();
String u= request.getParameter("user");
session.setAttribute("username", u);
String p= request.getParameter("pass");
int ans = l.check(u,p);
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
	ResultSet rs= st.executeQuery("select position from user where username = '"+u+"' ");
	while(rs.next()){
		pos=rs.getString(1);
	}
	session.setAttribute("position", pos);
	if(ans==1){
		if(pos.equals("customer")){
			response.sendRedirect("customer.jsp");
		}
		else if(pos.equals("staff")){
			response.sendRedirect("staff.jsp");
		}
		else if(pos.equals("head")){
			response.sendRedirect("head.jsp");
		}
	}
else{
	%>
	 <p style="color:red"> Login Failed. Please try again. </p>
	<%
}
}
		catch(Exception e){
			System.out.println(e);
		}
%>
</body>
</html>