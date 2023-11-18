<%-- 
    Document   : Manager
    Created on : Jul 5, 2023, 6:06:17 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello, admin ${sessionScope.user.username}</h1>
        <a href="ManageProduct">Manage product</a><br>
        <a href="ManageUser">Manage user</a><br>
        <a href="ManageOrder">Manage order</a>
    </body>
</html>
