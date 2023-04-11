<%-- 
    Document   : checkout
    Created on : Mar 12, 2023, 3:33:19 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase History</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/checkout.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">
    </head>
    <body>

        <section class="intro">

            <div style="position: relative;" class="gradient-custom-1 h-100">

                <div class="mask d-flex align-items-center h-100">
                    <div class="container">
                        <h5 style="margin-bottom: 18px">
                            <a href="home" style="color: rgb(36,37,38)">                                      
                                <i class="fa-solid fa-house"></i>
                                Home
                            </a>
                        </h5>
                        <div class="row justify-content-center">

                            <div class="col-12">
                                <div class="table-responsive bg-white" style="border-radius: 10px; overflow: hidden; box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                                    <h3 style="text-align: center">PURCHASE HISTORY</h3>
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col">ORDER NO.</th>
                                                <th scope="col">TIME</th>
                                                <th scope="col">TOTAL PRICE</th>
                                                <th scope="col">ORDER DETAIL</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="t" value="0"/>
                                            <c:forEach items="${requestScope.orders}" var="o">
                                                <c:set var="t" value="${t+1}"/>
                                                <tr>
                                                    <td scope="row" style="color: #666666;">${t}</td>
                                                    <td style="color: #666666;">${o.time}</td>
                                                    <td style="color: #666666;">${o.totalprice}$</td>
                                                    <td><a href="orderhistory?order_id=${o.order_id}">Detail</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                                <br>
                                <h5>
                                    <a href="showcart" style="color: rgb(36,37,38)">                                      
                                        <i class="fa-solid fa-cart-shopping"></i>
                                        Back to cart
                                    </a>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
