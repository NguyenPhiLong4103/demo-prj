<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
    Document   : AddNewProduct
    Created on : Jul 5, 2023, 6:47:38 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.21.0/ckeditor.js" integrity="sha512-ff67djVavIxfsnP13CZtuHqf7VyX62ZAObYle+JlObWZvS4/VQkNVaFBOO6eyx2cum8WtiZ0pqyxLCQKC7bjcg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body>
        <h1>Add new product</h1>
        <form action="AddNewProduct" method="POST">
            Product name <input type="text" name="name"><br>
            Category 
            <select name="category">
                <option value="1">Laptop</option>
                <option value="2">Smartphone</option>
                <option value="3">Tablet</option>
            </select>
            Price <input type="text" name="price"><br>
            Image <input type="text" name="image"><br>
            Description <textarea name="description" id="textdescription" ></textarea><br>
            Quantity <input type="number" name="quantity"><br>
            <button type="submit">Add new</button>
        </form>
        <script>
            CKEDITOR.replace("textdescription");
        </script>
    </body>
</html>
