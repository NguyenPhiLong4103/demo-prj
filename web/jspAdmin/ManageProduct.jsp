<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ManageProduct
    Created on : Jul 5, 2023, 3:07:14 PM
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
        <h1>Manage product</h1>
        <form method="get" action="ManageProduct">
            Search <input value="${param.search}" name="search" placeholder="Search here">
            Category 
            <select name="category">
                <option value="">All</option>
                <option value="=1">Laptop</option>
                <option value="=2">Smartphone</option>
                <option value="=3">Tablet</option>
            </select>
            Sort 
            <select name="sortType">
                <option value="product_id">Sort by product_id</option>
                <option value="product_name asc">Sort by name asc</option>                                            
                <option value="price asc">Price low to high</option>
                <option value="price desc">Price high to low</option>
            </select>
            <button type="submit">Search</button>
        </form>
            
        <a href="AddNewProduct">Add new product</a>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Product Id</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${vectorProduct}">
                    <tr>
                        <td>${p.product_id}</td> 
                        <td>${p.product_name}</td> 
                        <td>${p.price}</td> 
                        <td>${p.image}</td>
                        <td>${p.description}</td> 
                        <td>${p.category.cname}</td> 
                        <td>${p.quantity}</td> 
                        <td><a href="UpdateProduct?pid=${p.product_id}">Update</a></td> 
                        <td><a href="DeleteProduct?pid=${p.product_id}">Delete</a></td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>

</html>
