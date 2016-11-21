<%@page import="java.io.OutputStream"%>
<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Design Maker</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<style>
    img{
        width: 400px;
        height:200px;
        margin-top: 120px;
        margin-left: 490px;
    }
    img:hover{
        box-shadow:2px 2px 5px 3px #757575; 
    }
    .visitingcard .content{
        position: absolute;
        top:200px;
        left: 550px;
    }
</style>

</head>
<body>
<jsp:include page="header.jsp"/>
<%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
                String userName="Full Name",address="Address";
                String occupation="Ocupation",dob="DD/MM/YY",father="father",phone="Mobile",email="Email";
                
        %>
        <% 
        Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost:3306/designmaker";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			String sqlStmt = "SELECT * FROM resume,user_details where userid=?";
                        
			prepStmt = conn.prepareStatement(sqlStmt);
                        String id=(String)session.getAttribute("userID");
                        prepStmt.setString(1, id);
			rs = prepStmt.executeQuery();
                        if(rs.next()){
			  occupation = rs.getString("occupation");
				  userName = rs.getString("fname");
                                 dob = rs.getString("dob");
                                 father =rs.getString("father");
                                 phone=rs.getString("phone");
                                 email=rs.getString("email");
                                 address=rs.getString("address");
                                                                      }
                        
		
                        
        %> 
<div class="container">
    
    <div class="visitingcard">
        <div class="content"><h2><%= userName %><br/><%= occupation %></h2><p><%= phone %>
                <br/><%= address %></p><p style="padding-left: 150px; padding-top: 30px;"><%= email %></p></div>
    <img src="img/BusinessTemplate.png">
    </div>
    
    </div>
    <div class="footer">
  &copy; Design Maker
</div>

</body>
</html>
