using System;
using System.Data.SqlClient;
using System.Runtime.Remoting.Contexts;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM productt WHERE isActive = 1"; // Assuming isActive indicates an active product
                    SqlCommand cmd = new SqlCommand(query, connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Control container = FindControl("form2");
                    while (reader.Read())
                    {
                        string productName = reader["product_name"].ToString();
                        string productDescription = reader["prod_description"].ToString();
                        int price = Convert.ToInt32(reader["price"]);
                        int product_id = Convert.ToInt32(reader["product_id"]);
                        string imageUri = reader["image_uri"].ToString();
                        DateTime createDate = Convert.ToDateTime(reader["create_date"]);

                        // Create a new product container
                        Panel productContainer = new Panel();
                        productContainer.CssClass = "product-container";

                        // Create an image control
                        Image productImage = new Image();
                        productImage.ImageUrl = $"~{imageUri}";
                        //productImage.ImageUrl = $"~/Images/UploadedImages/{imageUri}";
                        productImage.AlternateText = productName;
                        productContainer.Controls.Add(productImage);

                        // Create a product info div
                        Panel productInfo = new Panel();
                        productInfo.CssClass = "product-info";

                        // Add product details to product info div
                        Label nameLabel = new Label();
                        nameLabel.CssClass = "product-name";
                        nameLabel.Text = productName;
                        productInfo.Controls.Add(nameLabel);

                        Label priceLabel = new Label();
                        priceLabel.CssClass = "product-price";
                        priceLabel.Text = $"${price:F2}";
                        productInfo.Controls.Add(priceLabel);

                        Label descriptionLabel = new Label();
                        descriptionLabel.CssClass = "product-description";
                        descriptionLabel.Text = productDescription;
                        productInfo.Controls.Add(descriptionLabel);


                        Label idLabel = new Label();
                        idLabel.CssClass = "detail-label";
                        idLabel.Text = "ID:";
                        productInfo.Controls.Add(idLabel);

                        Label idValueLabel = new Label();
                        idValueLabel.CssClass = "detail-value";
                        idValueLabel.Text = product_id.ToString(); // Assuming productId is an integer variable
                        productInfo.Controls.Add(idValueLabel);

                        // Add create date label
                        Label createDateLabel = new Label();
                        createDateLabel.CssClass = "detail-label";
                        createDateLabel.Text = "Create Date:";
                        productInfo.Controls.Add(createDateLabel);

                        Label createDateValueLabel = new Label();
                        createDateValueLabel.CssClass = "detail-value";
                        createDateValueLabel.Text = createDate.ToString("yyyy-MM-dd"); // Assuming createDate is a DateTime variable
                        productInfo.Controls.Add(createDateValueLabel);

                        // Add more details as needed

                        productContainer.Controls.Add(productInfo);

                        // Add the product container to the content div
                        //content.Controls.Add(productContainer);
                        container.Controls.Add(productContainer);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log or display an error message)
            }
        }
    }
}
