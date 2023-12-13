<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.ViewProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Products</title>
    <style>


                #adminDetails {
    text-align: center;
    margin-bottom: 20px;
}

#adminProfile {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 10px;
}

#adminName {
    color: #fff;
    font-size: 0.8em;
    margin: 0;
}



        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

              #sidebar {
    width: 20%;
    max-height: 100vh; /* Set a maximum height */
    background-color: #333;
    color: #fff;
    position: fixed;
    left: 0;
    top: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 20px;
    overflow-y: auto; /* Add this line for vertical scrollbar */
}

        #sidebar a {
            display: block;
            padding: 15px;
            text-decoration: none;
            color: #fff;
            transition: background 0.3s;
            margin: 10px 0;
            position: relative;
        }

        #sidebar a::after {
            content: '';
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            height: 1px;
            background-color: #fff;
        }

        #sidebar a:hover {
            background: #555;
        }

        #content {
            margin-left: 20%; /* Adjusted to accommodate wider sidebar */
            width: 80%; /* Adjusted to accommodate wider sidebar */
            padding: 20px;
            text-align: center;
        }

        .product-container {
            border: 1px solid #ddd;
            border-radius: 12px; /* Increased border radius */
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            
            align-items: center;
        }

        .product-container img {
            width: 150px; /* Set your desired width */
            height: 150px; /* Set your desired height */
            object-fit: cover; /* Apply center crop property */
            border-radius: 8px;
            margin-right: 20px;
        }

        .product-info {
    text-align: left;
    display: flex;
    flex-direction: column;
    width: calc(100% - 120px); /* Adjusted width to span the full width of the content area */
}

        .product-name {
            font-size: 1.2em;
            margin-bottom: 5px;
        }

        .product-price {
            color: #4caf50;
            font-size: 1.1em;
            margin-bottom: 5px;
        }

        .product-description {
            font-size: 0.9em;
            margin-bottom: 5px;
        }

        .product-details {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-weight: bold;
            margin-bottom: 3px;
        }

        .detail-value {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    
            <!-- Sidebar content unchanged -->

             <form id="form2" runat="server">
        <div id="sidebar">
            <h2>Admin</h2>
            <div id="adminDetails">
                <img src="./Images/Profile.jpeg" alt="Admin Profile" id="adminProfile" />
                <p id="adminName">Admin Name</p>
            </div>
            <a href="AddProductPage.aspx">Add Product</a>
<a href="ViewProduct.aspx">View Product</a>
<a href="RemoveProduct.aspx">Remove Product</a>
<a href="UpdateProduct.aspx">Update Product</a>
<a href="ViewUser.aspx">View Users</a>
<a href="RemoveUser.aspx">View Order</a>
        </div>
    </div>


       

        <div id="content">
            <h3>Available Products</h3>

            <div class="product-container">
                <img src="./Images/wom2.jpeg" alt="Product 1">
                <div class="product-info">
                    <div class="product-name">Product 1 Name</div>
                    <div class="product-price">$19.99</div>
                    <div class="product-description">Description for Product 1 goes here.</div>
                    <div class="product-details">
                        <div class="detail-label">ID:</div>
                        <div class="detail-value">12345</div>
                        <div class="detail-label">Create Date:</div>
                        <div class="detail-value">2023-01-01</div>
                        <!-- Add more details as needed -->
                    </div>
                </div>
            </div>

            <div class="product-container">
                <img src="./Images/wom1.jpg" alt="Product 2">
                <div class="product-info">
                    <div class="product-name">Product 2 Name</div>
                    <div class="product-price">$29.99</div>
                    <div class="product-description">Description for Product 2 goes here.</div>
                    <div class="product-details">
                        <div class="detail-label">ID:</div>
                        <div class="detail-value">67890</div>
                        <div class="detail-label">Create Date:</div>
                        <div class="detail-value">2023-02-01</div>
                        <!-- Add more details as needed -->
                    </div>
                </div>
            </div>

            <div class="product-container">
    <img src="./Images/wom1.jpg" alt="Product 2">
    <div class="product-info">
        <div class="product-name">Product 2 Name</div>
        <div class="product-price">$29.99</div>
        <div class="product-description">Description for Product 2 goes here.</div>
        <div class="product-details">
            <div class="detail-label">ID:</div>
            <div class="detail-value">67890</div>
            <div class="detail-label">Create Date:</div>
            <div class="detail-value">2023-02-01</div>
            <!-- Add more details as needed -->
        </div>
    </div>
</div>

            <div class="product-container">
    <img src="./Images/wom1.jpg" alt="Product 2">
    <div class="product-info">
        <div class="product-name">Product 2 Name</div>
        <div class="product-price">$29.99</div>
        <div class="product-description">Description for Product 2 goes here.</div>
        <div class="product-details">
            <div class="detail-label">ID:</div>
            <div class="detail-value">67890</div>
            <div class="detail-label">Create Date:</div>
            <div class="detail-value">2023-02-01</div>
            <!-- Add more details as needed -->
        </div>
    </div>
</div>

            <!-- Add more product containers as needed -->

        </div>
    </form>
</body>
</html>
