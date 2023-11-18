<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : store
    Created on : Jun 22, 2023, 3:03:26 PM
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

            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="breadcrumb-tree">
                                <li><a href="./home">Home</a></li>
                                <li><a href="./store">All Categories</a></li>
                                <li><a href="./store-list?cid="></a></li>
                            </ul>
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
                        <!-- ASIDE -->
                        <div id="aside" class="col-md-3">
                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Categories</h3>
                                <ul class="section-tab-nav tab-nav">
                                    <li class="${tag == null? "active" : ""}"><a href="./store">All</a></li><br>
                                    <c:forEach var="c" items="${vectorCategory}">
                                        <li class="${tag == c.cid? "active" : ""}"><a href="store-list?cid=${c.cid}">${c.cname}</a></li><br>
                                    </c:forEach>
                                   
                                </ul>
                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Price</h3>
                                <div class="price-filter">
                                    <div id="price-slider"></div>
                                    <div class="input-number price-min">
                                        <input id="price-min" type="number">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" type="number">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                            </div>
                            <!-- /aside Widget -->
                        </div>
                        <!-- /ASIDE -->

                        <!-- STORE -->
                        <div id="store" class="col-md-9">

                            <!-- store products -->
                            <div class="row">
                            <c:forEach var="p" items="${product}">
                                <!-- product -->
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="${p.image}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="productdetail?pid=${p.product_id}">${p.product_name}</a></h3>
                                            <h4 class="product-price">$ ${p.price}</h4>
                                        </div>
                                        <a class="add-to-cart" href="add-cart?quantity=1&pid=${p.product_id}">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </a>
                                    </div>
                                </div>
                                <!-- /product -->
                                <div class="clearfix visible-sm visible-xs"></div>
                            </c:forEach>
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <nav aria-label="Page navigation example" style="margin-bottom: 20px;">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <c:forEach var="a"  begin="1" end="${numberPage}">
                                <li class="page-item"><a class="page-link" href="search?index=${a}&txt=${param.txt}&sortType=${param.sortType}">${a}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
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

