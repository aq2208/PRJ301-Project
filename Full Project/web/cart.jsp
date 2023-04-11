<%-- 
    Document   : cart
    Created on : Mar 12, 2023, 3:27:58 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Shopping cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">

    </head>
    <body style="background-image: url(images/background6-transformed.png); background-size: cover; background-repeat: no-repeat">
        <div id="back">
            <div id="back-child">
<!--                <h6 class="mb-0">
                    <a href="home" class="text-body">
                        <i class="fas fa-long-arrow-alt-left me-2"></i>
                        Back to shop
                    </a>
                </h6>-->
                <h5>
                    <a href="home" style="color: rgb(36,37,38)">                                      
                        <i class="fa-solid fa-house"></i>
                        Home
                    </a>
                </h5>
            </div>
        </div>

        <section class="h-100">
            <div class="container h-100 py-5" >
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">

                        <!-- Heading -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                            <div>
                                <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!" class="text-body">price <i
                                            class="fas fa-angle-down mt-1"></i></a></p>
                            </div>
                        </div>

                        <!-- Cart's Items -->
                        <c:forEach items="${requestScope.items}" var="a">
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                src="images/${a.item.image}"
                                                class="img-fluid rounded-3" alt="${a.item.item_name}">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p style="font-weight: 400!important" class="lead fw-normal mb-2">${a.item.item_name}</p>
                                        </div>
                                        <!-- Quantity Adjustment -->
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2">
                                                <a href="process?num=-1&id=${a.item.item_id}">
                                                    <i class="fas fa-minus"></i>
                                                </a>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="${a.quantity}" type="number" readonly
                                                   class="form-control form-control-sm" />

                                            <button class="btn btn-link px-2">
                                                <a href="process?num=1&id=${a.item.item_id}">
                                                    <i class="fas fa-plus"></i>
                                                </a>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">${(Math.round(a.item.price/23740) * a.getQuantity())}$</h5>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <form action="delete" method="post">
                                                <input type="hidden" name="item_id" value="${a.item.item_id}">
                                                <button type="submit" style="width: 28px; height: 28px; background-color: transparent; border: 0px;">
                                                    <i class="fas fa-trash fa-lg text-danger"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Discount code -->
                        <div class="card mb-4">
                            <div class="card-body p-4 d-flex flex-row">
                                <div class="form-outline flex-fill">
                                    <input type="text" id="form1" class="form-control form-control-lg" readonly value="Total Money: ${requestScope.total}$" style="font-weight: 400!important;"/>
                                </div>
                                <button id="apply" type="button" class="btn btn-lg ms-3" style="border: 3px solid rgb(88,128,162); color: rgb(88,128,162); border-radius: 5px; font-weight: 450">Apply</button>
                            </div>
                        </div>

                        <!-- Checkout -->
                        <div class="card">
                            <div class="card-body">
                                <form action="beforecheckout" method="post">
                                    <button id="checkout" type="submit" class="btn btn-block btn-lg" style="background-color: rgb(88,128,162); color: white; font-weight: 450">Proceed to Pay</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </section>

    </body>

</html>
