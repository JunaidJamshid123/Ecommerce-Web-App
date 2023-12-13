﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveProduct.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.RemoveProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
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
            margin-left: 7%;
            width: 86%;
            padding: 20px;
            text-align: center;
        }

        #addProductForm {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: left;
        }

        #addProductForm h3 {
            font-size: 1.5em;
            margin-bottom: 20px;
            text-align: center;
        }

        #addProductForm label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 0.8em;
        }

        #addProductForm input,
        #addProductForm textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            font-size: 0.9em;
        }

        #addProductForm button {
            background-color: #a71010;
            color: #fff;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            font-size: 1em;
            width: 100%;
        }

        #addProductForm button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="sidebar">
            <h2>Admin</h2>

             <div id="adminDetails">
        <img src="./Images/Profile.jpeg" alt="Admin Profile" id="adminProfile" />
        <p id="adminName">Junaid Jamshid</p>
    </div>

             <a href="AddProductPage.aspx">Add Product</a>
 <a href="AddProductPage.aspx">Add Product</a>
<a href="ViewProduct.aspx">View Product</a>
<a href="RemoveProduct.aspx">Remove Product</a>
<a href="UpdateProduct.aspx">Update Product</a>
<a href="ViewUser.aspx">View Users</a>
<a href="RemoveUser.aspx">View Order</a>
        </div>

        <div id="content">
            <div id="addProductForm">
                <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label>

                <h3>Remove Product</h3>

                <form>
                    <asp:Label runat="server" AssociatedControlID="productNameTextBox" Text="Enter Product Name:"></asp:Label>
<asp:TextBox runat="server" ID="productNameTextBox" required="required"></asp:TextBox>

<asp:Label runat="server" AssociatedControlID="productPriceTextBox" Text="Enter Product Price:"></asp:Label>
<asp:TextBox runat="server" ID="productPriceTextBox" required="required"></asp:TextBox>

<asp:Label runat="server" AssociatedControlID="productIDTextBox" Text="Enter Product ID:"></asp:Label>
<asp:TextBox runat="server" ID="productIDTextBox" required="required"></asp:TextBox>


                     <asp:Button runat="server" ID="btnRemoveProduct" Text="Remove Product" OnClick="btnRemoveProduct_Click" />

                </form>
            </div>
        </div>
    </form>
</body>
</html>
