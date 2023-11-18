<%-- 
    Document   : UpdateOrder
    Created on : Jul 8, 2023, 11:27:47 AM
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
        <h1>Update order</h1>
        <form action="UpdateOrder" method="POST">
            Order id * <input type="text" name="oid" value="${ord.order_id}" readonly=""><br>
            User Id * <input type="number" name="uid" value="${ord.user_id}" readonly=""><br>
            Order date * <input type="date" name="odate" value="${ord.order_date}" readonly=""><br>
            Total * <input type="text" name="total" value="${ord.total}" readonly=""><br>
            Status 
            <select name="status">
                <option value="pending" ${ord.status=="pending"?"selected":""}>pending</option>
                <option value="shipping" ${ord.status=="shipping"?"selected":""}>shipping</option>
                <option value="received" ${ord.status=="received"?"selected":""}>received</option>
                <option value="canceled" ${ord.status=="canceled"?"selected":""}>canceled</option>
            </select><br>
            <button type="submit">Update</button>
        </form>
    </body>
</html>
