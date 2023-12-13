using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace ShopVista__Ecommerce_Web_App_
{
    public class Customer
    {
        public int CustId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string PhoneNo { get; set; }
        public string Address { get; set; }
        public string Date { get; set; }
        public string ImageUri { get; set; }
    }

    public partial class Sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void startButton_click(object sender, EventArgs e)
        {
            DateTime currentDateTime = DateTime.Now;
            string formattedDateTime = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");
            string imageUri = null;

            if (fileUpload.HasFile)
            {
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileUpload.FileName);
                string filePath = Server.MapPath("~/Images/UploadedImages/" + fileName);
                fileUpload.SaveAs(filePath);
                imageUri = "/Images/UploadedImages/" + fileName;
            }

            Customer newCustomer = new Customer
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Email = txtEmail.Text,
                Password = txtPassword.Text,
                PhoneNo = txtMobileNumber.Text,
                Address = txtAddress.Text,
                Date = formattedDateTime,
                ImageUri = imageUri
            };

            DataAccess dataAccess = new DataAccess();
            dataAccess.InsertCustomer(newCustomer);
            Response.Redirect("LoginPage.aspx");
        }
    }

    public class DataAccess
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        public void InsertCustomer(Customer customer)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if the user already exists
                if (UserExists(connection, customer.Email))
                {
                   
                    throw new Exception("User with the same email already exists.");
                }

                // Insert the new user
                string query = "INSERT INTO customerr (username, password, first_name, last_name, mobile_no, post_code, create_date, image_uri) " +
                               "VALUES (@Username, @Password, @FirstName, @LastName, @MobileNo, @PostCode, @CreateDate, @ImageUri)";
                SqlCommand cmd = new SqlCommand(query, connection);

                cmd.Parameters.AddWithValue("@Username", customer.Email); // Assuming Email is used as the username
                cmd.Parameters.AddWithValue("@Password", customer.Password);
                cmd.Parameters.AddWithValue("@FirstName", customer.FirstName);
                cmd.Parameters.AddWithValue("@LastName", customer.LastName);
                cmd.Parameters.AddWithValue("@MobileNo", customer.PhoneNo);
                cmd.Parameters.AddWithValue("@PostCode", customer.Address); // Assuming Address is used as the post_code
                cmd.Parameters.AddWithValue("@CreateDate", customer.Date);
                cmd.Parameters.AddWithValue("@ImageUri", customer.ImageUri);

                cmd.ExecuteNonQuery();
            }
        }

        private bool UserExists(SqlConnection connection, string email)
        {
            string query = "SELECT COUNT(*) FROM customerr WHERE username = @Username";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@Username", email);

            int count = (int)cmd.ExecuteScalar();
            return count > 0;
        }
    }
}
