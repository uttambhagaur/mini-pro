<%@ page errorPage="error.jsp" %>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update data</title>
    </head>
    <body>
        
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/designmaker";//Here the "test" is the Database name
            FileInputStream fis = null;
            String fullName=request.getParameter("fullName");  
String dob=request.getParameter("dob");  
String Father=request.getParameter("Father");
String Mother=request.getParameter("Mother");  
String Gender=request.getParameter("Gender");  
String radios=request.getParameter("radios");  
String Address=request.getParameter("Address");
String Occupation=request.getParameter("Occupation");  
String high=request.getParameter("high");  
String inter=request.getParameter("inter");  
String graduation=request.getParameter("graduation");
String Skills=request.getParameter("Skills");  
String Experience=request.getParameter("Experience");  
String Phone=request.getParameter("Phone");  
String Email=request.getParameter("Email");
String Languages=request.getParameter("Languages");  
String Objective=request.getParameter("Objective");
 
          
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "");
                File image = new File("D:\\background.jpg");
                ps = conn.prepareStatement("insert into resume values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1,fullName);   
ps.setString(3,dob);  
ps.setString(4,Father);  
ps.setString(5,Mother);  
ps.setString(6,Gender);  
ps.setString(7,radios);  
ps.setString(8,Address);  
ps.setString(9,Occupation);  
ps.setString(10,high);  
ps.setString(11,inter);  
ps.setString(12,graduation);  
ps.setString(13,Skills);  
ps.setString(14,Experience);  
ps.setString(15,Phone);  
ps.setString(16,Email);  
ps.setString(17,Languages);  
ps.setString(18,Objective);   

                fis = new FileInputStream(image);
                ps.setBinaryStream(2, (InputStream) fis, (int) (image.length()));
 
                int count = ps.executeUpdate();
                if (count > 0) {
                    System.out.println("The data has been update successfully");
                } else {
                    System.out.println("The data did not update successfully");
                }
            
              
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (ps != null) {
                        ps.close();
                        ps = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                
            
 
        %>
    </body>
</html>