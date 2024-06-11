<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="DoAnNhom.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/category.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content-header">
    <!-- !Thiếu chèn link -->
    <a href="Default.aspx">Trang chủ</a>
<asp:Repeater ID="Repeater2" runat="server">
    <ItemTemplate>
        <p><%# Eval("TenDanhMuc") %></p>
    </ItemTemplate>
</asp:Repeater>
  </div>
  <div class="list-product">
    <div class="category-name">
 <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
      <h2><%# Eval("TenDanhMuc") %></h2>
    </ItemTemplate>
</asp:Repeater>
    </div>
    <div class="sort-category">
      <select name="" id="dropdown">
        <option value="1">Thứ tự mặc định</option>
        <option value="2">Thứ tự dưới lên</option>
        <option value="3">Thứ tự theo danh mục</option>
        <option value="4">Thứ tự theo ngày nhập</option>
      </select>
    </div>
    <div class="container-list-product">

 <asp:DataList ID="dlProducts" runat="server" CssClass="menu-category" RepeatLayout="Flow">
    <ItemTemplate>
        <li class="item-category">
            <a href='<%# "Product.aspx?id=" + Eval("IdSanPham")+"&idCategory="+Eval("IdDanhMuc") %>'>
                <img src='<%#"img/"+ Eval("Img") %>' alt="">
                <p class="name-product">
                    <%# Eval("TenSP") %>
                </p>
                <p class="read-more">Đọc tiếp</p>
            </a>
        </li>
    </ItemTemplate>
</asp:DataList>
    </div>
    <div class="comment">
      <h6>Shop some thing handmade!</h6>
      <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero, non a laudantium provident est quae nesciunt! Inventore itaque at, nisi laboriosam ullam, dolor iusto voluptatem aut consectetur numquam ab dolorum?</p>
    </div>
  </div>
</asp:Content>
