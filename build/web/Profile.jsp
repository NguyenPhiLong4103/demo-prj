<%-- 
    Document   : UserProfile
    Created on : Jul 1, 2023, 11:17:23 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Electro - HTML Ecommerce Template</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <h1>User Profile</h1>
                    <hr>
                    <form method="post" action="profile">
                        <div class="form-group">
                            <label for="name">User Id</label>
                            <input type="text" class="form-control" name="uid" value="${u.user_id}" readonly="">
                        </div>
                        <div class="form-group">
                            <label for="name">First name</label>
                            <input type="text" class="form-control" name="fname" value="${u.first_name}">
                        </div>
                        <div class="form-group">
                            <label for="name">Last name</label>
                            <input type="text" class="form-control" name="lname" value="${u.last_name}">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" value="${u.email}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" class="form-control" name="phone" value="${u.phone}">
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="address" value="${u.address}">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="text" class="form-control" name="password" value="${u.password}">
                        </div>

                        <div class="button-group">
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                            <a href="home" style="color: #fff; background-color: green; border-color: #2e6da4;" class="btn btn-secondary">Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
