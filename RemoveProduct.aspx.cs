using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class RemoveProduct : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRemoveProduct_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the product ID from the input field
                if (int.TryParse(productIDTextBox.Text, out int productID))
                {
                    // Remove the product from the database
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "DELETE FROM productt WHERE product_id = @ProductID";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@ProductID", productID);

                            connection.Open();
                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                // Display success message
                                DisplayMessage("Product removed successfully!", Color.Green);
                            }
                            else
                            {
                                // Display error message if no rows were affected (product not found)
                                DisplayMessage("Product not found or not removed. Please check the product ID.", Color.Red);
                            }
                        }
                    }
                }
                else
                {
                    // Display an error message if the entered product ID is not a valid integer
                    DisplayMessage("Please enter a valid product ID.", Color.Red);
                }
            }
            catch (Exception ex)
            {
                // Log the exception for further investigation
                DisplayMessage($"Error removing product. {ex.Message}", Color.Red);
            }
        }

        private void DisplayMessage(string message, Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = System.Drawing.ColorTranslator.FromHtml(ColorTranslator.ToHtml(color));
            // Implement the logic to display the message in your UI (e.g., set a label text)
        }
    }
}
