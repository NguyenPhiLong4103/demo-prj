<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ManageOrder
    Created on : Jul 8, 2023, 11:14:40 AM
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
        <h1>Manage order</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Order Id</th>
                    <th>User Id</th>
                    <th>Order date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Update</th>
                    <th>View Detail</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${vectorOrder}">
                    <tr>
                        <td>${p.order_id}</td> 
                        <td>${p.user_id}</td> 
                        <td>${p.order_date}</td> 
                        <td>${p.total}</td>
                        <td>${p.status}</td> 
                        <td><a href="UpdateOrder?oid=${p.order_id}">Update</a></td>
                        <td><a href="ViewOrderDetail?oid=${p.order_id}">View Detail</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
