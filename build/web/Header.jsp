<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Header
    Created on : Jun 22, 2023, 2:22:22 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i>0383883590</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> longnphe170854@fpt.edu.vn</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> Thach That, Hoa Lac</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:if test="${user != null}"> <!-- đã đăng nhập -->
                    <c:if test="${user.role == 'admin'}">
                        <li><a href="manager"><i class="fa fa-user-o"></i>Manager</a></li>
                        </c:if>
                    <li><a href="profile?uid=${user.user_id}"><i class="fa fa-user-o"></i>Welcome, ${user.username}!</a></li>
                    <li><a href="logout"><i class="fa fa-user-o"></i>Logout</a></li>
                    </c:if>
                    <c:if test="${user == null}">  <!-- chưa đăng nhập -->
                    <li><a href="login"><i class="fa fa-user-o"></i>Login/Sign up</a></li>
                    </c:if>

            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="./home" class="logo">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form method="get" action="search">
                            <input value="${param.txt}" name="txt" class="input" placeholder="Search here" style="border-radius: 30px; width: 50%">
                            <select class="input-select" name="sortType" style="border-radius: 30px">
                                <option value="product_id">None</option>
                                <option value="name asc">Sort by name asc</option>                                            
                                <option value="price asc">Price low to high</option>
                                <option value="price desc">Price high to low</option>
                            </select>
                            <button type="submit" class="search-btn" style="border-radius: 30px;">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="view-order">
                                <i class="fa fa-heart-o"></i>
                                <span>Your order</span>

                            </a>
                        </div>
                        <!-- /Wishlist -->
                        <div>
                            <a href="view-cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                            </a>
                        </div>

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
