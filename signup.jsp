<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Design Maker| User</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<style type="text/css">
</style>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
                int i=2;
                String userName=null;
        %>
        <% 
            String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String userid = request.getParameter("userid");
        String userpass = request.getParameter("userpass");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost:3306/designmaker";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			PreparedStatement ps=conn.prepareStatement
                  ("insert into user_details values(?,?,?,?,?,?,?)");
			ps.setInt(1, i++); 
                        ps.setString(2, fname);
        ps.setString(3, lname);
        ps.setString(4, userid);
        ps.setString(5, gender);
        ps.setString(6, userpass);
        ps.setString(7, email);
        int i=ps.executeUpdate();
			if (i > 0)
				out.print("You are successfully registered...");
		out.close();
        response.sendRedirect("login.jsp");
%> 
</div>
<div class="footer">
  &copy; Design Maker
</div>
</body>
</html>
