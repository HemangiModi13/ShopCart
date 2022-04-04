using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopCart
{
    public class Details
    {
        public int ProductID { get; set; }
        public string  ProductName { get; set; }
        public int CategoryID { get; set; }
        public string Image { get; set; }
        public int Price { get; set; }
        public string FileInput { get; set; }
        public HttpPostedFileBase file { get; set; }

    }

    public class CategoryModel
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }

    }

    public class CartModel
    {
        public int CartId { get; set; }
        public int ProdID { get; set; }
        public string ProdName { get; set; }
        public int Price { get; set; }
        public int Qty { get; set; }
        public string img { get; set; }
    }

    public class ProductModel
    {
        public int CartID { get; set; }
        public int ProdID { get; set; }
        
        public int Price { get; set; }
        public int Qty { get; set; }
    }
}