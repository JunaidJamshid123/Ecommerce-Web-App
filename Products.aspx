<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />

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

       


        .container{
	max-width: 1070px;
	margin:auto;
}
.row{
	display: flex;
	flex-wrap: wrap;
}
ul{
	list-style: none;
}
.footer{
	background-color: #24262b;
    padding: 30px 0;
}
.footer-col{
   width: 25%;
   padding: 0 15px;
}
.footer-col h4{
	font-size: 18px;
	color: #ffffff;
	text-transform: capitalize;
	margin-bottom: 35px;
	font-weight: 500;
	position: relative;
}
.footer-col h4::before{
	content: '';
	position: absolute;
	left:0;
	bottom: -10px;
	background-color: #e91e63;
	height: 2px;
	box-sizing: border-box;
	width: 50px;
}
.footer-col ul li:not(:last-child){
	margin-bottom: 10px;
}
.footer-col ul li a{
	font-size: 16px;
	text-transform: capitalize;
	color: #ffffff;
	text-decoration: none;
	font-weight: 300;
	color: #bbbbbb;
	display: block;
	transition: all 0.3s ease;
}
.footer-col ul li a:hover{
	color: #ffffff;
	padding-left: 8px;
}
.footer-col .social-links a{
	display: inline-block;
	height: 40px;
	width: 40px;
	background-color: rgba(255,255,255,0.2);
	margin:0 10px 10px 0;
	text-align: center;
	line-height: 40px;
	border-radius: 50%;
	color: #ffffff;
	transition: all 0.5s ease;
}
.footer-col .social-links a:hover{
	color: #24262b;
	background-color: #ffffff;
}

/*responsive*/
@media(max-width: 767px){
  .footer-col{
    width: 50%;
    margin-bottom: 30px;
}
}
@media(max-width: 574px){
  .footer-col{
    width: 100%;
   }
}

  
        .product-container {
        width: 90%;
        max-width: 800px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 15px;
        justify-content: space-around;
        align-items: flex-start;
        padding: 10px;
    }

        .product-card {
            width: 100%; /* Adjusted the width to fill the grid column */
            border: 1px solid #ddd;
            padding: 15px;
            box-sizing: border-box;
            text-align: center;
        }

        .product-image {
            width: 100%;
            max-height: 80px;
            object-fit: contain;
        }

        .product-name {
            font-size: 14px;
            margin-top: 5px;
        }

        .product-price {
            font-size: 12px;
            margin-top: 3px;
        }

        .add-to-cart {
              background-color: #cb1317;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 8px;
            font-size: 12px;
        }

         .heading-container {
            text-align: center;
        }

        h3 {
            color: #333;
            font-size: 23px;
            margin-bottom: 10px;
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



        <div class="heading-container">
            <br />
        <h3>Awosam T-shirts for Man</h3>
    </div>
         <div class="product-container" id="yourExistingDiv" runat="server">

           
        </div>

   <!-- <div class="product-container" id="yourExistingDiv"> -->



        <!-- Product 1 -->

        <!--
        <div class="product-card">
            <img class="product-image" src="./Images/prod1.png" alt="Product 1">
            <div class="product-name">Product 1 Name</div>
            <div class="product-price">$19.99</div>
            <button class="add-to-cart">Add to Cart</button>
        </div>
        -->

        <!-- Repeat similar blocks for other products -->

    <!--</div>-->

       
       <!-- Repeat similar blocks for other products -->








        <footer class="footer">
  	 <div class="container">
  	 	<div class="row">
  	 		<div class="footer-col">
  	 			<h4>company</h4>
  	 			<ul>
  	 				<li><a href="#">about us</a></li>
  	 				<li><a href="#">our services</a></li>
  	 				<li><a href="#">privacy policy</a></li>
  	 				<li><a href="#">affiliate program</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>get help</h4>
  	 			<ul>
  	 				<li><a href="#">FAQ</a></li>
  	 				<li><a href="#">shipping</a></li>
  	 				<li><a href="#">returns</a></li>
  	 				<li><a href="#">order status</a></li>
  	 				<li><a href="#">payment options</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>online shop</h4>
  	 			<ul>
  	 				<li><a href="#">watch</a></li>
  	 				<li><a href="#">bag</a></li>
  	 				<li><a href="#">shoes</a></li>
  	 				<li><a href="#">dress</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>follow us</h4>
  	 			<div class="social-links">
  	 				<a href="#"><i class="fab fa-facebook-f"></i></a>
  	 				<a href="#"><i class="fab fa-twitter"></i></a>
  	 				<a href="#"><i class="fab fa-instagram"></i></a>
  	 				<a href="#"><i class="fab fa-linkedin-in"></i></a>
  	 			</div>
  	 		</div>
  	 	</div>
  	 </div>
  </footer>


    </form>
</body>
</html>
