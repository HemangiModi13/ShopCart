using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;

namespace ShopCart
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindData();
                CountCartData();
            }

        }
        public void CountCartData()
        {
            using (ShoppingCartContext db = new ShoppingCartContext())
            {
                string cnt = db.ProductCarts.Count().ToString();

                cartcnt.Text = cnt;
            }
            
        }
        public void BindData()
        {
            using (ShoppingCartContext db = new ShoppingCartContext())
            {
                var data = db.Products.Select(p => p);
                DataList1.DataSource = data.ToList();
                DataList1.DataBind();
            }
        }

        [WebMethod]
        public static string GetCategory()
        {
            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {

                    List<Category> category = db.Categories.ToList();
                    List<CategoryModel> c = new List<CategoryModel>();
                    foreach (var item in category)
                    {
                        c.Add(new CategoryModel()
                        {
                            CategoryID = item.CategoryID,
                            CategoryName = item.CategoryName
                        });

                    }
                    var data = JsonConvert.SerializeObject(c);

                    return data;

                }
            }
            catch (Exception ex)
            {

                return null;
            }

        }


        
        [WebMethod]
        public static string SaveProduct(Details Prods)
        {
            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {

                    //if (HttpContext.Current.Request.Files.Count > 0)
                    //{
                    //    var ipfile = HttpContext.Current.Request.Files[0];
                    //    if (ipfile != null && ipfile.ContentLength > 0)
                    //    {
                    //        var filename = Path.GetFileName(ipfile.FileName);
                    //        var path = "/UploadedFiles/" + filename;

                    //        ipfile.SaveAs( HttpContext.Current.Server.MapPath(path));

                    //    }
                    //}

                    //var ipfile = Prods.FileInput;
                    //if (ipfile != null)
                    //{
                    //    //var filename = Path.GetFileName(ipfile.FileName);
                    //    var filename = Prods.Image;
                    //    var path = "/UploadedFiles/" + filename;

                    //    ipfile.SaveAs(HttpContext.Current.Server.MapPath(path));

                    //}

                    Product product = new Product();

                    product.ProductName = Prods.ProductName;
                    product.Image = "/UploadedFiles/" + Prods.Image;
                    product.CategoryID = Prods.CategoryID;
                    product.Price = Prods.Price;
                    
                    db.Products.Add(product);
                    db.SaveChanges();

                }
                
                return "success";
                

            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }


        [WebMethod]
        public static string AddCart(ProductModel prodcarts)
        {
            try
            {
                using (ShoppingCartContext db = new ShoppingCartContext())
                {

                    

                    ProductCart productcart = new ProductCart();

                    productcart.ProdID = prodcarts.ProdID;
                    
                    productcart.Price = prodcarts.Price;
                    productcart.Qty = prodcarts.Qty;

                    db.ProductCarts.Add(productcart);
                    db.SaveChanges();

                }
                return "success";
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
    }
}

