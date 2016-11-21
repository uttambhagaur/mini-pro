<%@page import="java.io.OutputStream"%>
<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Resume 2</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
	
	<style type="text/css" media="all">
		
		.resume {
			background-color:#FFF;
			font-family:Arial, Helvetica, sans-serif;
			padding:2em;
			margin:1em auto;
			border:2px solid #000;
			max-width: 50em;
			}
		#address{
			float:right;
			padding-top:2.5em;
			}
		#contact{
			text-align:right;
			}
		.date {
			float:left;
			font-size:1em;
			margin:0 0 0 -16em;
			text-align:right;
			}
		abbr, acronym{
			border-bottom:1px dotted #333;
			cursor:help;
			}	
		address{
			font-style:italic;
			color:#333;
			font-size:.9em;
			}
		.content{
			width:32em;
			margin:0 0 0 16em;
			}	
		.section{
			margin: 0;
			padding:1em 0;
			}
		ul{
			padding-left:.5em;
			margin-left:.5em;
			}
		h1{
			margin:0 0 .1em 0;
			padding:1em 0 0 0;
			font-size:1.75em;
			border-bottom:3px double #000;
			}
		h2 {
			font-size:1.3em;
			font-variant: small-caps;
			letter-spacing: .06em;
			border-bottom:1px solid #000;
			}
		.section h3 {
			font-size:1em;
			font-variant: small-caps;
			margin-bottom:0;
			width:14em;
			}
	</style>
	<style type="text/css" media="print">
            .footer {
                position: relative;
            }
	</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<%! Connection conn = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
                String userName=null;
                String occupation="Occupation",skills="Skills",dob="DD/MM/YY",father="father",phone="Mobile";
                
        %>
        <% 
        Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost:3306/designmaker";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			String sqlStmt = "SELECT * FROM resume";
			prepStmt = conn.prepareStatement(sqlStmt);
                        
			rs = prepStmt.executeQuery();
                        if(rs.next()){
			  occupation = rs.getString("occupation");
				  userName = rs.getString("fname");
                                 dob = rs.getString("dob");
                                 father =rs.getString("father");
                                 phone=rs.getString("phone");
                                 skills=rs.getString("skills");
                                 
                                                                      }
                        else
                        {   response.sendRedirect("login.jsp");   }
		
                        
        %> 
        <div class="resume">
    <div id="address">335 Name Street, Unit #, Town, Province, N2H 3Y6</div>
	<h1>First Last</h1>
	<div id="contact">3A, Your Major, <abbr title="University of Waterloo">UW</abbr>, 1-519-500-8252, <a href="mailto:YOUREMAILADDRESS@uwaterloo.ca">emailaddress@uwaterloo.ca</a></div>
	
	<div class="section">
		<h2>Summary of Qualifications</h2>
			<ul>
				<li>Bullet one Bullet one</li>
				<li>Bullet two Bullet two</li>
				<li>Bullet three Bullet three</li>
				<li>Bullet four Bullet four</li>
				<li>Bullet five Bullet Five</li>
			</ul>
	</div>
	
	<div class="section">
		<h2>Work Experience</h2>
		<div class="content">
			<span class="date">Start &raquo; End Year</span>
			<h3>Job Title One</h3>
			<address>Company Name, Address, City Province</address>
			<ul>
				<li>Bullet one Bullet one</li>
				<li>Bullet two Bullet two</li>
				<li>Bullet three Bullet three</li>
				<li>Bullet four Bullet four</li>
			</ul>
			
			<span class="date">Start &raquo; End Year</span>
			<h3>Job Title Two</h3>
			<address>Company Name, Address, City Province</address>
			<ul>
				<li>Bullet one Bullet one</li>
				<li>Bullet two Bullet two</li>
				<li>Bullet three Bullet three</li>
				<li>Bullet four Bullet four</li>
			</ul>
			
			<span class="date">Start &raquo; End Year</span>
			<h3>Job Title Three</h3>
			<address>Company Name, Address, City Province</address>
		</div>
	</div>
	
	<div class="section">
		<h2>Volunteer Experience</h2>
		<div class="content">
			<span class="date">Start &raquo; End Year</span>
			<h3>Volunteer Job Title</h3>
			<address>Company Name, Address, City Province</address>
			<ul>
				<li>Bullet one Bullet one</li>
				<li>Bullet two Bullet two</li>
				<li>Bullet three Bullet three</li>
			</ul>
		</div>
	</div>
	
	<div class="section">
		<h2>Education</h2>
			<ul>
				<li>Candidate for Bachelor of Major, University, Province,  StartYear - Present</li>
				<li>OSSD, Highschool, Town, Province, StartYear-EndYear</li>
			</ul>
	</div>
	
	<div class="section">
		<h2>Academic Awards</h2>
			<ul>
				<li>Year, Year, Name of award/Scholarship</li>
			</ul>
	</div>
        </div>
     <div class="footer">
  &copy; Design Maker
</div>
	
</body>
</html>

