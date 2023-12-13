using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class ViewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve user data from the database
                FetchAndDisplayUserData();
            }
        }

        private void FetchAndDisplayUserData()
        {
            string connectionString =  @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM customerr";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // Read user data from the database
                    string username = reader["username"].ToString();
                    string userId = reader["cust_id"].ToString();
                    string mobile = reader["mobile_no"].ToString();
                    string postCode = reader["post_code"].ToString();
                    string createDate = ((DateTime)reader["create_date"]).ToString("yyyy-MM-dd");
                    string imageUri = reader["image_uri"].ToString();

                    // Dynamically create HTML for each user
                    string userHtml = $@"
                        <div class='userCard'>
                            <div class='userImage'>
                                <img src='{imageUri}' alt='User Image' />
                            </div>
                            <div class='userInfo'>
                                <p class='userName'>{username}</p>
                                <p class='userId'>User ID: {userId}</p>
                                <p class='userMobile'>Mobile: {mobile}</p>
                                <p class='userPostCode'>Post Code: {postCode}</p>
                                <p class='userCreateDate'>Created Date: {createDate}</p>
                            </div>
                        </div>
                    ";

                    // Add the user HTML to the page
                    userContainer.InnerHtml += userHtml;
                }

                reader.Close();
            }
        }
    }
}
