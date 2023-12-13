<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
   @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');
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

   .size span {
  font-size: 11px;
}

.color span {
  font-size: 11px;
}

.product-deta {
  margin-right: 70px;
}

.gift-card:focus {
  box-shadow: none;
}

.pay-button {
  color: #fff;
}

.pay-button:hover {
  color: #fff;
}

.pay-button:focus {
  color: #fff;
  box-shadow: none;
}

.text-grey {
  color: #a39f9f;
}

.qty i {
  font-size: 11px;
}

    
.container {
    width: 100%;
    max-width: 800px;
    text-align: center; /* Center the cart item horizontally */
    margin: 0 auto; /* Center the container horizontally */
}

.cart-item {
    background-color: #ffffff;
    width: 100%;
    max-width: 400px; /* Adjust as needed */
    display: flex;
    align-items: center;
    padding: 20px; /* Increase padding for more spacing */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px auto; /* Center the cart item horizontally and add margin for spacing */
}

.product-image {
    max-width: 100px;
    height: auto;
    margin-right: 20px; /* Increase margin for more spacing */
}

.product-info {
    flex-grow: 1;
}

.product-name {
    margin: 0;
    font-size: 1.2rem; /* Increase font size for better visibility */
    margin-bottom: 10px; /* Add margin below the product name */
}

.product-price {
    margin: 0;
    color: #007bff;
    font-weight: bold; /* Make the price bold for emphasis */
}

.quantity {
    font-size: 0.9rem; /* Decrease font size for quantity */
    color: #555; /* Adjust color for better readability */
}


.center-button {
    text-align: center;
    margin-top: 20px; /* Adjust margin as needed */
}

.checkout-button {
    padding: 10px 20px;
    font-size: 1rem;
    background-color: var(--main-color); /* Use your preferred color */
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.checkout-button:hover {
    background-color: var(--second-color); /* Use your preferred color on hover */
}


 .summary-container {
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            padding: 15px;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .summary-item {
            text-align: center;
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
         <asp:Panel ID="cartItemsContainer" runat="server">

         </asp:Panel>
         

          <div class="summary-container">
                <div class="summary-item">
                    <h4>Total Items Bought</h4>
                    <asp:Label runat="server" ID="lblTotalItems"></asp:Label>
                </div>
                <div class="summary-item">
                    <h4>Total Payment</h4>
                    <asp:Label runat="server" ID="lblTotalPayment"></asp:Label>
                </div>
                <div class="summary-item">
                    <h4>Total Quantity</h4>
                    <asp:Label runat="server" ID="lblTotalQuantity"></asp:Label>
                </div>
                <div class="summary-item">
                    <asp:Button runat="server" ID="Button1" Text="Checkout" OnClick="btnCheckout_Click" />
                </div>
            </div>





        <div class="center-button">
    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="checkout-button" OnClick="btnCheckout_Click" />
</div>
        

    </form>
</body>
</html>
