<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="ShopVista__Ecommerce_Web_App_.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Landing Page</title>

    <style>

        *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}
.banner{
    width: 100%;
    height: 100vh;
    background: linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.2)),
    url(./Images/landing_bg.jpg);
  /* background-image:linear-gradient(rgba(0,0,0.8),rgba(0,0,0,0.2) url(./asst/download.jpeg )); */
    background-size: cover;
    background-position: center;
}

.navbar{
    /* width: 85%; */
   
    margin:  auto;
    margin-left: 50%;
    list-style: none;
    padding: 35px 0;
    justify-content: space-between;
    align-items: flex-end;
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
    color: #ffff;
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
   transition: 0.5s;
   

}
.navbar ul li:hover::after{
width: 100%;
 background:#07c646;
}
.content{
    width: 100%;
   /* max-width: 650; */

    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50% ,-50%);
    text-align: center;
    color: #ffff;
}
.content h1{
    font-size: 70px;
    margin-top: 80px;
}.content p{
    margin: 20px auto;
    font-weight: 100;
    line-height: 25px;
}
button{
    width: 200PX;
    padding: 15px 0;
    text-align: center;
    margin: 20px 10px;
    border-radius: 25px;
    font-weight: bold;
    border: 2px solid #009688;
    background: transparent;
    color: #ffff;
    position: relative;
    overflow: hidden;
    cursor: pointer;

}
span{
    background: #009688;
    height: 100%;
    width: 0;
    transition: .5c;
    border-radius: 25px;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: -1;

}
button:hover span{
    width: 100%;

}
button :hover{
    border: none;
}




    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="banner">
        <!-- <img src="./asst/logo.avif" alt=""> -->
        <div class="navbar">
           <!-- <img src="./asst/logo.avif" alt="" class="logo"> -->
            <ul>
                <li><a href="LoginPage.aspx" OnClick="login_click">Login</a></li>
                <li><a href="Sign_up.aspx" OnClick="signup_click">Signup</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Shop Vista  </h1>
            <p>SUBSCRIB Shop Vista FOR MORE </p>
          
<asp:Panel runat="server" ID="ButtonContainer" style="position: relative; overflow: hidden; width: 250px; margin: 20px auto; text-align: center; border-radius: 25px; border: 2px solid #009688; padding: 10px;">
    <asp:Button ID="Button2" runat="server" Text="Start" OnClick="startButton_click" style="width: 100%; background: transparent; color: #ffff; border: none; cursor: pointer;" />
    <div style="background: #009688; height: 100%; width: 0; transition: .5s; border-radius: 25px; position: absolute; left: 0; bottom: 0; z-index: -1;"></div>
</asp:Panel>

        <!--</div>-->

    </div>
    </form>
</body>
</html>
