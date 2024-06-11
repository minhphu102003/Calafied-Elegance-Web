<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BlogDetail.aspx.cs" Inherits="DoAnNhom.BlogDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/blogdetail.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="header-img">
    <!-- !Thiếu chèn ảnh -->
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
      <img src='<%#"img/"+ Eval("Picture") %>' alt="">
    </ItemTemplate>
</asp:Repeater>
  </div>
  <div class="content-blog">
<asp:Repeater ID="Repeater2" runat="server">
    <ItemTemplate>
    <h2 class="title-blog"><%# Eval("title") %></h2>
    <p class="description"><%# Eval("description") %></p>
    </ItemTemplate>
</asp:Repeater>

<asp:Repeater ID="Repeater3" runat="server">
    <ItemTemplate>
     <div class="part">
      <h3 class="title-part"><%# Eval("TITLE") %></h3>
      <p class="description-part">
          <%# Eval("CONTENTPART") %> 
      </p>
    </div>
    </ItemTemplate>
</asp:Repeater>
    <div class="footer-blog">
      <h2>enjoy</h2>
      <div class="end-footer">
        <div class="previous-blog">
          <!-- !Thiếu kèm link -->
          <a href="">
            <i class="fa-solid fa-angle-left"></i>
            <p class="name-blog">Name blog</p>
          </a>
        </div>
        <div class="next-blog">
          <!-- !Thiếu kèm link -->
          <a href="">
            <p class="name-blog">Name blog</p>
            <i class="fa-solid fa-angle-right"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
