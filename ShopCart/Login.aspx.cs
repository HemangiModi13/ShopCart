using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopCart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string LoginUser(string UserName, string Password)
        {
            using (ShoppingCartContext db = new ShoppingCartContext())
            {
                User u = new User();


                var result = db.Users.Where(a => a.UserName.ToLower() == UserName.ToLower() && a.Password.ToLower() == Password.ToLower()).FirstOrDefault();

                if (result != null)
                {
                    return "success";
                }
                else
                {
                    return "error";
                }

            }
        }
    }
}