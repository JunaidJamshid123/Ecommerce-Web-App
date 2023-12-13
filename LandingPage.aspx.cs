using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void startButton_click(object sender, EventArgs e)
        {
        Response.Redirect("LoginPage.aspx");
               
        }

        protected void login_click(object sender, EventArgs e)
        {
            // Redirect to the login page
            Response.Redirect("LoginPage.aspx");
        }

        protected void signup_click(object sender, EventArgs e)
        {
            // Redirect to the signup page
            Response.Redirect("Sign_up.aspx");
        }


    }
}
