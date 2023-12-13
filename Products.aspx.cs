using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public string ImageUri { get; set; }

        public Product(int productId, string productName, decimal price, string imageUri)
        {
            ProductId = productId;
            ProductName = productName;
            Price = price;
            ImageUri = imageUri;
        }
    }

    public partial class Products : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
           // if (!IsPostBack)
            //{
                LoadProducts();
           
            //}
        }

        private void LoadProducts()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM productt"; // Assuming isActive indicates an active product
                    SqlCommand cmd = new SqlCommand(query, connection);
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Find the existing placeholder in your HTML with the correct ID
                    Control existingDiv = FindControl("yourExistingDiv");
                    //Control existingDiv = Page.FindControl("yourExistingDiv");

                    if (existingDiv != null && existingDiv is HtmlGenericControl)
                    {
                        HtmlGenericControl productContainer = (HtmlGenericControl)existingDiv;

                        while (reader.Read())
                        {
                            string productName = reader["product_name"].ToString();
                            decimal price = Convert.ToDecimal(reader["price"]);
                            string imageUri = reader["image_uri"].ToString();

                            // Create a new product
                            Product product = new Product(
                                Convert.ToInt32(reader["product_id"]),
                                productName,
                                price,
                                imageUri
                            );

                            // Create product card dynamically
                            Panel productCard = new Panel();
                            productCard.CssClass = "product-card";

                            // ... (rest of the code for creating product card controls)

                            // Create an image control
                            Image productImage = new Image();
                            productImage.CssClass = "product-image";
                            productImage.ImageUrl = $"~{imageUri}";
                            // productImage.ImageUrl = $"~/Images/{product.ImageUri}";
                            productImage.AlternateText = product.ProductName;
                            productCard.Controls.Add(productImage);


                        
                            // Create a product name div
                            Panel productNameDiv = new Panel();
                            productNameDiv.CssClass = "product-name";
                            Label productNameLabel = new Label();
                            productNameLabel.Text = product.ProductName;
                            productNameDiv.Controls.Add(productNameLabel);
                            productCard.Controls.Add(productNameDiv);

                            // Create a product price div
                            Panel productPriceDiv = new Panel();
                            productPriceDiv.CssClass = "product-price";
                            Label productPriceLabel = new Label();
                            productPriceLabel.Text = $"{product.Price:C}";
                            productPriceDiv.Controls.Add(productPriceLabel);
                            productCard.Controls.Add(productPriceDiv);

                            // Create an "Add to Cart" button
                            Button addToCartButton = new Button();
                            addToCartButton.CssClass = "add-to-cart";
                            addToCartButton.Text = "Add to Cart";
                            productCard.Controls.Add(addToCartButton);
                            addToCartButton.CommandArgument = product.ProductId.ToString();

                            // Add a click event handler for the "Add to Cart" button
                            addToCartButton.Click += (s, args) =>
                            {
                                // Get the product ID from the clicked button's command argument
                                if (s is Button button)
                                {
                                    if (int.TryParse(button.CommandArgument, out int productId))
                                    {
                                        // Get the customer ID (you need to set this based on your authentication logic)
                                        int customerId = GetCustomerId(); // You need to implement this method

                                        // Add the product to the cart
                                        AddToCart(customerId, productId);
                                    }
                                    else
                                    {
                                        // Handle the case where the CommandArgument is not a valid integer
                                        Response.Write("Invalid product ID");
                                    }
                                }
                                else
                                {
                                    // Handle the case where the sender is not a Button
                                    Response.Write("Invalid sender type");
                                }
                            };




                            // Add the product card to the product container
                            productContainer.Controls.Add(productCard);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log or display an error message)
            }
        }


        private void AddToCart(int customerId, int productId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Check if the product is already in the cart for the customer
                    string checkQuery = "SELECT COUNT(*) FROM cartt WHERE cust_id = @customerId AND product_id = @productId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, connection);
                    checkCmd.Parameters.AddWithValue("@customerId", customerId);
                    checkCmd.Parameters.AddWithValue("@productId", productId);

                    int existingCartItemsCount = (int)checkCmd.ExecuteScalar();

                    if (existingCartItemsCount == 0)
                    {
                        // If the product is not in the cart, add it
                        string insertQuery = "INSERT INTO cartt (cust_id, product_id, Quantity) VALUES (@customerId, @productId, 1)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, connection);
                        insertCmd.Parameters.AddWithValue("@customerId", customerId);
                        insertCmd.Parameters.AddWithValue("@productId", productId);

                        insertCmd.ExecuteNonQuery();

                        // You can add a success message or perform other actions if needed
                    }
                    else
                    {
                        // Product is already in the cart, you can show a message if needed
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log or display an error message)
            }
        }




        private int GetCustomerId()
        {
            if (Session["AuthenticatedUser"] != null)
            {
                // Retrieve user information from the session
                User authenticatedUser = (User)Session["AuthenticatedUser"];
                int id = authenticatedUser.CustId;
                return id;


            }
            else
            {
                // Redirect to the login page if the user is not authenticated
                Response.Redirect("LoginPage.aspx");
            }
            return 0;

        }

    }
}
