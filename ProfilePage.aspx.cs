using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Reflection.Emit;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is authenticated
            if (Session["AuthenticatedUser"] != null)
            {
                // Retrieve user information from the session
                User authenticatedUser = (User)Session["AuthenticatedUser"];

                // Display user information on the page
                DisplayUserInfo(authenticatedUser);
            }
            else
            {
                // Redirect to the login page if the user is not authenticated
                Response.Redirect("LoginPage.aspx");
            }
        }

        private void DisplayUserInfo(User user)
        {
            // Set values for the profile picture and username
            profilePicture.ImageUrl = user.ImageUri;
            //usernameLabel.Text = user.Username;
            usernameLabel.InnerText = user.Username;

            // Display user information in the profile info section
            firstNameLabel.Text =  user.FirstName;
            lastNameLabel.Text =user.LastName;
            emailLabel.Text = user.Username; // Update with the actual property in your User class
            idLabel.Text = "ID: " + user.CustId;
            mobileNumberLabel.Text = "Mobile Number: " + user.MobileNo;
            // Add more labels and display information as needed
        }
    }
}
