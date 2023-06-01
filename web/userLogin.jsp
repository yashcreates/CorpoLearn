<%-- 
    Document   : userLogin
    Created on : 26-May-2023, 10:04:48 am
    Author     : yashsaravane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <script src="https://kit.fontawesome.com/e060e0fcf8.js" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div class="bkgd">
        <div class="wlcbox">
            <h3>WELCOME TO</h3>
            <h1>CORPORATE</h1>
            <h1>LEARNING</h1>
            <h1>PLATFORM</h1>
            <div class="footer">
                <h5>By logging in you are agreeing to terms and conditions</h5>
            </div>
        </div>
        <div class="loginbox">
            <div id="icon">
                <img src="./images/user.png" alt="user">
            </div>
            <form action ="UserLoginServlet" method="POST ">
                <h1>Login</h1>
                <div class="content">
                  <div class="input-field">
                    <input name ="name" type="text" placeholder="username">
                  </div>
                  <div class="input-field">
                    <input name="pass" type="password" placeholder="Password">
                  </div>
                </div>
                <div class="action">
                  <input type="submit" value="Log In">
                </div>
              </form>
        </div>
    </div>
</body>
</html>