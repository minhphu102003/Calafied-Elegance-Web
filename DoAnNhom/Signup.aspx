<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DoAnNhom.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up</title>
     <link rel="stylesheet" href="css/signup.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-login">
    <div class="form-login">
      <h6>Welcome !</h6>
      <h2>Sign up to</h2>
      <p class="slogan">Lorem ipsum, dolor sit amet consectetur</p>
      <div class="container-signup">
        <p class="label">Email</p>
<%--        <input id="email" type="email" placeholder="Enter your email" />--%>
          <asp:TextBox ID="email" runat="server" Placeholder="Enter your email"></asp:TextBox>
        <p class="notification"></p>
      </div>
      <div class="container-signup">
        <p class="label">User name</p>
<%--        <input id="username" type="text" placeholder="Enter your user name"/>--%>
          <asp:TextBox ID="username" runat="server" Placeholder="Enter your username"></asp:TextBox>
        <p class="notification"></p>
      </div>
      <div class="container-signup">
        <p class="label">Password</p>
<%--        <input type="password" id="password" placeholder="Enter your password"/>--%>
        <asp:TextBox ID="password" runat="server" Placeholder="Enter your password" TextMode="Password"></asp:TextBox>
        <p class="notification"></p>
        <i class="fa-solid fa-eye-slash"></i>
      </div>
      <div class="container-signup">
        <p class="label">Confirm Password</p>
<%--        <input  id="confirmpassword" type="password" placeholder="Confirm your password"/>--%>
          <asp:TextBox ID="confirmpassword" runat="server" Placeholder="Confirm your password" TextMode="Password"></asp:TextBox>
        <p class="notification"></p>
        <i class="fa-solid fa-eye-slash"></i>
      </div>
      <div class="register-button">
        <%--<button class="register-button1">Register</button>--%>
       <asp:Button ID="Button1" runat="server" CssClass="register-button1" Text="Đăng kí" OnClick="Button1_Click"  />
      </div>
      <div class="footer-form">
        <p>Already have Accoun</p>
        <a href="Login.aspx">Log in</a>
      </div>
    </div>
    <div class="container-background">
      <img src="img/small-team-discussing-ideas-2194220-0.png" alt="">
    </div>
  </div>
  <script src="js/signup.js"></script>
    </form>
</body>
</html>
