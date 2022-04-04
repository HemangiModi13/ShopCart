<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopCart.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--<link href="CSS/bootstrap.css" rel="stylesheet" />--%>
    <link href="CSS/login.css" rel="stylesheet" />
    <link href="CSS/StyleSheet1.css" rel="stylesheet" />

    <script src="JS/bootstrap.min.js"></script>
    <%--<script src="JS/jquery.validate.min.js"></script>
    <script src="JS/jquery.validate.unobtrusive.min.js"></script>--%>
    <script src="JS/jquery-3.2.1.js"></script>
    <script src="JS/Login.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-4 col-md-offset-4 login-form text-center">
                <p class="logo-g">N</p>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input class="form-control" id="UserName" placeholder="Username" type="text" />
                    <span id="Error_UserName" class="err text-danger" hidden="hidden">UserName is required</span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input class="form-control" id="Password" placeholder="Password" type="password" />
                    <span id="Error_Password" class="err text-danger" hidden="hidden">Password is required</span>
                </div>
                <span id="msg"></span>
                <span id="msgsuccess" class="text-info" hidden="hidden">Login Successfully...</span>
                <span id="msgerror" class="text-danger" hidden="hidden">UserName or Password Wrong...</span>

                <button type="submit" id="login" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-send"></i>Login</button>
            </div>
        </div>
    </form>
</body>
</html>
