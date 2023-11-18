<%-- 
    Document   : UpdateProduct
    Created on : Jul 6, 2023, 12:18:15 AM
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
        <h1>Update product</h1>
        <form action="UpdateProduct" method="POST">
            Product id <input type="text" name="id" value="${pro.product_id}" readonly=""><br>
            Product name <input type="text" name="name" value="${pro.product_name}"><br>
            Category 
            <select name="category">
                <option value="1" ${pro.category.cid=="1"?"selected":""}>Laptop</option>
                <option value="2" ${pro.category.cid=="2"?"selected":""}>Smartphone</option>
                <option value="3" ${pro.category.cid=="3"?"selected":""}>Tablet</option>
            </select><br>
            Price <input type="text" name="price" value="${pro.price}"><br>
            Image <input type="text" name="image" value="${pro.image}"><br>
            <!--Description <input type="text" name="description" value="${pro.description}"><br>-->
            Description <textarea name="description" id="textdescription">${pro.description}</textarea><br>
            Quantity <input type="number" name="quantity" value="${pro.quantity}"><br>
            <button type="submit">Update</button>
        </form>
        <script>
            CKEDITOR.replace("textdescription");
        </script>
    </body>
</html>
