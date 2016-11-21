<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Design Maker| Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<style type="text/css">
</style>
<script>
    function loginval(){
        var userid = document.forms["login"]["login_email"].value;
        var userpass= document.forms["login"]["login_pass"].value;
        if(userid===null || userid===""){
            document.getElementById("email").value="can not empty";
            return false;
        }
        if(userpass<6){
            document.getElementById("pass").innerHTML = "Password must be 6 char";
            return false;
        }
        return true;
    }
    function siginval(){
        var fname = document.forms["signup"]["fname"].value;
        var lname= document.forms["signup"]["lname"].value;
        var email = document.forms["signup"]["email"].value;
        var userpass= document.forms["signup"]["userpass"].value;
        var confpass= document.forms["signup"]["confpass"].value;
        if(fname===null || fname==="" || lname===null || lname===""){
            document.getElementById("err").innerHTML="Name can not empty";
            return false;
        }
        if(email==="" || email===null){
            document.getElementById("err").innerHTML="email can not empty";
            return false;
        }
        if(userpass<6){
            document.getElementById("err").innerHTML = "Password must be 6 char";
            return false;
        }
        if(userpass!==confpass){
            document.getElementById("err").innerHTML = "Password does not match";
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    
    <form action="user.jsp" name="login" method="post" class="login" onsubmit="return loginval();">
      <label>Login here</label>
        <input type="text" id="email" name="login_email" placeholder="User-Id"><br/>
        <input type="password" name="login_pass" placeholder="Password"><br/>
       
<input type="submit" class="btn" value="Login"><br/>
<p style="color:red; padding-left: 50px;" id="pass"></p>
  </form>
    <div class="signupbox">
        
        <form action="signup.jsp" name="signup" method="post" onsubmit="return siginval()" class="signup">
            <label>Create new Account</label>
<input type="text" name="fname" placeholder="First Name"><br/>
<input type="text" name="lname" placeholder="Last Name"><br/>
<input type="email" name="email" placeholder="Email ID"><br/>
<input type="text" name="userid" placeholder="User Name"><br/>
<input type="password" name="userpass" placeholder="Password"><br/>
<input type="password" name="confpass" placeholder="Confirm Password"><br/>
<input type="radio" name="gender" value="M" checked>Male<input value="F" type="radio" name="gender">Female<br/>
<input type="submit" class="btn" value="SignUp"><br/>
<p style="color:red; padding-left: 50px;" id="err"></p>
  </form>
    </div>
</div>
<div class="footer">
  &copy; Design Maker
</div>
</body>
</html>
