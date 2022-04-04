$(document).ready(function () {

    $(".product-container").on('click', '#btnAddToCart', function () {
        //debugger;
        try {
            var productcontainer = $(this).parents(".product-container");
            var pid = $(productcontainer).attr("id").split("_")[1];
            var pname = $(this).parents(".product-container").find("#lblProductName").text();
            var qty = 1;
            var price = $(this).parents(".product-container").find("#lblPrice").text();

            //var img = $(this).parents(".product-container").find("#Image").url();
            //alert(img);

            addToCart(pid, pname, qty, price);
            //$('#AddCartModel').modal('show');

        }
        catch (e) {
            alert(e);
        }
    });
});

function addToCart(pid, pname, qty, price) {

    debugger;
    var prodcart = {};

    prodcart.ProdID = pid;
   
    prodcart.Price = price;
    prodcart.Qty = qty;

    console.log(prodcart);

    $.ajax({
        type: "POST",
        url: "ViewProduct.aspx/AddCart",
        //data: jsondata,
        data: '{prodcarts: ' + JSON.stringify(prodcart) + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            debugger;
            if (response.d == "success") {
                $('#AddCartModel').modal('show');
               $("#lbl1").text(pname+" Successfully added into cart");
                //window.location.href = "CartDetails.aspx";

            }

        },
        error: function (response) {
            $("#msg").html("Not Inserted...").css("color", "red");
        }
    });
}