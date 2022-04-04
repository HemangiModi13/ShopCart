<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="ShopCart.ViewProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <script src="JS/jquery-3.2.1.js"></script>
    <script src="JS/bootstrap.min.js"></script>
    <script src="JS/GetCategory.js"></script>
    <script src="JS/Insert.js"></script>
    <script src="JS/Addcart.js"></script>

</head>
<body>
    <form id="form1" method="post" enctype="multipart/form-data" runat="server">
        <div>
            <button type="button" class="btn btn-info btn-lg" id="btnShowPopup" data-toggle="modal" data-target="#myModal" style="margin-top: 25px; margin-left: 20px;">Add New Product</button>
   
                <a href="CartDetails.aspx" class="btn btn-success btn-lg" style="margin-left: 1495px;">
                    <span class="glyphicon glyphicon-shopping-cart"><asp:Label id="cartcnt" runat="server"></asp:Label></span>
                </a>
           
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title">Add New Product</h3>
                        </div>
                        <div class="modal-body" style="max-height: 500px; overflow-x: scroll;">
                            <input type="hidden" id="PID" />
                            <div class="container">
                                <div>
                                    <label>ProductName</label>
                                    <input type="text" placeholder="Enter ProductName" id="ProductName" name="ProductName" class="form-control" />
                                    <span id="Error_ProductName" class="err text-danger" hidden="hidden">ProductName is required</span>
                                    <br />
                                </div>

                                <div>
                                    <label>Category</label>
                                    <br />
                                    <%--<asp:DropDownList ID="ddlCountry" runat="server" class="form-control" />--%>
                                    <select name="Category" id="ddlCategory" class="form-control">
                                    </select>

                                    <br />
                                </div>

                                <div>
                                    <label>Price</label>
                                    <input type="text" placeholder="Enter Price" id="Price" name="Price" class="form-control" />
                                    <span id="Error_Price" class="err text-danger" hidden="hidden">Price is required</span>
                                    <br />
                                </div>



                                <div>
                                    <label>Image</label>
                                    <input type="file" id="Image" />
                                    <%--<input type="button" id="fileButton" value="Upload" /><br />--%>
                                    <br />
                                    <img src="UploadedFiles/No-image-found.jpg" alt="" id="impPrev" height="90" width="90" />

                                    <br />
                                </div>

                                <div>
                                    <span id="msg"></span>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">

                            <a href="ViewProduct.aspx" id="submit" class="btn-primary btn btn-default">Save</a>
                           <%-- <button type="submit" id="submit" class="btn-primary btn btn-default">Save</button>--%>

                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div>

            <asp:DataList ID="DataList1" RepeatColumns="6" runat="server" BorderWidth="0" CellPadding="10" ForeColor="#000" RepeatDirection="Horizontal">

                <ItemTemplate>

                    <div id="product_<%# Eval("ProductID") %>" class="product-container">
                        <div>
                            <p class="text-center">
                                <asp:Image ID="Image" class="all-prod-img" runat="server" Width="200" Height="200" ImageUrl='<%# Eval("Image")%>' ImageAlign="Middle" ClientIDMode="Static" data-zoom-image='<%# Eval("Image")%>' />
                            </p>
                        </div>
                        <div class="example">
                            <div class="ddd-truncated">
                                <p class="text-center">
                                    <asp:Label ID="lblProductName" class="class-readmore" runat="server" Text='<%# Eval("ProductName") %>' ClientIDMode="Static"></asp:Label>
                                    <a class="toggle" href="#"></a>
                                </p>
                            </div>
                        </div>

                        <div>
                            <p id="prod_Price" class="text-center">Price:<i class="fa fa-rupee"></i><label id="lblPrice"><%# Eval("Price") %></label></p>
                        </div>
                        <p class="text-center">
                            <asp:Button ID="btnAddToCart" runat="server" Text="AddToCart" class="btn btn-warning text-center" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>' ClientIDMode="Static" OnClientClick="return false;" />
                        </p>
                    </div>





                </ItemTemplate>

            </asp:DataList>

            <br />
            <br />
        </div>

        <div id="AddCartModel" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                         <a href="CartDetails.aspx" class="btn btn-default" style="margin-left:490px;">Cart</a>
                        <h3 class="modal-title"></h3>
                    </div>
                    <div class="modal-body">

                        <div class="container">

                            <div>
                                <label id="lbl1">Product Added to Cart.....</label>

                            </div>

                        </div>

                    </div>
                    <div class="modal-footer">
                       
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
