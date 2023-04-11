<%-- 
    Document   : listproducts
    Created on : Mar 12, 2023, 3:23:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to AQ</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">
    </head>
    <body>
        <c:set var="size" value="${requestScope.size}"/>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
            <!-- Container wrapper -->
            <div class="container">
                <!-- Toggle button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent1">
                    <!-- Navbar brand -->
                    <a class="navbar-brand mt-2 mt-sm-0" href="home">
                        <img src="images/logo-no-background.png" height="30" alt="AQ Logo" loading="lazy" />
                    </a>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link " href="home">Home</a>
                        </li>

                        <c:if test="${(sessionScope.acc == null)}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Feedback</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About Me</a>
                            </li>
                        </c:if>

                        <c:if test="${(sessionScope.acc != null) && ((sessionScope.acc.isSell==0)&&(sessionScope.acc.isAdmin==0))}">
                            <li class="nav-item">
                                <a class="nav-link" href="order">Purchase History</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Manage Products</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="listitems" target="_blank">Manage All Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" target="_blank" href="listaccount">Manage Accounts</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#" 
                                   style="color:rgb(77,123,179); font-weight: 500;">
                                    Welcome back, ${sessionScope.acc.username} <i class="fa-regular fa-heart"></i>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center infor">
                    <!-- Icon -->
                    <c:if test="${sessionScope.acc != null}">
                        <a class="nav-link me-3" href="showcart">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge rounded-pill badge-notification bg-danger">${size}</span>
                        </a>
                    </c:if>

                    <c:if test="${sessionScope.acc == null}">
                        <a class="nav-link me-3" href="login.jsp">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge rounded-pill badge-notification bg-danger"></span>
                        </a>
                    </c:if>

                    <a class="nav-link me-3" href="https://www.facebook.com/nguyenanh.quan.1610092/" target="_blank">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="nav-link me-3"
                       href="https://www.instagram.com/_aq2208_/?fbclid=IwAR2XFJR2jXmZMbPXWEb9bB7ntB-VrxhdNMO8RwX2zshrERFcibZDrJN_1fk" target="_blank">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="https://github.com/aq2208" class="border rounded px-2 nav-link" target="_blank" style="border-radius: 8px!important">
                        <i class="fab fa-github me-2"></i> My GitHub
                    </a>

                    <c:if test="${sessionScope.acc == null}">
                        <a href="login.jsp" class="border rounded px-2 nav-link" target="_self" 
                           style="background-color: rgb(77,123,179); color: white; margin-left: 8px; width: 70px; text-align: center; border-radius: 8px!important">
                            Login
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.acc != null}">
                        <a href="logout" class="border rounded px-2 nav-link" target="_self"
                           style="margin-left: 8px; width: 70px; text-align: center; color: rgb(77,123,179); border-radius: 8px!important">
                            Logout
                        </a>
                    </c:if>
                </div>
                <!-- Right elements -->

            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->

        <!-- carousel -->
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/background1.png" class="d-block w-100" alt="Wild Landscape"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-sm-block mb-5">
                        <h1 class="mb-4">
                            <strong>The best cellphones saler in Vietnam</strong>
                        </h1>

                        <p>
                            <strong>Provide you the newest and highest quality products!</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Hi, my name is Anh Quan. This is my PRJ301 Assignment - an E-commerce website for selling
                                cellphones. Hope you enjoy it <3</strong>
                        </p>

                        <a target="_blank" href="https://www.facebook.com/nguyenanh.quan.1610092/"
                           class="btn btn-outline-white btn-lg" id="aq">Nguyen Anh Quan
                            <i class="fas fa-graduation-cap ms-2"></i>
                        </a>
                    </div>
                </div>         
            </div>
            <br>
        </div>

        <!--Main layout-->
        <main>
            <div class="container">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2"
                     style="background-color: rgb(77,123,179); border-radius: 6px; margin-bottom: 20px!important;">
                    <!-- Container wrapper -->
                    <div class="container-fluid">

                        <!-- Navbar brand -->
                        <a class="navbar-brand" href="#">Categories:</a>

                        <!-- Toggle button -->
                        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                                data-mdb-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 category">

                                <!-- Link -->


                                <li class="nav-item active">
                                    <a class="nav-link text-white ${((tag == 0) || (tag == null)) ? "selected" : ""}" href="products?category_id=${0}">All</a>
                                </li>

                                <c:forEach items="${requestScope.categories}" var="c">
                                    <li class="nav-item">
                                        <a class="nav-link text-white ${(tag == c.category_id) ? "selected" : ""}" href="products?category_id=${c.category_id}">${c.category_name}</a>
                                    </li>
                                </c:forEach>

                            </ul>



                            <!-- Search -->
                            <form action="search" method="post" class="w-auto py-1 form-inline" id="search" style="max-width: 12rem">
                                <input type="text" name="search" class="form-control rounded-5" placeholder="Search By Name" value="${requestScope.search}"
                                       aria-label="Search">
                                <button id="submit" type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>

                        </div>
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->

                <!-- Sort -->
                <div id="sort">
                    <form action="sort" method="post">
                        &nbsp;Sort by price: 
                        <select name="sort" >
                            <c:set var="x" value="${requestScope.option}"/>
                            <option value="-1" <c:if test="${x == (-1)}">selected</c:if> >Default</option>
                            <option value="1" <c:if test="${x == (1)}">selected</c:if> >Low to High</option>
                            <option value="0" <c:if test="${x == (0)}">selected</c:if> >High to Low</option>
                            </select>
                            <input type="submit" value="Sort">
                        </form>
                    </div>

                    <br>
                    <!-- Products -->
                    <section>
                        <div class="text-center">
                            <div class="row">
                            <c:set var="list" value="${requestScope.items}"/>

                            <c:if test="${(list.size()==0)}">
                                <h3>&nbsp;&nbsp;&nbsp;No Product in this Category</h3>
                            </c:if>

                            <c:forEach items="${requestScope.items}" var="i">
                                <div class="col-lg-3 col-md-6 mb-4" >
                                    <!-- Standard for card -->
                                    <div class="card" style="border-radius: 6px!important; overflow: hidden">
                                        <a href="detail?item_id=${i.item_id}">
                                            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light item_image"
                                                 data-mdb-ripple-color="light">
                                                <img src="images/${i.image}"
                                                     class="w-100" />

                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="card-body">
                                                <a href="detail?item_id=${i.item_id}" class="text-reset">
                                                    <h6 class="card-title mb-2">${i.item_name}</h6>
                                                </a>
                                                <a href="detail?item_id=${i.item_id}" class="text-reset">
                                                    <p>${i.category.getCategory_name()}</p>
                                                </a>
                                                <h6 class="mb-3 price">${Math.round(i.price/23740)}$</h6>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </section>

                <!-- Pagination -->
                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="home" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="home">1</a></li>
                        <li class="page-item"><a class="page-link" href="home">2</a></li>
                        <li class="page-item"><a class="page-link" href="home">3</a></li>
                        <li class="page-item"><a class="page-link" href="home">4</a></li>
                        <li class="page-item"><a class="page-link" href="home">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="home" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- Pagination -->
            </div>
        </main>
        <!--Main layout-->

        <!-- Footer -->
        <footer class="text-center text-white mt-4" style="background-color: rgb(77,123,179, 0.7)">

            <!--Call to action-->
            <div class="pt-4 pb-2">
                <a class="btn btn-outline-white footer-cta mx-2" id="last" style="border-radius: 8px!important"
                   href="https://www.facebook.com/nguyenanh.quan.1610092/" target="_blank" role="button">My Little World
                    <i class="fas fa-heart ms-2"></i>
                </a>
                <a class="btn btn-outline-white footer-cta mx-2" id="last2" style="border-radius: 8px!important" href="https://daihoc.fpt.edu.vn/"
                   target="_blank" role="button">FPT University
                    <i class="fas fa-graduation-cap ms-2"></i>
                </a>
            </div>
            <!--/.Call to action-->

            <hr class="text-dark">

            <div class="container">
                <!-- Section: Social media -->
                <section class="mb-3">

                    <!-- Facebook -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

                    <!-- Twitter -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

                    <!-- Google -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

                    <!-- Instagram -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

                    <!-- YouTube -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-youtube"></i></a>
                    <!-- Github -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button"
                       data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
                </section>
                <!-- Section: Social media -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); color: #E0E0E0; font-weight: 300">
                © 2022 Copyright:
                <a class="text-white" href="https://www.facebook.com/nguyenanh.quan.1610092/" target="_blank">Nguyen Anh Quan</a>
            </div>
            <!-- Copyright -->
        </footer>


    </body>
</html>
