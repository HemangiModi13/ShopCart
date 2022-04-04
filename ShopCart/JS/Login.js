$(document).ready(function () {

    debugger;
    $('#login').on('click', function () {
        debugger;
        //if (validateUser() == false) {

        //    $("span").show();

        //    return false;
        //}
        //else {
        var user = {};

        user.UserName = $('#UserName').val();
        user.Password = $('#Password').val();

        $.ajax({
            async: false,
            type: "POST",
            url: "Login.aspx/LoginUser",
            data: JSON.stringify(user),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                debugger;
                if (response.d == "success") {
                    
                    $("#msg").html("Login Successfully...").css("color", "green");
                    //$("#msgsuccess").show();
                    window.location.href = "ViewProduct.aspx";
                    //window.location.href = "/Products.aspx";
                }
                else if (response.d == "error") {
                    //$("#msgerror").show();
                    $("#msg").html("invalid username and password...").css("color", "red");
                }
                else {
                    $("#msg").html("login failed...").css("color", "red");
                }

            },
            error: function (response) {
                $("#msg").html("Login Failed...").css("color", "red");
            }
        });


        // }
    });
});

function validateUser() {

    if ($("#UserName").val() == "") {
        $("#Error_UserName").show();
        return false;
    }
    else if ($("#Password").val() == "") {
        $("#Error_Password").show();
        return false;
    }

    else {
        return true;
    }
}

