var ttl = 0;
$(document).ready(function () {

    //$.ajax({
    //    type: "POST",
    //    contentType: "application/json; charset=utf-8",
    //    url: "CartDetails.aspx/GetCartItems",
    //    data: "{}",
    //    dataType: "json",
    //    success: function (data) {

    //        if (data != null) {

    //            $("#cartBucket").empty();
    //            $("#cartBucket").append(" <tr> "+
    //                "<th>Sr. No.</th>"+
    //                "<th>Product Name</th>"+
    //                "<th>Image</th>"+
    //                "<th>Price</th>"+
    //                "<th>Qty</th>"+
    //                "<th>Total</th>"+
    //                "<th>Delete</th>"+
    //            "</tr>");

               

    //            console.log(data);
    //            var str = "<tr>";
    //            var sr = 1;
    //            var ttl = 0;
    //            debugger

    //            $.each(JSON.parse(data.d), function (key, value) {

    //                str = str + "<td>" + sr++ + "</td><td> " + value.ProdName + " </td><td><img src= " + value.img + " alt='No Image' height=50 width=50/> </td><td id='price" + value.CartId + "'> " + value.Price + " </td><td><input id='qty" + value.CartId + "' type=text value= " + value.Qty + " oninput='changeqty(" + value.CartId + ",this.value); '/></td><td id='subtotal" + value.CartId + "'><b> " + value.Qty * value.Price + "</b> </td><td><button class='btn btn-danger' value=" + value.CartId + " onclick='removeitem(this.value)'>Remove</button> </td></tr>";
    //                ttl += value.Qty * value.Price;
    //            });
                
    //            var footer = "<tr>" +
    //               "<td>&nbsp;</td>" +
    //               "<td>&nbsp;</td>" +
    //               "<td>&nbsp;</td>" +
    //               "<td>&nbsp;</td>" +
    //               "<td>Total</td>" +
    //               "<td id='ttl' value=" + ttl + "><b>"+ttl+"</b></td>" +
    //               "<td>&nbsp;</td>" +
    //           "</tr>";

    //            $("#cartBucket").append(str);
    //            $("#cartBucket").append(footer);
    //            //alert("success");
    //        } else {
    //            alert("Cart is Empty..");
    //        }

    //    },
    //    error: function (data) {
    //        alert("Error");
    //    }
    //});

    var carts;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "CartDetails.aspx/GetCartItems",
        data: "{}",
        dataType: "json",
        success: function (data) {

            //console.log(data);
            carts = [];
            carts.push(JSON.parse(data.d));
            console.log(carts);

            $("#LoadingStatus").html("Loading....");
            if (carts[0].length != 0) {
                var _html = "";
                var sr = 0;
               
                for (var i = 0; i < carts[0].length; i++) {

                    sr = i+1;
                    _html += "<tr class='row_" + carts[0][i].ID + "'>";
                    _html += "<td>" + sr + "</td>";
                    _html += "<td>" + carts[0][i].ProdName + "</td>";
                    _html += "<td>" + "<img src=" + carts[0][i].img + " alt='No Image' height=50 width=50/>" + "</td>";
                    _html += "<td id='price" + carts[0][i].CartId + "'>" + carts[0][i].Price + "</td>";
                    _html += "<td>" + "<input id='qty" + carts[0][i].CartId + "' type=text value=" + carts[0][i].Qty + " onchange='changeqty(" + carts[0][i].CartId + ",this.value); ' />" + "</td>";
                    _html += "<td id='subtotal" + carts[0][i].CartId + "'><b> " + carts[0][i].Qty * carts[0][i].Price + "</b>" + "</td>";
                    _html += "<td>" + "<button class='btn btn-danger' value=" + carts[0][i].CartId + " onclick='removeitem(this.value)'>Remove</button>" + "</td>";
                    _html += "</tr>";
                    ttl += carts[0][i].Qty * carts[0][i].Price;

                }

                var footer = "<tr>" +
                    "<td>&nbsp;</td>" +
                    "<td>&nbsp;</td>" +
                    "<td>&nbsp;</td>" +
                    "<td>&nbsp;</td>" +
                    "<td><b>Total Amount</b></td>" +
                    "<td id='ttl' value=" + ttl + "><b>" + ttl + "</b></td>" +
                    "<td>&nbsp;</td>" +
                    "</tr>";
                    
                $(".SetCartList").append(_html);
                $(".SetCartList").append(footer);
                $("#LoadingStatus").html(" ");
            }
            else {
                $("#LoadingStatus").html("Cart is Empty");
            }
        },
        error: function (data) {
            alert("Error");
        }
    });
});

function PlaceOrder() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "CartDetails.aspx/AddOrderDetails",
        data: '{"Amt":"' + ttl + '"}',
        dataType: "json",
        success: function (data) {
            alert("Place Order Successfully");
            window.location.href = "CartDetails.aspx";
        },
        error: function (data) {

            console.log(data);
            alert("Error");

        }
    });
}

