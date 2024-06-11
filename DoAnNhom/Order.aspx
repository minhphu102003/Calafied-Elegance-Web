<%@ Page Title="" Language="C#" MasterPageFile="~/Account.master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="DoAnNhom.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="sidebar-right">
      <div class="header-status">
        <ul class="menu-status">
          <li class="item-status active">
            <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl="Order.aspx">Tất cả</asp:HyperLink>
          </li>
          <li class="item-status">
              <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Order.aspx?id=1">Chờ thanh toán</asp:HyperLink>
          </li>
          <li class="item-status">
              <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="Order.aspx?id=2">Vận chuyển</asp:HyperLink>   
          </li>
          <li class="item-status">
              <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="Order.aspx?id=3">Đang giao</asp:HyperLink> 
          </li>
          <li class="item-status">
              <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="Order.aspx?id=4">Hoàn thành</asp:HyperLink>
          </li>
          <li class="item-status">
              <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="Order.aspx?id=5">Đã hủy</asp:HyperLink>
          </li>
          <li class="item-status">
            <a href="Order.aspx">Trả hàng/Hoàn tiền</a>
          </li>
        </ul>
      </div>
      <div class="container-find">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" placeholder="Tìm kiếm theo tên hoặc ID sản phẩm">
      </div>
      <div class="container-order">
        <ul class="menu-product-order">
 <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
         <li class="item-product-order">
 <%--           <a href="">--%>
        <asp:HyperLink ID="linkProduct" runat="server" NavigateUrl='<%# "Product.aspx?id=" + Eval("IdSanPham")+"&idCategory="+Eval("IdDanhMuc") %>'>
            <!-- !Render hình ảnh sản phẩm -->
            <img src='<%# "img/"+ Eval("Img") %>' alt="">
              <div class="container-information-product">
                <p class="name-product"><%# Eval("TenSP") %></p>
                <p class="description"><%# Eval("MoTa") %></p>
                <p class="quantity"><%# "X"+ Eval("SOLUONG") %></p>
                <p class="price"><%# Eval("Gia")+" VND" %></p>
              </div>
        </asp:HyperLink>
 <%--           </a>--%>
            <div class="modify">
              <asp:LinkButton ID="linkButton1" runat="server" CommandArgument=<%#Eval("MAHOADON") %> CssClass="buy" Text="" OnClick="LinkButton1_Click">
                <p class="price-total"><%# Eval("THANHTIEN")+" VND" %> </p>
                <button>Mua</button>
              </asp:LinkButton>
              <asp:LinkButton ID="linkButton2" runat="server" CommandArgument=<%#Eval("MAHOADON") %> Text="" OnClick="LinkButton2_Click">
                <i class="fa-solid fa-trash-can"></i>
              </asp:LinkButton>
            </div>
          </li>
    </ItemTemplate>
</asp:Repeater>
        </ul>
      </div>
    </div>
    <script src="js/order.js"></script>
</asp:Content>
