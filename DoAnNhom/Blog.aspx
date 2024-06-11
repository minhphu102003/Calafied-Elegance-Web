<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="DoAnNhom.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/blog.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="banner">
    <!-- !Thiếu chèn link ảnh -->
    <img src="img/Banner1.png" alt="ảnh banner">
  </div>
  <div class="container-list-blog">
    <ul class="menu-blog">
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
         <li class="item-blog">
                <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "BlogDetail.aspx?id=" + Eval("blog_id") %>'>
                    <div class="blog-left">
                        <img src='<%# "img/"+Eval("Picture") %>' alt="" />
                     </div>
                    <div class="blog-right">
                    <h2><%# Eval("title") %></h2>
                   <p class="blog-description"><%# Eval("description") %></p>
                   <p class="blog-detail">Xem thêm >></p>
               </div>
             </asp:HyperLink>
            </li>
    </ItemTemplate>
</asp:Repeater>
    </ul>
  </div>
</asp:Content>
