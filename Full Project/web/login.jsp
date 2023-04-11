<%-- 
    Document   : login
    Created on : Mar 14, 2023, 12:45:43 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">
    </head>
    <body>
        <section class="vh-100" style="background-color: rgb(130,162,202); 
                 background-image: url(images/login-background7.png); background-size: contain;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem; background-color: whitesmoke">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="images/login.png"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">
                                        <!-- Login Form -->
                                        <form action="login" method="post">

                                            <div class="d-flex align-items-center mb-3 pb-1 header">
                                                <a href="home" style="translate: 0 -20px;"><img src="images/logo-no-background.png" id="logo"></a>
                                                
                                                &emsp;&emsp;&emsp;&ensp;<span class="h1 fw-bold mb-0 heading">Aqcute</span>
                                            </div>

                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                                            
                                            <div class="form-outline mb-4">
                                                <!-- Username -->
                                                <input type="text" name="user" id="form2Example17" class="form-control form-control-lg" value="${requestScope.username}"/>
                                                <label class="form-label" for="form2Example17">Username</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <!-- Password -->
                                                <input type="password" name="pass" id="form2Example27" class="form-control form-control-lg"/>
                                                <label class="form-label" for="form2Example27">Password</label>
                                            </div>
                                                
<!--                                            <input type="hidden" name="item_id" value="${requestScope.item_id}">-->
                                            
                                            <c:set value="${requestScope.error}" var="c"/>
                                            <p style="color: red">${c}</p>
                                            <div class="pt-1 mb-4">
                                                <input class="btn btn-dark btn-lg btn-block" type="submit" value="Login">
                                            </div>

                                            <a class="small text-muted" href="#!">Forgot password?</a>
                                            <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register2.jsp"
                                                                                                                      style="color: #393f81;">Register here</a></p>
                                            <a href="#!" class="small text-muted">Terms of use.</a>
                                            <a href="#!" class="small text-muted">Privacy policy</a>
                                            
                                            
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
