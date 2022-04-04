using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopCart
{
    public partial class CartDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetCartItems()
        {
            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {
                    List<ProductCart> cart = db.ProductCarts.ToList();

                    var data = (from pc in db.ProductCarts
                                join p in db.Products on pc.ProdID equals p.ProductID
                                select new CartModel()
                                {
                                    CartId = pc.CartID,
                                    ProdID = p.ProductID,
                                    ProdName = p.ProductName,
                                    Price= (int)p.Price,
                                    Qty = (int)pc.Qty,
                                    img = p.Image
                                }).ToList<CartModel>();
                

                    //List<CartModel> c = new List<CartModel>();
                    //foreach (var item in cart)
                    //{
                    //    c.Add(new CartModel()
                    //    {
                    //        CartId = item.CartID,
                    //        ProdID = (int)item.ProdID,
                    //        ProdName = item.ProdName,
                    //        Price = (int)item.Price,
                    //        Qty = (int)item.Qty,
                    //        img = "/UploadedFiles/lp2.jpg"


                    //    });

                    //}
                    var result = JsonConvert.SerializeObject(data);

                    return result;

                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        [WebMethod]
        public static string DeleteRecordByID(int ID)
        {

            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {
                    ProductCart cart = db.ProductCarts.Where(C => C.CartID == ID).SingleOrDefault();
                    db.ProductCarts.Remove(cart);
                    db.SaveChanges();

                    return "success";
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static string UpdateQtyByID(int ID, int Qty)
        {

            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {
                    ProductCart cart = db.ProductCarts.Where(C => C.CartID == ID).SingleOrDefault();
                    cart.Qty = Qty;

                    var qty = cart.Qty;
                    db.SaveChanges();
                    return qty.ToString();

                }
                
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        

        [WebMethod]
        public static string AddOrderDetails(int Amt)
        {

            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {

                    UserOrder order = new UserOrder();

                    order.TotalAmt = Amt;
                    order.OrderNO = OrderCode();
                    order.OrderDate = Convert.ToDateTime(DateTime.Now.ToString());

                    db.UserOrders.Add(order);
                    db.SaveChanges();

                    List<UserOrder> orders = new List<UserOrder>();
                    orders = db.UserOrders.ToList();
                    int OrderID = 0;

                    foreach(var item in orders)
                    {
                        OrderID = item.OrderID;

                    }

                    List<ProductCart> cart = db.ProductCarts.ToList();

                    foreach(var item in cart)
                    {
                        OrderDetail detail = new OrderDetail();
                        detail.OrderID = OrderID;
                        detail.ProductID = item.ProdID;
                        detail.Qty = item.Qty;
                        detail.Amount = item.Qty * item.Price;

                        db.OrderDetails.Add(detail);
                        db.SaveChanges();
                    }

                    List<ProductCart> cart1 = db.ProductCarts.ToList();
                    foreach(var i in cart1)
                    {
                        db.ProductCarts.Remove(i);
                        db.SaveChanges();
                    }
                    

                    return "success";
                }

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static string OrderCode()
        {
            string orderstr="O000";
            string ordercode = "";

            int i = 1;
            ordercode = orderstr + i;
            string p = i.ToString();
            int q = p.Length;
            int r = orderstr.Length - q;
            string y = ordercode.Substring(0, r);
            ordercode = y + i;

            return ordercode;
        }

    }
}