<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Design Maker| Edit profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css">
    <!-- Custom CSS -->
    <style>
        .navbar{
            margin-top: 0px;
        }
        .footer{
            margin-bottom: 0px;
            position: relative;
            height: 70px;
        }
    .othertop{margin-top:10px;}
    </style>

</head>
<body>
    <jsp:include page="header.jsp"/>
    <% if((String)session.getAttribute("userID")==null){
        response.sendRedirect("login.jsp");
        }         
        %>
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
                    
        %> 
       <div class="container">
<div class="row">
<div class="col-md-10 ">
    <form action="update.jsp" method="post" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Edit profile</legend>

<!-- Text input-->




<div class="form-group">
  <label class="col-md-4 control-label" for="Name (Full name)">Name (Full name)</label>  
  <div class="col-md-4">
 <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-user">
        </i>
       </div>
       <input id="Name Full name" name="fullName" type="text" placeholder="Name (Full name)" class="form-control input-md">
      </div>

    
  </div>

  
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="Upload photo">Upload photo</label>
  <div class="col-md-4">
    <input id="Upload photo" name="photo" class="input-file" type="file">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Date Of Birth">Date Of Birth</label>  
  <div class="col-md-4">

  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-birthday-cake"></i>
        
       </div>
       <input id="Date Of Birth" name="dob" type="text" placeholder="Date Of Birth" class="form-control input-md">
      </div>
  
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Father">Father's name</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
      <i class="fa fa-male" style="font-size: 20px;"></i>
        
       </div>
      <input id="Father" name="Father" type="text" placeholder="Father's name" class="form-control input-md">

      </div>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Mother">Mother's Name</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
      <i class="fa fa-female" style="font-size: 20px;"></i>
        
       </div>
  <input id="Mother" name="Mother" type="text" placeholder="Mother's Name" class="form-control input-md">

      </div>
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="Gender">Gender</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="Gender-0">
      <input type="radio" name="Gender" id="Gender-0" value="M" checked="checked">
      Male
    </label> 
    <label class="radio-inline" for="Gender-1">
      <input type="radio" name="Gender" id="Gender-1" value="F">
      Female
    </label> 
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="radios">Marital Status:</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="radios-0">
      <input type="radio" name="radios" id="radios-0" value="1" checked="checked">
      Married
    </label> 
    <label class="radio-inline" for="radios-1">
      <input type="radio" name="radios" id="radios-1" value="2">
      Unmarried
    </label>
  </div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label col-xs-12" for="Permanent Address">Permanent Address</label>  
  <div class="col-md-2  col-xs-4">
  <input id="Permanent Address" name="Address" type="text" placeholder="District" class="form-control input-md ">
  </div>

  <div class="col-md-2 col-xs-4">

  <input id="Permanent Address" name="Address" type="text" placeholder="Area" class="form-control input-md ">
  </div>

  
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="Permanent Address"></label>  
  <div class="col-md-2  col-xs-4">
  <input id="Permanent Address" name="Address" type="text" placeholder="Street" class="form-control input-md ">
  
  </div>

  

  
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Primary Occupation">Occupation</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-briefcase"></i>
        
       </div>
      <input id="Primary Occupation" name="Occupation" type="text" placeholder="Primary Occupation" class="form-control input-md">
      </div>
  
    
  </div>
</div>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Skills">10th Class</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-graduation-cap"></i>
        
       </div>
     <input id="Skills" name="high" type="text" placeholder="School" class="form-control input-md">
      </div>
 
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Skills">12th Class</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-graduation-cap"></i>
        
       </div>
     <input id="Skills" name="inter" type="text" placeholder="School" class="form-control input-md">
      </div>
 
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Skills">Graduation</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-graduation-cap"></i>
        
       </div>
     <input id="Skills" name="graduation" type="text" placeholder="College" class="form-control input-md">
      </div>
 
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Skills">Skills</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-graduation-cap"></i>
        
       </div>
     <input id="Skills" name="Skills" type="text" placeholder="Skills" class="form-control input-md">
      </div>
 
    
  </div>
</div>
<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="radios">Experience</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="radios-0">
      <input type="radio" name="Experience" id="radios-0" value="1" checked="checked">
      Fresher
    </label> <br/>
    <label class="radio-inline" for="radios-1">
      <input type="radio" name="Experience" id="radios-1" value="2">
      1-2 years
    </label><br/>
  <label class="radio-inline" for="radios-1">
      <input type="radio" name="Experience" id="radios-1" value="2">
      3-5 years
    </label><br/>
  <label class="radio-inline" for="radios-1">
      <input type="radio" name="Experience" id="radios-1" value="2">
      5+ years
    </label>
  </div>
</div>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Phone number ">Phone number </label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-phone"></i>
        
       </div>
    <input id="Phone number " name="Phone" type="text" placeholder="Phone number " class="form-control input-md">
    
      </div>
        
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Email Address">Email Address</label>  
  <div class="col-md-4">
  <div class="input-group">
       <div class="input-group-addon">
     <i class="fa fa-envelope-o"></i>
        
       </div>
    <input id="Email Address" name="Email" type="text" placeholder="Email Address" class="form-control input-md">
    
      </div>
  
  </div>
</div>


<!-- Multiple Checkboxes -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Languages Known">Languages Known</label>
  <div class="col-md-4">
  <div class="checkbox">
    <label for="Languages Known-0">
      <input type="checkbox" name="Languages" id="Languages Known-0" value="1">
      Nepali
    </label>
    </div>
  <div class="checkbox">
    <label for="Languages Known-1">
      <input type="checkbox" name="Languages" id="Languages Known-1" value="2">
      Newari
    </label>
    </div>
  <div class="checkbox">
    <label for="Languages Known-2">
      <input type="checkbox" name="Languages" id="Languages Known-2" value="3">
      English
    </label>
    </div>
  <div class="checkbox">
    <label for="Languages Known-3">
      <input type="checkbox" name="Languages" id="Languages Known-3" value="4">
      Hindi
    </label>
    </div>

    
  </div>
</div>


<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Overview (max 200 words)">Objective (max 200 words)</label>
  <div class="col-md-4">                     
    <textarea class="form-control" rows="10"  id="Overview max 200 words" name="Objective">Overview</textarea>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" ></label>  
  <div class="col-md-4">
      <input type="submit" class="btn btn-success" value="Update">
    
  </div>
</div>

</fieldset>
</form>
</div>
<div class="col-md-2 hidden-xs">
<img src="http://websamplenow.com/30/userprofile/images/avatar.jpg" class="img-responsive img-thumbnail ">
  </div>


</div>
   </div>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

<div class="footer">
  &copy; Design Maker
</div>
</body>
</html>
