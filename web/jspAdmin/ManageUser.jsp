<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ManageUser
    Created on : Jul 6, 2023, 3:57:44 PM
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
        <a href="manager">Back</a>
        <h1>Manage User</h1>
        <form method="get" action="ManageUser">
            Search <input value="${param.search}" name="search" placeholder="Search here">
            <button type="submit">Search</button>
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>User Id</th>
                    <th>User name</th>
                    <th>Password</th>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Address</th>
                    <th>isActive</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${vectorUser}">
                    <tr>
                        <td>${p.user_id}</td> 
                        <td>${p.username}</td> 
                        <td>${p.password}</td> 
                        <td>${p.first_name}</td> 
                        <td>${p.last_name}</td> 
                        <td>${p.email}</td> 
                        <td>${p.phone}</td> 
                        <td>${p.role}</td> 
                        <td>${p.address}</td>
                        <td>${p.isActive}</td>
                        <td><a href="UpdateUser?uid=${p.user_id}">Update</a></td> 
                        <td>
                            <c:if test="${p.role != 'admin'}">
                                <a href="UpdateUser?uid=${p.user_id}">Delete</a>
                            </c:if>
                        </td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
