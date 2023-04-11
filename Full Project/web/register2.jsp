<%-- 
    Document   : register2
    Created on : Mar 14, 2023, 4:38:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign-up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/register.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">
        <style>
            span{
                color:red;
            }
        </style>
    </head>
    <body>


        <!-- Section: Design Block -->
        <section class="text-center text-lg-start">
            <style>
                .cascading-right {
                    margin-right: -50px;
                }

                @media (max-width: 991.98px) {
                    .cascading-right {
                        margin-right: 0;
                    }
                }
            </style>

            <!-- Jumbotron -->
            <div class="container py-4">
                <div class="row g-0 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card cascading-right" style="
                             background: hsla(0, 0%, 100%, 0.55);
                             backdrop-filter: blur(30px);
                             z-index: 1000;
                             translate: 55px 0px;
                             box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
                             border-radius: 10px;
                             overflow: hidden;
                             width: 540px;
             
                             ">
                            <div class="card-body shadow-5 text-center" style="padding: 3rem; padding-top: 35px; padding-bottom: 35px;">
                                <h2 class="fw-bold mb-5">Sign up now</h2>
                                <form action="signup" method="post">
                                    <!-- Username -->
                                    <div class="form-outline mb-4">
                                        <input class="form-control" placeholder="Username" type="text" name="user" required value="${requestScope.user}"><span>${requestScope.error2}</span>
                                    </div>

                                    <!-- 2 column grid layout with text inputs for the password and repeat password -->
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input class="form-control" type="password" name="pass" placeholder="Password" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input class="form-control" placeholder="Repeat password" type="password" name="repass" required><span>${requestScope.error1}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input class="form-control" placeholder="Email" type="email" name="email" required value="${requestScope.email}">
                                    </div>
                                    
                                    <!-- Phone number -->
                                    <div class="form-outline mb-4">
                                        <input class="form-control" placeholder="Phone number" type="text" name="phone" required value="${requestScope.phone}"><span>${requestScope.error3}</span>
                                    </div>

                                    <!-- Address input -->
                                    <div class="form-outline mb-4">
                                        <input class="form-control" placeholder="Address" type="text" name="address" required value="${requestScope.address}">
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4" style="background-color: rgb(77,123,179)">
                                        Sign up
                                    </button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>or sign up with:</p>
                                        <div style="display: flex; justify-content: center; align-items: center; padding: 0 auto;">
                                            <a><i class="fab fa-facebook-f" style="color: rgb(77,123,179); margin-right: 25px; margin-left: 25px"></i></a>
                                            <a><i class="fab fa-google" style="color: rgb(77,123,179); margin-right: 25px; margin-left: 25px"></i></a>
                                            <a><i class="fab fa-twitter" style="color: rgb(77,123,179); margin-right: 25px; margin-left: 25px"></i></a>
                                            <a><i class="fab fa-github" style="color: rgb(77,123,179); margin-right: 25px; margin-left: 25px"></i></a>
                                        </div>
                                    </div>

                                </form>
                                
                            </div>
                                    
                        </div>
                        <a href="login.jsp" style="display: block ;border: 2px solid rgb(77,123,179); border-radius: 5px; height: 35px; width: 80px; 
                           translate: 58px 17px; color: rgb(77,123,179); padding-top: 3px; text-decoration: none;"
                           onMouseOver="this.style.backgroundColor='whitesmoke'"
                           onMouseOut="this.style.backgroundColor='transparent'">
                            Login <i class="fa-solid fa-right-to-bracket"></i>
                        </a>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0" style="translate:-40px 0">
                        <img src="images/register4_3.png" class="w-100 rounded-4 shadow-4"
                             alt="" style="border-radius: 10px!important"  />
                    </div>
                </div>
            </div>
            <!-- Jumbotron -->
        </section>
        <!-- Section: Design Block -->
    </body>
</html>
