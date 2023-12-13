<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
    <meta charset="UTF-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
   
   <link rel="stylesheet" href="style.css"/>

    <style>




            @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&family=Bree+Serif&family=Poppins:wght@200;300;400;500;600&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        scroll-padding-top: 3rem;
        list-style: none;
        text-decoration: none;
        scroll-behavior: smooth;
        font-family: 'Poppins', sans-serif;
    }

    :root {
        --main-color: #f7444e;
        --second-color: #081b54;
    }

    section {
        padding: 50px 10%;
    }

    img {
        width: 100%;
    }

    *::selection {
        color: #fff;
        background: var(--main-color);
    }

    header {
        top: 0;
        right: 0;
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 10%;
        transition: 0.2s;
    }

    header.active {
        background: var(--second-color);
        box-shadow: 0 0 4px rgb(14 55 54 / 15%);
    }

    header.active .logo {
        color: #fff;
    }

    header.active .navbar a {
        color: #fff;
    }

    .logo {
        align-items: center;
        display: flex;
        font-size: 11rem;
        font-weight: 600;
        color: #000000;
    }

    .logo img {
        width: 150px;
        margin-right: 10px;
    }

    .navbar {
        display: flex;
    }

    .navbar a {
        font-size: 0.9rem;
        padding: 10px 20px;
        font-weight: 500;
        color: #000000
    }

    .navbar a:hover {
        color: #fff;
        background-color: var(--main-color);
        border-radius: 4px;
    }

    #menu-icon {
        font-size: 24px;
        cursor: pointer;
        z-index: 10001;
        display: none;
    }







        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .profile-header {
            background-color: #3498db;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        .profile-picture {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 5px solid #fff;
            margin-bottom: 20px;
            object-fit: cover;
        }

        .profile-info {
            padding: 20px;
        }

        .profile-info h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .profile-info p {
            margin: 5px 0;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

                <header>
    <a href="#" class="logo"><img src="./images/logo2.png" alt="Famms" /></a>
    <div class="bx bx-menu" id="menu-icon"></div>
    <ul class="navbar">
       <li><a href="HomePage.aspx">HOME</a></li>
  <li><a href="Products.aspx">PRODUCTS</a></li>
  <li><a href="Cart.aspx">CART</a></li>
  <li><a href="ProfilePage.aspx">PROFILE</a></li>
  <li><a href="LoginPage.aspx">LOGOUT</a></li>
  <li><a href="Products.aspx"><i class="fa fa-search" aria-hidden="true"></i></a></li>
  <li><a href="Cart.aspx"> <i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
  <li><a href="ProfilePage.aspx"><i class="fa fa-user" aria-hidden="true"></i></a></li>
    </ul>
</header>


          <div class="profile-container">
            <div class="profile-header">
                <asp:Image ID="profilePicture" runat="server" CssClass="profile-picture" ImageUrl="~/Images/profile.jpeg" AlternateText="Profile Picture" />
                <h1 runat="server" id="usernameLabel">Username</h1>
            </div>

            <div class="profile-info">
                <h2>User Information</h2>
                <p><strong>First Name:</strong> <asp:Label ID="firstNameLabel" runat="server"></asp:Label></p>
                <p><strong>Last Name:</strong> <asp:Label ID="lastNameLabel" runat="server"></asp:Label></p>
                <p><strong>Email:</strong> <asp:Label ID="emailLabel" runat="server"></asp:Label></p>
                <p><strong>ID:</strong> <asp:Label ID="idLabel" runat="server"></asp:Label></p>
                <p><strong>Mobile Number:</strong> <asp:Label ID="mobileNumberLabel" runat="server"></asp:Label></p>
                <!-- Add more labels as needed -->
            </div>
        </div>

    </form>
</body>
</html>
