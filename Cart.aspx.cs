using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class Cart : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // This is the event handler for the checkout button click
            // You can add your logic here for processing the checkout

            // For example, you might want to redirect the user to a checkout page
            Response.Redirect("Payment.aspx");
        }


        private void LoadCartItems()
        {
            try
            {
                // Get the customer ID (you need to set this based on your authentication logic)
                int customerId = GetCustomerId(); // You need to implement this method

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Select cart items for the current customer
                    string query = "SELECT c.cart_id, p.product_name, p.price, c.Quantity, p.image_uri FROM cartt c " +
                                   "INNER JOIN productt p ON c.product_id = p.product_id " +
                                   "WHERE c.cust_id = @customerId";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@customerId", customerId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    int totalItems = 0;
                    decimal totalPayment = 0;
                    int totalQuantity = 0;


                    while (reader.Read())
                    {
                        // Read data from the cart
                        int cartId = Convert.ToInt32(reader["cart_id"]);
                        string productName = reader["product_name"].ToString();
                        decimal price = Convert.ToDecimal(reader["price"]);
                        int quantity = Convert.ToInt32(reader["Quantity"]);
                        string imageUri = reader["image_uri"].ToString(); // Add this line for the image URI
                        totalItems++;
                        totalPayment += (price * quantity);
                        totalQuantity += quantity;


                        // Create a cart item dynamically
                        Panel cartItem = new Panel();
                        cartItem.CssClass = "cart-item";
                        cartItem.Style.Add("display", "flex");
                        cartItem.Style.Add("align-items", "center");
                        cartItem.Style.Add("padding", "10px");

                        // Create an image control
                        Image productImage = new Image();
                        productImage.CssClass = "product-image";
                        productImage.ImageUrl = ResolveUrl(imageUri);
                        productImage.AlternateText = "Product Image";
                        productImage.Style.Add("margin-right", "20px"); // Add some spacing to the right
                        cartItem.Controls.Add(productImage);

                        // Create a product info div
                        Panel productInfoDiv = new Panel();
                        productInfoDiv.CssClass = "product-info";

                        // Create a product name label
                        Label productNameLabel = new Label();
                        productNameLabel.CssClass = "product-name";
                        productNameLabel.Text = productName;
                        productNameLabel.Style.Add("margin-bottom", "10px"); // Add some spacing below
                        productInfoDiv.Controls.Add(productNameLabel);

                        // Create a product price label
                        Label productPriceLabel = new Label();
                        productPriceLabel.CssClass = "product-price";
                        productPriceLabel.Text = $"{price:C}";
                        productPriceLabel.Style.Add("margin-bottom", "10px"); // Add some spacing below
                        productInfoDiv.Controls.Add(productPriceLabel);

                        // Create a quantity label
                        Label quantityLabel = new Label();
                        quantityLabel.CssClass = "quantity";
                        quantityLabel.Text = $"Quantity: {quantity}";
                        productInfoDiv.Controls.Add(quantityLabel);

                        // Add the product info div to the cart item
                        cartItem.Controls.Add(productInfoDiv);

                        // Add the cart item to the page
                        cartItemsContainer.Controls.Add(cartItem);
                    }

                    lblTotalItems.Text = totalItems.ToString();
                    lblTotalPayment.Text = $"{totalPayment:C}";
                    lblTotalQuantity.Text = totalQuantity.ToString();
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
