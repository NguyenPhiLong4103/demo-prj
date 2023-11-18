<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : OrderDetail
    Created on : Jul 8, 2023, 1:12:09 PM
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
        <a href="ManageOrder">Back</a>
        <h1>Manage order</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Order Id</th>
                    <th>Product Id</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${ordDetail}">
                    <tr>
                        <td>${p.id}</td> 
                        <td>${p.order_id}</td> 
                        <td>${p.product_id}</td> 
                        <td>${p.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
