<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DoAnNhom.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/content.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content">
    <div class="banner">
      <!-- !Thiếu chèn ảnh banner -->
      <img src="img/Banner1.png" alt="ảnh banner">
    </div>
    <div class="lastest">
      <div class="content-title">
        <p class="first">Sản phẩm</p>
        <p class="second">Mới nhất</p>
      </div>
      <div class="container-product">
<ul class="list-product">
 <asp:Repeater ID="rptProducts" runat="server">
    <ItemTemplate>
            <li class="item-product">
<asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Product.aspx?id=" + Eval("IdSanPham")+"&idCategory="+Eval("IdDanhMuc") %>'>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#"img/"+ Eval("Img") %>' alt=""/>
                    <p runat="server" id="productName"><%# Eval("TenSP") %></p>
                    <p class="read-more">Đọc tiếp</p>
                </asp:HyperLink>
            </li>
    </ItemTemplate>
</asp:Repeater>
</ul>
      </div>
      <div class="button-content">
        <a href="#">Xem tất cả</a>
      </div>
    </div>
    <div class="category">
      <div class="title-category">
        <h2>Danh mục sản phẩm</h2>
      </div>
      <div class="container-list-category">
        <ul class="menu-category">

<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <li class="item-category">
            <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Category.aspx?idCategory=" + Eval("IDdanhmuc") %>'>
                <img src='<%# "img/"+Eval("Hinh") %>' alt="">
                <p><%# Eval("TenDanhMuc") %></p>
            </asp:HyperLink>
        </li>
    </ItemTemplate>
</asp:Repeater>
        </ul>
      </div>
    </div>
    <div class="lastest">
      <div class="content-title">
        <p class="first">Sản phẩm</p>
        <p class="second">Nổi bật</p>
      </div>
      <div class="container-product">
        <ul class="list-product">
 <asp:Repeater ID="Repeater2" runat="server">
    <ItemTemplate>
         <li class="item-product">
                <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Product.aspx?id=" + Eval("IdSanPham")+"&idCategory="+Eval("IdDanhMuc") %>'>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#"img/"+ Eval("Img") %>' alt=""/>
                    <p runat="server" id="productName"><%# Eval("TenSP") %></p>
                    <p class="read-more">Đọc tiếp</p>
                </asp:HyperLink>
            </li>
    </ItemTemplate>
</asp:Repeater>
          
        </ul>
      </div>
      <div class="button-content">
        <a href="#">Xem tất cả</a>
      </div>
    </div>
  </div>
</asp:Content>
