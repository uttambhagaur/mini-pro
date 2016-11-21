<%-- 
    Document   : displayImage
    Created on : Nov 21, 2016, 7:21:46 PM
    Author     : Coder
--%>
 <%@ page import="java.sql.*"%>
 <%@page errorPage="error.jsp" %>
<%@ page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;
PreparedStatement prepStmt = null;

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designmaker","root","");
			String sqlStmt = "SELECT photo FROM resume,user_details where userid=?";

prepStmt = con.prepareStatement(sqlStmt);
                        String id=(String)session.getAttribute("userID");
                        prepStmt.setString(1, id);
			rs = prepStmt.executeQuery();
if (rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}

// display the image

response.setContentType("image/jpg");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

rs.close();

stmt.close();

con.close();


%>
    </body>
</html>
