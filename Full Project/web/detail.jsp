<%-- 
    Document   : detail
    Created on : Mar 12, 2023, 3:33:37 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Detail</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon" />
        <script type="text/javascript">
            function buy(item_id) {
                document.f.action = "addToCart?item_id=" + item_id;
                document.f.submit();
            }

            function checkQuantity(item_stock) {
                var number = parseInt(document.getElementById("quantity").value);
                if ((number > parseInt(item_stock)) || (number >= 1000)) {
                    return false;
                } else {
                    //buy(item_id);
                    return true;
                }
            }

            function submitForm(item_stock, item_id) {
                if (checkQuantity(item_stock)==true) {
                    buy(item_id);
                    return true;
                } else {
                    document.getElementById("error").innerHTML = "Quantity out of stock!";
                    //alert("Quantity out of stock!");
                    event.preventDefault();
                    return false;
                }
            }

        </script>
    </head>
    <body>
        <c:set value="${requestScope.detail}" var="i"></c:set>
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

        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container mt-5">
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <img src="images/${i.image}"
                             class="img-fluid" alt="" style="height: 100%!important; object-fit: contain!important;"/>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Content-->
                        <div class="p-4">
                            <div class="mb-3">
                                <a href="">
                                    <span class="badge bg-dark me-1">${i.category.getCategory_name()}</span>
                                </a>
                                <a href="">
                                    <span class="badge bg-info me-1">New</span>
                                </a>
                                <a href="">
                                    <span class="badge bg-danger me-1">Bestseller</span>
                                </a>
                            </div>

                            <p class="lead">
                                <span style="color:green; font-size: 22px; font-weight: 500">${Math.round(i.price/23740)}$</span>
                            </p>

                            <h4>${i.item_name}</h4>
                            <br>

                            <c:if test="${i.stock != 0}">
                                <p style="font-size: 19px; font-weight: 500"><i class="fa-solid fa-store"></i> ${i.stock}</p>
                            </c:if>
                            
                            <c:if test="${i.stock == 0}">
                                <p style="font-size: 19px; font-weight: 500; color: red;"><i class="fa-solid fa-circle-exclamation"></i> ${i.stock} (Out of stock)</p>
                            </c:if>

                            <p style="font-size: 19px; font-weight: 500">Description</p>


                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Et
                                dolor suscipit libero eos atque quia ipsa sint voluptatibus!
                                Beatae sit assumenda asperiores iure at maxime atque repellendus
                                maiores quia sapiente.
                            </p>

                            <c:if test="${sessionScope.acc != null}">
                                <form class="d-flex justify-content-left" name="f" action="" method="post">
                                    <!-- Default input -->
                                    <div class="form-outline me-1" style="width: 100px">
                                        <input style="border-radius: 7px!important" id="quantity" type="number" name="number" value="1" class="form-control" min="1"/>
                                    </div>
                                    &nbsp;&nbsp;
                                    <button id="addToCart" class="btn btn-primary ms-1" type="submit" style="background-color: rgb(77,123,179); border-radius: 7px!important;" 
                                            onclick="submitForm('${i.stock}', '${i.item_id}')">
                                        Add to cart
                                        <i class="fas fa-shopping-cart ms-1"></i>
                                    </button>
                                </form>
                                <p style="color: red" id="error"></p>
                            </c:if>

                            <c:if test="${sessionScope.acc == null}">
                                <form class="d-flex justify-content-left" action="addToCart" method="get">
                                    <!-- Default input -->
                                    <div class="form-outline me-1" style="width: 100px">
                                        <input type="number" name="number" value="1" class="form-control" />
                                    </div>
                                    <input type="hidden" name="item_id" value="${i.item_id}">
                                    &nbsp;&nbsp;
                                    <button id="addToCart" class="btn btn-primary ms-1" type="submit" style="background-color: rgb(77,123,179)">
                                        Add to cart
                                        <i class="fas fa-shopping-cart ms-1"></i>
                                    </button>
                                </form>
                            </c:if>
                        </div>
                        <!--Content-->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <hr />

                <!--Grid row-->
                <div class="row d-flex justify-content-center">
                    <!--Grid column-->
                    <div class="col-md-6 text-center">
                        <h4 class="my-4 h4">Additional information</h4>

                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus
                            suscipit modi sapiente illo soluta odit voluptates, quibusdam
                            officia. Neque quibusdam quas a quis porro? Molestias illo neque
                            eum in laborum.
                        </p>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-lg-4 col-md-12 mb-4">
                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/11.jpg"
                             class="img-fluid" alt="" />
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-4 col-md-6 mb-4">
                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/12.jpg"
                             class="img-fluid" alt="" />
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-4 col-md-6 mb-4">
                        <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/13.jpg"
                             class="img-fluid" alt="" />
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
