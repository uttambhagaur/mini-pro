<%@page import="java.io.OutputStream"%>
<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Design Maker|Resume 1</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }
    </script>
     <style type="text/css">
        * { margin: 0; padding: 0; }
        
        .clear { clear: both; }
        #page-wrap { width: 800px; margin: 40px auto 60px; }
        #pic { float: right; margin: -30px 0 0 0; width:200px; height:170px}
        h1 { margin: 0 0 16px 0; padding: 0 0 16px 0; font-size: 42px; font-weight: bold; letter-spacing: -2px; border-bottom: 1px solid #999; }
        h2 { font-size: 20px; margin: 0 0 6px 0; position: relative; }
        h2 span { position: absolute; bottom: 0; right: 0; font-style: italic; font-family: Georgia, Serif; font-size: 16px; color: #999; font-weight: normal; }
        p { margin: 0 0 16px 0; }
        
        #objective { width: 500px; float: left; }
        #objective p { font-family: Georgia, Serif; font-style: italic; color: #666; }
        dt { font-style: italic; font-weight: bold; font-size: 18px; text-align: right; padding: 0 26px 0 0; width: 150px; float: left; height: 100px; border-right: 1px solid #999;  }
        dd { width: 600px; float: right; }
        dd.clear { float: none; margin: 0; height: 15px; }
        
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

<div class="container" id="printablediv">
    <input type="submit" value="print" class="print" onclick="printDiv('printablediv')" />
    <div id="page-wrap" >

        <img src="http://localhost:8080/minipro-war/displayImage.jsp" alt="Login Required" id="pic" />

        <div id="contact-info" class="vcard">

            <!-- Microformats! -->

            <h1 class="fn">Name</h1>

            <p>
                Cell: <span class="tel">+91<%= phone%></span><br />
                Email: <a class="email" href="mailto:uttambhagaur@gmail.com">uttambhagaur@gmail.com</a>
            </p>
        </div>

        <div id="objective">
            <p>
                I am an outgoing and energetic (ask anybody) young professional, seeking a
                career that fits my professional skills, personality, and murderous tendencies.
                My squid-like head is a masterful problem solver and inspires fear in who gaze upon it.
                I can bring world domination to your organization.
            </p>
        </div>

        <div class="clear"></div>

        <dl>
            <dd class="clear"></dd>

            <dt>Education</dt>
            <dd>
                <h2>Withering Madness University - Planet Vhoorl</h2>
                <p><strong>Major:</strong> Public Relations<br />
                   <strong>Minor:</strong> Scale Tending</p>
            </dd>

            <dd class="clear"></dd>

            <dt>Skills</dt>
            <dd>
                                <p><%= skills %></p>

            </dd>

            <dd class="clear"></dd>

            <dt>Experience</dt>
            <dd>
                <h2>Doomsday Cult <span>Leader/Overlord - Baton Rogue, LA - 1926-2010</span></h2>
                <ul>
                    <li>Inspired and won highest peasant death competition among servants</li>
                    <li>Helped coordinate managers to grow cult following</li>
                    <li>Provided untimely deaths to all who opposed</li>
                </ul>

                <h2>The Watering Hole <span>Bartender/Server - Milwaukee, WI - 2009</span></h2>
                <ul>
                    <li>Worked on grass-roots promotional campaigns</li>
                    <li>Reduced theft and property damage percentages</li>
                    <li>Janitorial work, Laundry</li>
                </ul>
            </dd>

            <dd class="clear"></dd>

            <dt>Hobbies</dt>
            <dd>World Domination, Deep Sea Diving, Murder Most Foul</dd>

            <dd class="clear"></dd>

            <dt>References</dt>
            <dd>Available on request</dd>

            <dd class="clear"></dd>
        </dl>

        <div class="clear"></div>

    </div>
    
</div>
     <div class="footer">
  &copy; Design Maker
</div>
</body>

</html>
