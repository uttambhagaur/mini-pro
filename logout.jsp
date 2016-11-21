
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title
        
    </head>
    <body onload="Redirect()">
       
       
        <% session.removeAttribute("userID");              %>
        <jsp:include page="index.jsp"/>
    </body>
</html>
