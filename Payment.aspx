<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />

    <title></title>

    <style>
         @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&family=Bree+Serif&family=Poppins:wght@200;300;400;500;600&display=swap');

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
             list-style: none;
          list-style: none;
          scroll-behavior: smooth;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-transform: capitalize;
            transition: all .2s linear;
        }
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 25px;
    min-height: 100vh;
    background: #f2f2f2; /* Light gray background color */
}

            .container form {
                padding: 20px;
                width: 700px;
                background: #fff;
                box-shadow: 0 5px 10px rgba(0,0,0,.1);
            }

                .container form .row {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 15px;
                }

                    .container form .row .col {
                        flex: 1 1 250px;
                    }

                        .container form .row .col .title {
                            font-size: 20px;
                            color: #333;
                            padding-bottom: 5px;
                            text-transform: uppercase;
                        }

                        .container form .row .col .inputBox {
                            margin: 15px 0;
                        }

                            .container form .row .col .inputBox span {
                                margin-bottom: 10px;
                                display: block;
                            }

                            .container form .row .col .inputBox input {
                                width: 100%;
                                border: 1px solid #ccc;
                                padding: 10px 15px;
                                font-size: 15px;
                                text-transform: none;
                            }

                                .container form .row .col .inputBox input:focus {
                                    border: 1px solid #000;
                                }

                        .container form .row .col .flex {
                            display: flex;
                            gap: 15px;
                        }

                            .container form .row .col .flex .inputBox {
                                margin-top: 5px;
                            }

                        .container form .row .col .inputBox img {
                            height: 34px;
                            margin-top: 5px;
                            filter: drop-shadow(0 0 1px #000);
                        }

                .container form .submit-btn {
                    width: 100%;
                    padding: 12px;
                    font-size: 17px;
                    background: #ff0000;
                    color: #fff;
                    margin-top: 5px;
                    cursor: pointer;
                }

                    .container form .submit-btn:hover {
                        background: #2ecc71;
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

  .error-message {
        color: red;
        text-align: center;
        margin-top: 10px; /* Adjust the margin-top as needed */
    }

  #menu-icon {
      font-size: 24px;
      cursor: pointer;
      z-index: 10001;
      display: none;
  }
    </style>
</head>
<body>

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

    <asp:Label runat="server" ID="lblError" Text="" CssClass="error-message" Visible="false"></asp:Label>

    <div class="container">

      <form id="form1" runat="server">

            <div class="row">

                <div class="col">

                    <h3 class="title">billing address</h3>

                     <div class="inputBox">
                        <span>Full Name:</span>
                       <asp:TextBox runat="server" ID="txtFullName" placeholder="Junaid Jamshid Khan"></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>Email:</span>
                        <asp:TextBox runat="server" ID="txtEmail" placeholder="Junaid@gmail.com" type="email"></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>Address:</span>
                        <asp:TextBox runat="server" ID="txtAddress" placeholder="Room - Street - Locality"></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>City:</span>
                        <asp:TextBox runat="server" ID="txtCity" placeholder="Islamabad"></asp:TextBox>
                    </div>

                    <div class="flex">
                        <div class="inputBox">
                            <span>State:</span>
                            <asp:TextBox runat="server" ID="txtState" placeholder="Pakistan"></asp:TextBox>
                        </div>
                        <div class="inputBox">
                            <span>Zip Code:</span>
                            <asp:TextBox runat="server" ID="txtZipCode" placeholder="123 456"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <div class="col">

                    <h3 class="title">Payment</h3>

                    <div class="inputBox">
                        <span>Cards Accepted:</span>
                        <img src="./Images/card_img.png" alt="images" />
                    </div>
                    <div class="inputBox">
                        <span>Name on Card:</span>
                        <asp:TextBox runat="server" ID="txtNameOnCard" placeholder="Junaid Jamshid"></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>Credit Card Number:</span>
                        <asp:TextBox runat="server" ID="txtCreditCardNumber" placeholder="1111-2222-3333-4444" type="number"></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>Exp Month:</span>
                        <asp:TextBox runat="server" ID="txtExpMonth" placeholder="March"></asp:TextBox>
                    </div>

                    <div class="flex">
                        <div class="inputBox">
                            <span>Exp Year:</span>
                            <asp:TextBox runat="server" ID="txtExpYear" placeholder="2022" type="number"></asp:TextBox>
                        </div>
                        <div class="inputBox">
                            <span>CVV:</span>
                            <asp:TextBox runat="server" ID="txtCVV" placeholder="1234"></asp:TextBox>
                        </div>
                    </div>

                </div>

            </div>

           <asp:Button runat="server" ID="btnContinue" Text="Continue to checkout" OnClick="btnContinue_Click" CssClass="submit-btn" />
        </form>

    </div>

</body>
</html>
