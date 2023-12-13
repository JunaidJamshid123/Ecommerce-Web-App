using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                // Get values from form controls
                int productID;
                if (!int.TryParse(this.productID.Text, out productID))
                {
                    DisplayMessage("Invalid Product ID.", Color.Red);
                    return;
                }

                string newProductName = this.newproductName.Text;
                string newProductDescription = this.description.Text; // Assuming the same description for simplicity
                int newProductPrice;
                if (!int.TryParse(this.newproductPrice.Text, out newProductPrice) || newProductPrice <= 0)
                {
                    DisplayMessage("Invalid product price.", Color.Red);
                    return;
                }

                string newCategory = this.category.Text;
                DateTime createDate = DateTime.Now;

                // Handle file upload
                string newImageUri = UploadFile();

                // Update data in the database
                if (UpdateProductInDatabase(productID, newProductName, newProductDescription, newProductPrice, newCategory, newImageUri, createDate))
                {
                    DisplayMessage("Product updated successfully!", Color.Green);
                }
                else
                {
                    DisplayMessage("Product not found or not updated. Please check the product ID.", Color.Red);
                }
            }
            catch (Exception ex)
            {
                // Log the exception for further investigation
                DisplayMessage($"Error updating product. {ex.Message}", Color.Red);
            }

        }

        private bool UpdateProductInDatabase(int productID, string newProductName, string newProductDescription, int newProductPrice, string newCategory, string newImageUri, DateTime createDate)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE productt " +
                               "SET product_name = @NewProductName, prod_description = @NewProductDescription, " +
                               "price = @NewProductPrice, image_uri = @NewImageUri, create_date = @CreateDate " +
                               "WHERE product_id = @ProductID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewProductName", newProductName);
                    command.Parameters.AddWithValue("@NewProductDescription", newProductDescription);
                    command.Parameters.AddWithValue("@NewProductPrice", newProductPrice);
                    command.Parameters.AddWithValue("@NewCategory", newCategory);
                    command.Parameters.AddWithValue("@NewImageUri", newImageUri);
                    command.Parameters.AddWithValue("@CreateDate", createDate);
                    command.Parameters.AddWithValue("@ProductID", productID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }

        private string UploadFile()
        {
            if (image.HasFile)
            {
                try
                {
                    using (System.Drawing.Image img = System.Drawing.Image.FromStream(image.PostedFile.InputStream))
                    {
                        if (img.RawFormat.Equals(ImageFormat.Jpeg) || img.RawFormat.Equals(ImageFormat.Png) ||
                            img.RawFormat.Equals(ImageFormat.Gif))
                        {
                            string fileExtension = Path.GetExtension(image.FileName).ToLower();
                            string fileName = Guid.NewGuid().ToString() + fileExtension;
                            string filePath = Server.MapPath("~/Images/UploadedImages/") + fileName;
                            image.SaveAs(filePath);
                            return "~/Images/UploadedImages/" + fileName;
                        }
                        else
                        {
                            DisplayMessage("Invalid image format. Please upload a valid image file.", Color.Red);
                        }
                    }
                }
                catch (Exception ex)
                {
                    DisplayMessage("Error uploading file. Please try again.", Color.Red);
                }
            }
            return string.Empty;
        }

        private void DisplayMessage(string message, Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }
    }
}
