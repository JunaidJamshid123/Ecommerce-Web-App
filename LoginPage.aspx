<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <title>Login Page</title>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Montserrat", sans-serif;
        }

        .navbar{
    /* width: 85%; */
   
    margin:  auto;
    margin-left: 50%;
    list-style: none;
    padding: 35px 0;
    justify-content: space-between;
    display: flex;

}
.logo img{
    width: 120px ;
    cursor: pointer;
}
.nav img{
width: 100%;
height: 100vh;
border: 5px solid red;
    position: relative;
}
.navbar ul {
    margin-left: auto; /* Add this line to align items to the end */
}

.navbar ul li {
    list-style: none;
    display: inline-block;
    margin: 0 20px;
    position: relative;
}
.navbar ul li a{
 /* right: 600px; */
  /* border: 5px solid yellow; */
    text-decoration: none;
    color:black;
    text-transform: uppercase;


}
.navbar ul li ::after{
    content: '';
    height: 3px;
    width: 0;
    background: #009688;
    position: absolute;
    left: 0;
    bottom: -10px;
   transition: 0.5s
   

}
.navbar ul li:hover::after{
width: 100%;
 background:#07c646;
}

        section {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #fff;
            background-size: cover;
        }

        .container-form {
            display: flex;
            height: 500px;
            transition: all 1s ease;
            gap: 5rem;
            margin: 10px;
            border-radius: 20px;
        }

        .information {
            width: 100%;
            position: relative;
            display: flex;
            align-items: center;
            text-align: center;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }

        .info-childs {
            width: 100%;
            height: 100vh;
        }

        .info-childs img {
            margin-top: 10rem;
            padding-left: 10px;
            height: 300px;
            width: 100%;
        }

        .info-childs h2 {
            font-size: 2.5rem;
            color: #333;
        }

        .info-childs p {
            margin: 15px 0;
            color: #555;
        }

        .info-childs input {
            background-color: transparent;
            outline: none;
            border: solid 2px #9191bd;
            border-radius: 20px;
            padding: 10px 20px;
            color: #9191bd;
            cursor: pointer;
            transition: background-color .3s ease;
            width: 100%;
            margin-bottom: 15px;
        }

        .info-childs input:hover {
            background-color: #9191bd;
            border: none;
            color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
        }

        .form-information {
            width: 100%;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            display: flex;
            align-items: center;
            text-align: center;
        }

        .form-information-childs {
            padding: 0 30px;
        }

        .form-information-childs h2 {
            color: #333;
            font-size: 2rem;
        }

        .form-information-childs p {
            color: #555;
        }

        .icons {
            margin: 15px 0;
        }

        .form {
            margin: 30px 0 0 0;
        }

        .form label {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            border-radius: 20px;
            padding: 0 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
            background-color: #fff;
            width: 100%;
        }

        .form label input {
            width: 100%;
            padding: 10px;
            background-color: #fff;
            border: none;
            outline: none;
            border-radius: 20px;
            color: #333;
        }

        .form label i {
            color: #a7a7a7;
            margin-right: 10px;
        }

        .form input[type="submit"] {
            background-color: #252578;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 20px;
        }

        .form input[type="submit"]:hover {
            background-color: #7a7a9a;
        }

        /* Responsive */
        @media screen and (max-width:750px) {
            html {
                font-size: 12px;
            }

        }

        @media screen and (max-width:500px) {
            html {
                font-size: 10px;
            }

            .container-form {
                height: auto;
                flex-direction: column;
            }

            .information {
                width: 100%;
                padding: 20px;
                border-top-right-radius: 20px;
                border-top-left-radius: 20px;
                border-bottom-left-radius: 0;
            }

            .form-information {
                width: 100%;
                padding: 20px;
                border-bottom-left-radius: 20px;
                border-top-right-radius: 0;
            }
        }
    </style>
</head>
<body>

     <div class="navbar">
    <!-- <img src="./asst/logo.avif" alt="" class="logo"> -->
     <ul>
         <li><a href="LoginPage.aspx" OnClick="login_click">Login</a></li>
         <li><a href="Sign_up.aspx" OnClick="signup_click">Signup</a></li>
     </ul>
 </div>

    <section>
        <div class="container-form">
            <div class="information">
                <div class="info-childs">
                    <img src="./Images/assit.jpg" alt="">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Welcome to ShopVista</h2>
                    <p>Ship Smarter Today</p>
                    <form id="loginForm" runat="server" class="form">
                       
                       <label><i class="bx bx-envelope"></i><asp:TextBox runat="server" placeholder="Username or Email" ID="txtUsername" ClientIDMode="Static"></asp:TextBox></label>
<label><i class="bx bx-lock-alt"></i><asp:TextBox runat="server" TextMode="Password" placeholder="Password" ID="txtPassword" ClientIDMode="Static"></asp:TextBox></label>


                        <asp:Panel runat="server" ID="ButtonContainer" style="position: relative; overflow: hidden; width: 250px; margin: 20px auto; text-align: center; border-radius: 25px; border: 2px solid #009688; padding: 5px;">
    <asp:Button ID="Button2" runat="server" Text="Login" OnClick="LoginButton_click" style="width: 100%; height: auto; padding: 8px; line-height: 1; background: transparent; color: black; border: none; cursor: pointer;" />
    <div style="background: #009688; height: 100%; width: 0; transition: .5s; border-radius: 25px; position: absolute; left: 0; bottom: 0; z-index: -1;"></div>
</asp:Panel>

                        <asp:Label runat="server" ID="lblErrorMessage" ForeColor="Red" Visible="false"></asp:Label>



                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
