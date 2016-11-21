<div class="navbar">
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="resume.jsp">Resume</a></li>
<li><a href="business.jsp">Business Card</a></li>
<li><a href="studentid1.jsp">University Card</a></li>
<% if(session.getAttribute("userID")!=null){ %>
<li style="float:right; font-size:20px;"><a href="user.jsp"><i class="fa fa-user"></i> (<% out.print(session.getAttribute("userID"));%>)</a>
      <a href="logout.jsp"> Logout</a></li><li style="float:right; font-size:20px;"><a href="edit.jsp">Edit</a></li>
    <% } else { %>
<li style="float:right; font-size:20px;"><a href="login.jsp"><i class="fa fa-user"></i> Login</a></li>
<% } %>

</ul>
</div>
