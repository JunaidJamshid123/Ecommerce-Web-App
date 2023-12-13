using System;
using System.Data.SqlClient;

namespace ShopVista__Ecommerce_Web_App_
{
    public class User
    {
        public int CustId { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MobileNo { get; set; }
        public DateTime CreateDate { get; set; }
        public string ImageUri { get; set; }
    }
    public partial class LoginPage : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_click(object sender, EventArgs e)
        {
            string enteredUsernameOrEmail = txtUsername.Text;
            string enteredPassword = txtPassword.Text;

            // Check if the user is a regular user
            User regularUser = AuthenticateRegularUser(enteredUsernameOrEmail, enteredPassword);

            if (regularUser != null)
            {
                // Store user information in a session variable
                Session["AuthenticatedUser"] = regularUser;

                // Redirect to the home page or another page for regular users
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // Check if the user is an admin
                if (IsAdmin(enteredUsernameOrEmail, enteredPassword))
                {
                    // Redirect to admin page if the user is an admin
                    Response.Redirect("AddProductPage.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Invalid username or password. Please try again.";
                    lblErrorMessage.Visible = true;
                }
            }
        }

        private User AuthenticateRegularUser(string usernameOrEmail, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM customerr WHERE username = @username AND password = @password";
                    SqlCommand cmd = new SqlCommand(query, connection);

                    cmd.Parameters.AddWithValue("@username", usernameOrEmail);
                    cmd.Parameters.AddWithValue("@password", password); // Plain text password

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        User authenticatedUser = new User
                        {
                            CustId = Convert.ToInt32(reader["cust_id"]),
                            Username = reader["username"].ToString(),
                            FirstName = reader["first_name"].ToString(),
                            LastName = reader["last_name"].ToString(),
                            MobileNo = reader["mobile_no"].ToString(),
                            CreateDate = Convert.ToDateTime(reader["create_date"]),
                            ImageUri = reader["image_uri"].ToString()
                        };

                        return authenticatedUser;
                    }

                    return null; // Authentication failed
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return null;
            }
        }

        private bool IsAdmin(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT COUNT(*) FROM adminn WHERE username = @username AND password = @password";
                    SqlCommand cmd = new SqlCommand(query, connection);

                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password); // Plain text password

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return false;
            }
        }
    }
}
