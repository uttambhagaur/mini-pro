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
<link href="css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
<% if((String)session.getAttribute("userID")==null ||request.getParameter("login_email")!=null){
        response.sendRedirect("login.jsp");
        }       
        %>

    <%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
                String userName=null;
        %>
        <% if(request.getParameter("login_email")!=null){
        Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost:3306/designmaker";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			String sqlStmt = "SELECT * FROM user_details where userid= ? and userpass= ?";
			prepStmt = conn.prepareStatement(sqlStmt);
                        String ID= request.getParameter("login_email");
                        String Pass=request.getParameter("login_pass");
			prepStmt.setString(1, ID);
			prepStmt.setString(2, Pass);
			rs = prepStmt.executeQuery();
                        if(rs.next()){
			  String id = rs.getString("userid");
                          session.setAttribute("userID", id);
                                 String apass=rs.getString("userpass");
				 userName = rs.getString("fname");
                                 String email = rs.getString("useremail");
                                 session.setAttribute("useremail", email);
                                 String lname=rs.getString("lname");
                                     }
                        else
                        {   response.sendRedirect("login.jsp");   }
        }
                        
        %> 

<div class="container">
    <div class="leftside">
        <h3><%= userName%></h3> 
        <hr>
        <h3>about</h3>
        <hr>
    </div>
</div>
<div class="footer">
    &copy; Design Maker
</div>
</body>
</html>
