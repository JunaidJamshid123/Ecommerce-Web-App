<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.ViewUser" %>

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



        /* Add this to your existing styles in the head tag */

#userContainer {
    display: inline;
    flex-wrap: wrap;
    justify-content: space-around;
    padding: 20px;
}

.userCard {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin: 10px;
    overflow: hidden;
    display: flex;
    width: 300px; /* Adjust the width as needed */
}

.userImage {
    width: 100px;
    height: 100px;
    overflow: hidden;
    border-radius: 50%;
    margin: 10px;
}

.userImage img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.userInfo {
    flex-grow: 1;
    padding: 10px;
    box-sizing: border-box;
}

.userName {
    font-size: 1.2em;
    font-weight: bold;
    margin: 0;
}

.userId,
.userMobile,
.userPostCode,
.userCreateDate {
    margin: 5px 0;
    font-size: 0.9em;
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
            <a href="ViewProduct.aspx">View Product</a>
            <a href="RemoveProduct.aspx">Remove Product</a>
            <a href="UpdateProduct.aspx">Update Product</a>
            <a href="ViewUser.aspx">View Users</a>
            <a href="RemoveUser.aspx">View Order</a>

        </div>


        <!-- Inside the body tag of your HTML -->
<div id="userContainer" runat="server"></div>

    <!-- Repeat the userCard structure for each user -->
        <br />

</div>



    </form>
</body>
</html>
