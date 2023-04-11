<%-- 
    Document   : register
    Created on : Mar 14, 2023, 12:47:52 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign-up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/d15e5be0e8.js" crossorigin="anonymous"></script>
        <link rel="icon" href="images/logo-no-background.png" type="images/x-icon">
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-black">

                        <div class="px-5 ms-xl-4 signup-logo">

               
                        </div>

                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 pt-5 pt-xl-0 mt-xl-n5 pt5">

                            <!-- Signup Form -->
                            <form style="width: 23rem;">

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign up</h3>

                                <div class="form-outline mb-4">
                                    <input type="text" id="form2Example18" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Username</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="form2Example28" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example28">Password</label>
                                </div>
                                
                                <div class="form-outline mb-4">
                                    <input type="password" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Repeat Password</label>
                                </div>
                                
                                <div class="form-outline mb-4">
                                    <input type="email" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Email</label>
                                </div>
                                
                                <div class="form-outline mb-4">
                                    <input type="text" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Phone number</label>
                                </div>
                                
                                <div class="form-outline mb-4">
                                    <input type="text" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Address</label>
                                </div>

                                <div class="pt-1 mb-4">
                                    <button class="btn btn-info btn-lg btn-block" type="button">Login</button>
                                </div>

                                <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>

                            </form>

                        </div>

                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
                             alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
