<%@ page language="java" 
import = "dbs_project.LoginMain"
contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	LoginMain l = new LoginMain();
	String u= request.getParameter("user");
	String p= request.getParameter("pass");
	String e= request.getParameter("email");
	String n= request.getParameter("numb");
	String po = request.getParameter("pos");
	int ans = l.insert(u,p,e,n,po);
	if(ans==1){
		response.sendRedirect("login.html");
	}
	else{
		out.print("Registration failed");
	}
%>
</body>
</html>