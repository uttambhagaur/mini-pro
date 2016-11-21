<%@page import="java.io.OutputStream"%>
<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Student Id Cards</title>
  <link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">

  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="idcss.css">
      <style>
          .save{
              text-align: center;
              padding: 5px;
              position: absolute;
              right: 50px;
              top: 70px;
              border: 0px;
          }
      </style>
  
</head>

<body>
    <jsp:include page="header.jsp"/>
    
    <%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
                String userName="Full Name";
                String occupation="Ocupation",dob="DD/MM/YY",father="father",phone="Mobile";
                
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
                                 
                                 
                                                                      }
                        
		
                        
        %> 
        <input type="button" class="btn btn-success save" value="SAVE">
  <div class="wrapper">
  &nbsp;
  <div class="id-card rounded">
    <div class="avatar-wrap float-left">
      <img class="round" src="http://localhost:8080/minipro-war/displayImage.jsp" alt="Plese login to view image" />
    </div>
    <div class="bio-wrap float-left">
        <h2><%= userName %></h2>
        <h4><%= occupation%></h4>
        <p><%= dob %></p>
        <p><%= father %></p>
      <p>Course (Branch)</p>
      <p><%= phone %></p>
      <p id="period">Period of Validity</br>
       &nbsp; 20__-2___</p>
    </div>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <div class="footer">
  &copy; Design Maker
</div>
</body>
</html>
