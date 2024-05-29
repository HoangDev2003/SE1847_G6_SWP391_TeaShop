<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="colorlib-regform-7/css/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sign up form -->
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="colorlib-regform-7/images/signin-image.jpg" alt="sing up image"></figure>

                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Reset Password</h2>
                            <form action="resetpass">
                                <div class="form-group">
                                    <label for="emailc"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="emailc"  name="emailc" id="emailc" placeholder="Your Email"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" class="form-submit" value="Send"/>
                                </div>
                                <a href="login.jsp" style="color:black">Back</a>    
                                <h4 style="color: green">${Notification}</h4>
                                <h4 style="color: red">${error}</h4>
                            </form>

                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

