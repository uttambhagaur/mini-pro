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
    .photoupload{
        float:right;
    }
    .photoupload img{
        width: 150px;
        height: 150px;
        border-radius: 50%;
    }
    .mover{
        position: relative;
        
    }
    .editprofile{
        margin-left: 10%;
    }
    input{
        margin-left: 15%;
        padding: 5px;
    }
    textArea{
        margin-left: 15%;
        padding: 5px;
    }
</style>

</head>
<body>
    <jsp:include page="header.jsp"/>
    <% if((String)session.getAttribute("userID")==null){
        response.sendRedirect("login.jsp");
        }         
        %>
<div class="container">
   <%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
              String voterName=null,id=null,pno=null,email=null,gender=null,address=null,dob=null;
        %>
        <% if(request.getParameter("userID")!=null){
        Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost:3306/designmaker";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			String sqlStmt = "SELECT * FROM user_details,resume where userid='userID'";
			prepStmt = conn.prepareStatement(sqlStmt);
                        String ID= request.getParameter("userID");
                        prepStmt.setString(1, ID);
			rs = prepStmt.executeQuery();
                        if(rs.next()){
			  
                                 id = rs.getString("Id");
                                 voterName = rs.getString("Name");
                                 email= rs.getString("email");
                                 gender=rs.getString("gender");
                                 address=rs.getString("address");
                                 
                                 pno=rs.getString("pno");
                                     }
                        else
                        {   response.sendRedirect("CheckVote.jsp");   }
                        
        }
                    else {
                        out.println("Please enter correct Voter Id");
                    }
        %> 
        <div class="editprofile">
            <form action="update.jsp" method="post" name="profile">
                <label>Update Your Details</label>
                <h2>Personal details</h2>
                <input type="text" name="fullname" placeholder="Full Name"><br/>
                <div class="photoupload">
                    <img src="img/resume.jpg"><input type="file" class="mover" name="photo"></div>
                <input type="email" name="email" placeholder="Email ID"><br/>
                <input type="text" name="dob" placeholder="DOB"><br/>
                <input type="text" name="phone" placeholder="Phone Number"><br/>
                <input type="text" name="marital" placeholder="Marital Status"><br/>
                <h2>Career objective </h2>
                <textarea rows="3" name="caree" placeholder="Career objective"></textarea><br/>
                <h2>Education </h2>
                <input type="submit" class="btn" value="update">
            </form>  
        </div>
</div>
<div class="footer">
  &copy; Design Maker
</div>
</body>
</html>
