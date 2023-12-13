using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class AddProductPage : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                // Get values from form controls
                string productName = this.productName.Text;
                string productDescription = this.description.Text;
                int price = Convert.ToInt32(this.productPrice.Text);
                int quantity = 10; // You might want to add a quantity field in your form
                DateTime createDate = DateTime.Now;

                // Validate data (you might want to add more validation)
                if (string.IsNullOrEmpty(productName) || string.IsNullOrEmpty(productDescription))
                {
                    // Display an error message
                    lblMessage.Text = "Please fill in all required fields.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Handle file upload
                string imageUri = UploadFile();

                // Insert data into the database
               
                //string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO productt (product_name, prod_description, price, isActive, Quantity, image_uri, create_date) " +
                                   "VALUES (@ProductName, @ProductDescription, @Price, 1, @Quantity, @ImageUri, @CreateDate)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ProductName", productName);
                        command.Parameters.AddWithValue("@ProductDescription", productDescription);
                        command.Parameters.AddWithValue("@Price", price);
                        command.Parameters.AddWithValue("@Quantity", quantity);
                        command.Parameters.AddWithValue("@ImageUri", imageUri);
                        command.Parameters.AddWithValue("@CreateDate", createDate);

                        connection.Open();
                        command.ExecuteNonQuery();

                        // Display success message
                        lblMessage.Text = "Product added successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }

                // Redirect to a success page or display a success message
                // Response.Redirect("SuccessPage.aspx");
            }
            catch (Exception ex)
            {
                // Handle the exception (display an error message or log the error)
                lblMessage.Text = "Error adding product. Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private string UploadFile()
        {
            if (Image.HasFile)
            {
                try
                {
                    // Get the file extension
                    string fileExtension = Path.GetExtension(Image.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (Array.IndexOf(allowedExtensions, fileExtension) == -1)
                    {
                        lblMessage.Text = "Invalid file type. Please upload a valid image file.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return string.Empty;
                    }

                    string fileName = Guid.NewGuid().ToString() + fileExtension;
                    string filePath = Server.MapPath("~/Images/UploadedImages/") + fileName;

                    Image.SaveAs(filePath);

                    return "/Images/UploadedImages/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading file. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return string.Empty;
                }
            }
            return string.Empty;
        }
    }
}
