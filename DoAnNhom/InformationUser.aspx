<%@ Page Title="" Language="C#" MasterPageFile="~/Account.master" AutoEventWireup="true" CodeBehind="InformationUser.aspx.cs" Inherits="DoAnNhom.InformationUser" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="side-right">
      <!--!Làm giao điện information user -->
      <div class="header-information">
        <h1>Hồ sơ của tôi</h1>
        <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
      </div>
      <div class="information-input">
        <div class="information-input-left">
          <div class="container-input">
            <label for="username">Tên đăng nhập</label>
            <%--<input type="text" id="username">--%>
             <asp:TextBox ID="username" runat="server"></asp:TextBox>
          </div>
          <div class="container-input">
            <label for="name">Tên</label>
            <%--<input type="text" id="name">--%>
             <asp:TextBox ID="name" runat="server"></asp:TextBox>
          </div>
          <div class="container-input">
            <label for="">Email</label>
            <!-- !Render từ server -->
            <%--<label for="" class="inside-information">email</label>--%>
             <asp:Label ID="Email" runat="server" Text="Email" CssClass="inside-information"></asp:Label>
            <a href="#">Thay đổi</a>
          </div>
          <div class="container-input">
            <label for="">Số điện thoại</label>
            <!-- !Render từ server  nếu trường dữ liệu !=null thì render ra thêm label chứa điện thoại-->
            <!-- !Trong database khachhang sodienthoai allow null -->
              <asp:Label ID="PhoneNumber" runat="server" Text=""></asp:Label>
              <a href="#">Thêm</a>
          </div>


          <div class="container-input">
            <label for="" class="label-title">Giới tính</label>
            <input type="radio" id="nam" name="gt">
            <label for="nam" class="gender">Nam</label>
            <input type="radio" id="nu" name="gt">
            <label for="nu" class="gender">Nữ</label>
            <input type="radio" id="khac" name="gt">
            <label for="khac" class="gender">Khac</label>
          </div>
          <div class="container-input">
            <label for="">Ngày sinh</label>
            <select id="ngay"></select>
            <select id="thang"></select>
            <select id="nam1"></select>
          </div>
          <div class="button-information-user">
              <button>Lưu</button>

          </div>
        </div>
        <div class="information-input-right">
          <div class="container-avatar">
            <!-- !Render avatar từ database nếu null thì lấy avatar mặc định -->
            <img src="img/sanpham.jpg" alt="">
          </div>
            <div class="button-avatar">
                <input type="file" accept="image/*">
            </div>
           <div class="description-constraint">
            <p>Dụng lượng file tối đa 1 MB</p>
            <p>Định dạng:.JPEG, .PNG</p>
           </div> 
        </div>
      </div>
    </div>
     <script src="js/information.js"></script>
</asp:Content>

