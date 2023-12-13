<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign_up.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.Sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
    <link rel="stylesheet" href="style.css" />
    <title>Sign Up Page</title>
    
    <style>


        
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


       
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Montserrat", sans-serif;
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
            height: 600px;
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

        /* Styling for input fields */
        .input-field {
            background-color: transparent;
            outline: none;
            border: solid 2px #9191bd;
            border-radius: 20px;
            padding: 10px 20px;
            color: #9191bd;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .input-field:hover {
            background-color: #9191bd;
            border: none;
            color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            width: 100%;
        }

        .form-information-childs h2 {
            color: #333;
            font-size: 2rem;
        }

        .form-information-childs p {
            color: #555;
        }

        .form label {
            margin-bottom: 15px;
        }

        .form label i {
            color: #a7a7a7;
            margin-right: 10px;
        }

        .form input[type="file"] {
            display: none;
        }

        .form label span {
            padding: 10px;
            background-color: #252578;
            color: #fff;
            border-radius: 20px;
            cursor: pointer;
            margin-right: 10px;
        }

        /* Styling for the submit button */
        .btn {
            background-color: #252578;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 20px;
        }

        .btn:hover {
            background-color: #7a7a9a;
        }

        /* Responsive */
        @media screen and (max-width: 750px) {
            html {
                font-size: 12px;
            }
        }

        @media screen and (max-width: 500px) {
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
                    <img src="./Images/assit.jpg" alt="" />
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Welcome To ShopVista</h2>
                    <p>Ship Smarter Today</p>
                    <form id="signUpForm" runat="server">
                        <!-- Apply the 'input-field' class to input fields -->
                       <label><i class="bx bx-user"></i><asp:TextBox placeholder="First Name" runat="server" ID="txtFirstName" CssClass="input-field" /></label>
<label><i class="bx bx-user"></i><asp:TextBox placeholder="Last Name" runat="server" ID="txtLastName" CssClass="input-field" /></label>
<label><i class="bx bx-envelope"></i><asp:TextBox placeholder="Email" runat="server" ID="txtEmail" CssClass="input-field" /></label>
<label><i class="bx bx-lock-alt"></i><asp:TextBox TextMode="Password" placeholder="Password" runat="server" ID="txtPassword" CssClass="input-field" /></label>
<label><i class="bx bx-lock-alt"></i><asp:TextBox TextMode="Password" placeholder="Confirm Password" runat="server" ID="txtConfirmPassword" CssClass="input-field" /></label>
<label><i class="bx bx-phone"></i><asp:TextBox placeholder="Mobile Number" runat="server" ID="txtMobileNumber" CssClass="input-field" /></label>
<label><i class="bx bx-map"></i><asp:TextBox placeholder="Address" runat="server" ID="txtAddress" CssClass="input-field" /></label>

                      <label>
    <i class="bx bx-image"></i>
    <span>Upload Image</span>
    <asp:FileUpload runat="server" ID="fileUpload" />
</label>
                        <!-- Apply the 'btn' class to the submit button -->
                        <asp:Panel runat="server" ID="ButtonContainer" style="position: relative; overflow: hidden; width: 250px; margin: 20px auto; text-align: center; border-radius: 25px; border: 2px solid #009688; padding: 10px;">
    <asp:Button ID="Button2" runat="server" Text="Sign Up" OnClick="startButton_click" style="width: 100%; background: transparent; color: black; border: none; cursor: pointer;" />
    <div style="background: #009688; height: 100%; width: 0; transition: .5s; border-radius: 25px; position: absolute; left: 0; bottom: 0; z-index: -1;"></div>
</asp:Panel>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
