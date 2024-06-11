<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DoAnNhom.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/product.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="header-content">
    <a href="Default.aspx">Trang chủ</a>
          <%-- fix cứng --%>
    <a href="Category.aspx">Túi macrame</a>
    <!-- Render động -->
   <%-- <a href="Category.aspx">Tên category chi tiết </a>--%>
<asp:Repeater ID="rpLinkheader" runat="server">
    <ItemTemplate>
         <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Category.aspx?idCategory=" + Eval("IDdanhmuc") %>'>
             <%# Eval("TenDanhMuc") %>
        </asp:HyperLink>
    </ItemTemplate>
</asp:Repeater>

    <!-- !Tên sản phẩm render -->
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <p><%# Eval("TenSP") %></p>
    </ItemTemplate>
</asp:Repeater>
  </div>

  <div class="content-product">
    <div class="container-img">
      <div class="img-active">
<asp:Repeater ID="Repeater2" runat="server">
    <ItemTemplate>
        <img src='<%# "img/"+Eval("Img") %>' alt="">
    </ItemTemplate>
</asp:Repeater>
        <div class="top-right">
          <i class="fa-solid fa-magnifying-glass"></i>
        </div>
      </div>
      <div class="list-img">
        <ul class="menu-img">
<asp:Repeater ID="Repeater9" runat="server">
    <ItemTemplate>
        <li class="item-img">
        <!-- !Thiếu chèn source img -->
        <img src='<%# "img/AdditionImg/"+Eval("HINH") %>' alt="">
        </li>
    </ItemTemplate>
</asp:Repeater>
        </ul>
      </div>
    </div>
    <div class="information-product">
      <!-- !Render tên sản phẩm -->
<asp:Repeater ID="Repeater3" runat="server">
    <ItemTemplate>
        <h2><%# Eval("TenSP") %></h2>
        <div class="price"><%# Eval("Gia")+" VND" %></div>
    </ItemTemplate>
</asp:Repeater>
      <div class="color">
        <p>Màu sắc</p>
       <asp:DropDownList ID="dropdownColor" runat="server">
        </asp:DropDownList>
      </div>
      <div class="shopping-cart">
        <i class="fa-solid fa-minus"></i>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <i class="fa-solid fa-plus"></i>
        <asp:Button ID="Button1" CssClass="add-shopping-cart" runat="server" Text="Thêm vào giỏ hàng" OnClick="Button1_Click" />
      </div>
      <div class="container-information">
        <div class="attribute-product">
          <p class="description active">Mô tả</p>
          <p class="description">Đánh giá (0)</p>
        </div>
        <div class="information active">
          <h3 class="title-information">Mô tả</h3>
<asp:Repeater ID="Repeater4" runat="server">
    <ItemTemplate>
        <p class="information-description"><%# Eval("MoTa") %></p>
    </ItemTemplate>
</asp:Repeater>
         <ul class="menu-attribute">
<asp:Repeater ID="Repeater8" runat="server">
    <ItemTemplate>
            <li class="item-attribute">Loại sản phẩm : <%# Eval("TenDanhMuc") %></li>
    </ItemTemplate>
</asp:Repeater>
            <li class="item-attribute">Màu sắc:......</li>
            <li class="item-attribute">Chất liệu :.......</li>
            <li class="item-attribute">Kích thước: ......</li>
          </ul>
        </div>
        <div class="review-detail active">
          <h3 class="title-information">Đánh giá</h3>
          <p>Chưa có đánh giá nào</p>
          <p>Đánh giá của bạn</p>
          <div class="container-star">
            <i class="star fa-regular fa-star"></i>
            <i class="star fa-regular fa-star"></i>
            <i class="star fa-regular fa-star"></i>
            <i class="star fa-regular fa-star"></i>
            <i class="star fa-regular fa-star"></i>
          </div>
          <div class="container-input">
            <p>Nhận xét của bạn</p>
            <textarea name="" id="" cols="30" rows="10"></textarea>
          </div>
          <div class="container-input">
            <p>Tên</p>
            <input type="text">
          </div>
          <div class="container-input">
            <p>Email</p>
            <input type="text">
          </div>
          <div class="button-submit">
            <button>Gửi đi</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="confirm">
    <div class="confirm-title">
      <i class="fa-solid fa-caret-right"></i>
      <h3>Xác nhận</h3>
    </div>
    <div class="container-detail none">
    <asp:Repeater ID="Repeater6" runat="server">
        <ItemTemplate>
            <p> - <%# Eval("Xacnhan") %></p>
        </ItemTemplate>
    </asp:Repeater>
    </div>
  </div>
  <div class="confirm">
    <div class="confirm-title">
      <i class="fa-solid fa-caret-right"></i>
      <h3>Give a hand</h3>
    </div>
    <div class="container-detail none">
<asp:Repeater ID="Repeater7" runat="server">
        <ItemTemplate>
            <p>- <%# Eval("GiveHand") %></p>
        </ItemTemplate>
    </asp:Repeater>
    </div>
  </div>
  <div class="relative-product">
    <h2>Sản phẩm liên quan  </h2>
    <ul class="menu-relative-product">
<asp:Repeater ID="Repeater5" runat="server">
    <ItemTemplate>
        <li class="item-relative">
        <!-- !Thiếu kèm theo link -->
         <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Product.aspx?id=" + Eval("IdSanPham")+"&idCategory="+Eval("IdDanhMuc") %>'>
          <!-- !Thiếu kèm link ảnh -->
          <img src='<%# "img/"+Eval("Img") %>' alt="product">
          <p class="name-product"><%# Eval("TenSP") %></p>
          <p class="read-more">Read more</p>
        </asp:HyperLink>
        </li>
    </ItemTemplate>
</asp:Repeater>
    </ul>
  </div>
  <script src="js/product.js"></script>
</asp:Content>
