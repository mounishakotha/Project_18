<%@ page language="java" 
import ="dbs_project.LoginMain"
 contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
<!-- <p style="text-align:center; font-size:15px;">Welcome <% out.print(session.getAttribute("username")); %></p>

 onSubmit="return submit();" -->

<% 
	LoginMain l = new LoginMain();
	String req = request.getParameter("req");
	String ty = request.getParameter("type");
	String rem = request.getParameter("remarks");
	int stat= l.send_req(req,(String)session.getAttribute("username"),ty,rem);
	if(stat == 1){
		response.sendRedirect("customer.jsp");
	}
	else{
		%>
		 <p style="color:red"> Login Failed. Please try again. </p>
		<%
	}
%>
</body>
</html>