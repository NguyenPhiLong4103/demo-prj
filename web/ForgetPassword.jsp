
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" >
        <title>ForgetPassword</title>
    </head>
    <body>
        <div id="logreg-forms">
            <form action="ForgetPassword" method="post">

                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Reset password</h1>

                <input name="email" type="email" class="form-control" value="${param.email}" placeholder="Email address" required autofocus="">
                <p style="color: red">${mess}</p>
                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i>Reset password</button>
                <a href="Login.jsp"><i class="fas fa-angle-left"></i> Back</a>

            </form>
            <br>

        </div>
        <p style="text-align:center">
            <a href="http://bit.ly/2RjWFMfunction toggleResetPswd(e){
               e.preventDefault();
               $('#logreg-forms .form-signin').toggle() // display:block or none
               $('#logreg-forms .form-reset').toggle() // display:block or none
               }

               function toggleSignUp(e){
               e.preventDefault();
               $('#logreg-forms .form-signin').toggle(); // display:block or none
               $('#logreg-forms .form-signup').toggle(); // display:block or none
               }

               $(()=>{
               // Login Register Form
               $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
               $('#logreg-forms #cancel_reset').click(toggleResetPswd);
               $('#logreg-forms #btn-signup').click(toggleSignUp);
               $('#logreg-forms #cancel_signup').click(toggleSignUp);
               })g" target="_blank" style="color:black"></a>
        </p>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/login.js"></script>
    </body>
</html>
