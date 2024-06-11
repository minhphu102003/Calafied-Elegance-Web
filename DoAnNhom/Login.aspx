<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnNhom.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
   <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
      <div class="container">
    <div class="form1">
      <div class="welcome">
        Welcome!
      </div>
      <h3>Sign in to</h3>
      <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. </p>
      <div class="container-input">
        <p>User name</p>
        <%--<input type="text" name="" id="" placeholder="Enter your username">--%>
        <asp:TextBox ID="txtUsername" runat="server" Placeholder="Enter your username"></asp:TextBox>
      </div>
      <div class="container-input">
        <p>Password</p>
<%--        <input type="password" placeholder="Enter your password" id="password">--%>
          <asp:TextBox ID="password" runat="server" Placeholder="Enter your password" TextMode="Password"></asp:TextBox>
        <i class="fa-solid fa-eye-slash"></i>
      </div>
      <div class="check">
        <div class="remember">
          <input type="checkbox" name="" id="check">
          <label for="check">Remember me</label>
        </div>
        <div class="forgot">
          <a href="#">Forgot Password ?</a>
        </div>
      </div>
      <div class="button-login">
        <asp:Button ID="Button2" runat="server" CssClass="login" Text="Đăng nhập" OnClick="Button1_Click"  />
      </div>

      <div class="register">
        <p>  Don't have an Account ?</p>
        <!-- !Render đăng kí -->
        <a href="Signup.aspx">Register</a>
      </div>
    </div>
    <div>
      <img src="img/small-team-discussing-ideas-2194220-0.png" alt="">
    </div>
  </div>
  <script src="js/login.js"></script>
    </form>
</body>
</html>
