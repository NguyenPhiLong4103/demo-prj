<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Cart
    Created on : Jun 29, 2023, 6:13:30 PM
    Author     : nguye
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page = "Header.jsp"></jsp:include>
            <!-- /HEADER -->

            <!-- NAVIGATION -->
            <nav id="navigation">
                <!-- container -->
                <div class="container">
                    <!-- responsive-nav -->
                    <div id="responsive-nav">
                        <!-- NAV -->
                        <ul class="main-nav nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Hot Deals</a></li>
                            <li><a href="#">Categories</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                        <!-- /NAV -->
                    </div>
                    <!-- /responsive-nav -->
                </div>
                <!-- /container -->
            </nav>
            <!-- /NAVIGATION -->

            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Your cart</h3>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /BREADCRUMB -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <div class="col-md-6">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Delivery Information</h3>
                                </div>
                                <form method="post" action="profile">
                                    <div class="form-group">
                                        <label for="name">User Id</label>
                                        <input type="text" class="form-control" name="uid" value="${sessionScope.user.user_id}" readonly="">
                                </div>
                                <div class="form-group">
                                    First name
                                    <input type="text" class="form-control" name="fname" value="${sessionScope.user.first_name}" readonly="">
                                </div>
                                <div class="form-group">
                                    Last name
                                    <input type="text" class="form-control" name="lname" value="${sessionScope.user.last_name}" readonly="">
                                </div>
                                <div class="form-group">
                                    Email
                                    <input type="email" class="form-control" name="email" value="${sessionScope.user.email}" readonly="">
                                </div>
                                <div class="form-group">
                                    Phone
                                    <input type="tel" class="form-control" name="phone" value="${sessionScope.user.phone}" readonly="">
                                </div>
                                <div class="form-group">
                                    Address
                                    <input type="text" class="form-control" name="address" value="${sessionScope.user.address}" readonly="">
                                </div>

                            </form>
                        </div>
                        <!-- /Billing Details -->
                    </div>

                    <!-- Order Details -->
                    <div class="col-md-6 order-details">
                        <h3 class="title" style="text-align: center">Your Order</h3>
                        <div class="order-summary">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th style="padding: 0 10px 0 10px">Name</th>
                                        <th style="padding: 0 10px 0 10px">-</th>
                                        <th style="padding: 0 10px 0 10px">Quantity</th>
                                        <th style="padding: 0 10px 0 10px">+</th>
                                        <th style="padding: 0 10px 0 10px">Price</th>
                                        <th style="padding: 0 10px 0 10px">Total</th>
                                        <th style="padding: 0 10px 0 10px">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="c" items="${sessionScope.cart.items}">
                                        <tr>
                                            <td>${c.product.product_name}</td>
                                            <td style="text-align: center"><a href="ChangeQuantityCartItem?quantity=${c.quantity-1}&pid=${c.product.product_id}">-</a></td>
                                            <td style="text-align: center">${c.quantity}</td>
                                            <td style="text-align: center"><a href="ChangeQuantityCartItem?quantity=${c.quantity+1}&pid=${c.product.product_id}">+</a></td>
                                            <td style="text-align: center">${c.product.price}</td>
                                            <td style="text-align: center">${Math.round((c.product.price * c.quantity) * 100) / 100}</td>
                                            <td style="text-align: center"><a href="DeleteCartItem?pid=${c.product.product_id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="order-col">
                                <div>Shiping</div>
                                <div><strong>FREE</strong></div>
                            </div>

                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total">$ ${sessionScope.cart.getTotalMoney()}</strong></div>
                            </div>
                        </div>
                        <a href="./Checkout" class="primary-btn order-submit">Check out</a>
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <jsp:include page = "Footer.jsp"></jsp:include>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

