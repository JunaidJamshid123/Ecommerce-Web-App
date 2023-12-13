using System;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

namespace ShopVista__Ecommerce_Web_App_
{
    public partial class Payment : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-GOQOV6Q\SQLEXPRESS;Initial Catalog=Shopvista2;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Your initialization logic here
        }

        private bool AreAllFieldsFilled()
        {
            // Check if all fields are filled
            return !string.IsNullOrWhiteSpace(txtFullName.Text) &&
                   !string.IsNullOrWhiteSpace(txtEmail.Text) &&
                   !string.IsNullOrWhiteSpace(txtAddress.Text) &&
                   !string.IsNullOrWhiteSpace(txtCity.Text) &&
                   !string.IsNullOrWhiteSpace(txtState.Text) &&
                   !string.IsNullOrWhiteSpace(txtZipCode.Text) &&
                   !string.IsNullOrWhiteSpace(txtNameOnCard.Text) &&
                   !string.IsNullOrWhiteSpace(txtCreditCardNumber.Text) &&
                   !string.IsNullOrWhiteSpace(txtExpMonth.Text) &&
                   !string.IsNullOrWhiteSpace(txtExpYear.Text) &&
                   !string.IsNullOrWhiteSpace(txtCVV.Text);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            // Get data from the form
            if (AreAllFieldsFilled())
            {
                // Proceed with your logic here
                string fullName = txtFullName.Text;
                string email = txtEmail.Text;
                string address = txtAddress.Text;
                string city = txtCity.Text;
                string state = txtState.Text;
                string zipCode = txtZipCode.Text;

                string nameOnCard = txtNameOnCard.Text;
                string creditCardNumber = txtCreditCardNumber.Text;
                string expMonth = txtExpMonth.Text;
                int expYear = Convert.ToInt32(txtExpYear.Text);
                string cvv = txtCVV.Text;

                try
                {
                    // Insert data into the Payment table

                    int customerId = GetCustomerId();
                    int paymentId = InsertPayment(customerId, nameOnCard, creditCardNumber, expMonth, expYear, cvv, address);

                    // Insert data into the Orders table
                    int productId = GetProductId();
                    int quantity = GetQuantity();
                    string orderStatus = "Pending";
                    string orderDescription = "Order placed successfully";
                    string orderNumber = GenerateOrderNumber();
                    InsertOrder(orderNumber, customerId, paymentId, productId, quantity, orderStatus, orderDescription);

                    // Redirect to the order confirmation page
                    // Handle the exception (log or display an error message)
                    lblError.Text ="Ordered Placed Successfully...................Thanks";
                    lblError.Visible = true;
                }
                catch (Exception ex)
                {
                    // Handle the exception (log or display an error message)
                    lblError.Text = "An error occurred during payment processing. Please try again.";
                    lblError.Visible = true;
                }
                // ...
                lblError.Text = ""; // Clear any previous error messages
            }
            else
            {
                lblError.Text = "Please fill in all the required fields.";
               
                lblError.Visible = true;
            }

           
        }

        private int GetCustomerId()
        {
            if (Session["AuthenticatedUser"] != null)
            {
                User authenticatedUser = (User)Session["AuthenticatedUser"];
                return authenticatedUser.CustId;
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
                return 0;
            }
        }

        private int InsertPayment(int customerId, string nameOnCard, string creditCardNumber, string expMonth, int expYear, string cvv, string address)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"INSERT INTO paymentt (cust_id, payment_name, card_no, payment_date, payment_amount, cvvNo, addresss)
                                VALUES (@customerId, @nameOnCard, @creditCardNumber, GETDATE(), 0, @cvv, @address);
                                SELECT SCOPE_IDENTITY();"; // Return the last inserted identity (payment_id)

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.Parameters.AddWithValue("@nameOnCard", nameOnCard);
                    cmd.Parameters.AddWithValue("@creditCardNumber", creditCardNumber);
                    cmd.Parameters.AddWithValue("@cvv", cvv);
                    cmd.Parameters.AddWithValue("@address", address);

                    // Execute the query and return the last inserted identity (payment_id)
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        private int GetProductId()
        {
            // Implement logic to get the product ID from the cart
            // Replace this with your actual logic
            return 9; // Placeholder value, replace with your actual logic
        }

        private int GetQuantity()
        {
            // Implement logic to get the quantity from the cart
            // Replace this with your actual logic
            return 2; // Placeholder value, replace with your actual logic
        }

        private string GenerateOrderNumber()
        {
            // You can customize the order number generation logic as needed
            // For simplicity, this example generates a random number and concatenates it with a prefix

            Random random = new Random();
            string orderNumber = "ORD" + random.Next(1000, 9999).ToString(); // Example: ORD1234

            return orderNumber;
        }

        private void InsertOrder(String orderNumber, int customerId, int paymentId, int productId, int quantity, string orderStatus, string orderDescription)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

               

                string query = @"INSERT INTO orderss (orderNo, cust_id, payment_id, product_id, Quantity, order_status, order_description, order_date)
                        VALUES (@orderNumber, @customerId, @paymentId, @productId, @quantity, @orderStatus, @orderDescription, GETDATE());";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@orderNumber", orderNumber);
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.Parameters.AddWithValue("@paymentId", paymentId);
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@orderStatus", orderStatus);
                    cmd.Parameters.AddWithValue("@orderDescription", orderDescription);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
