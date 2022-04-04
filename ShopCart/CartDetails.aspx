<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartDetails.aspx.cs" Inherits="ShopCart.CartDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <script src="JS/jquery-3.2.1.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <script src="JS/GetCart.js"></script>
    
    <script type="text/javascript">
        function changeqty(id, newqty) {

            var price = parseInt($("#price" + id).text());
            var oldSubTotal = parseInt($("#subtotal" + id).text());
            var oldQty = oldSubTotal / price;
            var res = newqty * (parseInt($("#price" + id).text()));
            if (newqty > 0) {

                //update qty of given id
                var diffQty = newqty - oldQty;
                var diffAmount = diffQty * (parseInt($("#price" + id).text()));
                var totalAmount = parseInt($("#ttl").text());
                if (oldQty < newqty) {

                    var finalAmount = totalAmount + diffAmount;
                    $("#ttl").text(finalAmount);
                    //++
                }
                else {

                    var finalAmount = totalAmount - diffAmount;
                    $("#ttl").text(finalAmount);
                    //--
                }

                var res = newqty * (parseInt($("#price" + id).text()));
                $("#subtotal" + id).text(res);


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CartDetails.aspx/UpdateQtyByID",
                    data: '{"ID":"' + id + '", "Qty":"' + newqty + '"}',
                    dataType: "json",
                    success: function (data) {

                    },
                    error: function (data) {

                        console.log(data);
                        alert("Error");

                    }
                });
            }
            else {
                alert("Minimum Quantity 1 ");
                alert(oldQty);
                $("#qty" + id).val(oldQty);
            }
        }

        function removeitem(id) {
            var r = confirm("Are you sure you want Delete?");
            // delete record of given id from db

            if (r == true) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CartDetails.aspx/DeleteRecordByID",
                    data: '{"ID":"' + id + '"}',
                    dataType: "json",
                    success: function (data) {

                        var obj = data.d;
                        if (obj == "success") {

                        }

                    },
                    error: function (data) {
                        alert("Error");
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div>
            <table id="cartBucket" class="table table-bordered">
                <tr>
                    <td>Cart Will Display Here...!</td>
                </tr>
            </table>
        </div>--%>



        <div class="col-lg-8">
            <div class="panel panel-primary" style="margin-top: 3%">

                <table class="table table-striped">
                    <thead>
                        <tr>

                            <th>Sr. No.</th>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>SubTotal</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody class="SetCartList">
                        <tr id="LoadingStatus" style="color: red"></tr>
                    </tbody>
                   
                    <tfoot>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><a href='ViewProduct.aspx' class='btn btn-warning'>ContinueToShopping</a></td>
                            <td>&nbsp;</td>
                            <td><a href='#' class='btn btn-success' onclick='PlaceOrder()'>PlaceOrder</a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
