<%-- 
    Document   : checkout_form
    Created on : Mar 17, 2023, 1:54:38 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Proceed To Pay</title>
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
    <c:set var="size2" value="${sessionScope.size2}"/>

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white" style="box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;">
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
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
                    <li class="nav-item active">
                        <a class="nav-link " href="home">Home</a>
                    </li>

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
                            <a class="nav-link" href="listitems">Manage All Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listaccount">Manage Accounts</a>
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
                        <span class="badge rounded-pill badge-notification bg-danger">${size2}</span>
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

    <!--Main layout-->
    <main class="mt-5 pt-4">
        <div class="container">
            <!-- Heading -->
            <h2 class=" text-center" style="margin-bottom: 20px; margin-top: 10px">Checkout form</h2>

            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-md-8 mb-4">
                    <!--Card-->
                    <div class="card p-4" style="border-radius: 7px;">
                        <form action="order" method="post">
                            <!--Grid row-->
                            <div class="row mb-3">
                                <!--Grid column-->
                                <div class="col-md-6 mb-2">
                                    <!--firstName-->
                                    <p class="mb-0">First name</p>
                                    <div class="form-outline">
                                        <input type="text" id="typeText" class="form-control" required placeholder="Nguyen Anh"/>
                                        
                                    </div>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-md-6 mb-2">
                                    <p class="mb-0">Last name</p>
                                    <!--lastName-->
                                    <div class="form-outline">
                                        <input type="text" id="typeText" class="form-control" required placeholder="Quan"/>
                                        
                                    </div>
                                </div>
                                <!--Grid column-->
                            </div>
                            <!--Grid row-->

                            <!--address-->
                            <p class="mb-0">
                                Address
                            </p>
                            <div class="form-outline mb-4">
                                <input type="text" class="form-control" placeholder="1234 Main St" aria-label="1234 Main St" aria-describedby="basic-addon1" required/>
                            </div>

                            <!--address-2-->
                            <p class="mb-0">
                                Address 2 (optional)
                            </p>
                            <div class="form-outline mb-4">
                                <input type="text" class="form-control" placeholder="Apartment or suite" aria-label="Apartment or suite" aria-describedby="basic-addon1" />
                            </div>

                            <!--Grid row-->
                            <div class="row">
                                <!--Grid column-->
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <p class="mb-0">
                                        Country
                                    </p>
                                    <div class="form-outline mb-4">
                                        <input required type="text" class="form-control" placeholder="Vietnam" aria-label="Vietnam" aria-describedby="basic-addon1" />
                                    </div>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <p class="mb-0">
                                        State
                                    </p>
                                    <div class="form-outline mb-4">
                                        <input required type="text" class="form-control" placeholder="Ha Noi" aria-label="Ha Noi" aria-describedby="basic-addon1" />
                                    </div>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <p class="mb-0">
                                        Zip
                                    </p>
                                    <div class="form-outline">
                                        <input required type="number" class="form-control" placeholder="00001111"/>
                                    </div>
                                </div>
                                <!--Grid column-->
                            </div>
                            <!--Grid row-->

                            <hr />
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                <label class="form-check-label" for="flexCheckDefault">Shipping address is the same as my billing address</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                <label class="form-check-label" for="flexCheckDefault">Save this information for next time</label>
                            </div>

                            <hr class="mb-4" />                    
                            <button class="btn btn-primary" type="submit" style="background-color: rgb(77,123,179); color: white; border-radius: 7px!important;display: block; margin: auto auto" >Continue to checkout</button>
                        </form>

                    </div>
                    <!--/.Card-->
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-4 mb-4">
                    <!-- Heading -->
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Your cart</span>
                        <span class="badge rounded-pill badge-primary" style="background-color: rgb(77,123,179); color: white;">${size2}</span>
                    </h4>

                    <!-- Cart -->
                    <ul class="list-group mb-3" style="border-radius: 7px!important; overflow: hidden; border: 0.3px solid gray">
                        
                        <c:forEach items="${requestScope.items}" var="i">
                            <li class="list-group-item d-flex justify-content-between">
                                <div>
                                    <h6 class="my-0">${i.item.item_name}</h6>
                                    <small class="text-muted">Quantity: ${i.quantity}</small>
                                </div>
                                <span class="text-muted">$${(Math.round(i.item.price/23740) * i.getQuantity())}</span>
                            </li>
                        </c:forEach>
                        
                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <h6 class="my-0">Promo code</h6>
                                <small>ANHQUANDEPTRAI</small>
                            </div>
                            <span class="text-success">-$0</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (USD)</span>
                            <strong>$${requestScope.total}</strong>
                        </li>
                    </ul>
                    <!-- Cart -->

                    <!-- Promo code -->
                    <form class="card p-2" style="border-radius: 7px;">
                        <div class="input-group mb-3">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Promo code"
                                aria-label="Promo code"
                                aria-describedby="button-addon2"
                                style="border-radius: 7px!important;"
                                />
                            <button class="btn btn-primary" type="button" id="button-addon2" data-mdb-ripple-color="dark" style="background-color: rgb(77,123,179); color: white;border-radius: 7px!important;">
                                redeem
                            </button>
                        </div>
                    </form>
                    <!-- Promo code -->
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
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
