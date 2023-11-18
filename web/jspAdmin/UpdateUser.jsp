<%-- 
    Document   : UpdateUser
    Created on : Jul 6, 2023, 5:40:48 PM
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
        <h1>Update user</h1>
        <form action="UpdateUser" method="post">
            User id <input type="text" name="uid" value="${user.user_id}" readonly=""><br>
            User name <input type="text" name="uname" value="${user.username}" readonly=""><br>
            Password <input type="text" name="id" value="${user.password}" readonly=""><br>
            First name <input type="text" name="id" value="${user.first_name}" readonly=""><br>
            Last name <input type="text" name="id" value="${user.last_name}" readonly=""><br>
            Email <input type="text" name="id" value="${user.email}" readonly=""><br>
            Phone <input type="text" name="id" value="${user.phone}" readonly=""><br>
            Role 
            <select name="role">
                <option value="admin" ${user.role=="admin"?"selected":""}>admin</option>
                <option value="user" ${user.role=="user"?"selected":""}>user</option>
            </select><br>
            Address <input type="text" name="id" value="${user.address}" readonly=""><br>
            Is active
            <select name="isActive">
                <option value="1" ${user.user_id=="1"?"selected":""}>true</option>
                <option value="0" ${user.user_id=="0"?"selected":""}>false</option>
            </select><br>
            <button type="submit">Update</button>
        </form>

    </body>
</html>
