using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnNhom
{
    public partial class Order : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string trangthai = Request.QueryString["id"] + "";
            string query = "";
            string username = Session["idUser"] + "";
            if (username == "") return;
            if (trangthai == "")
            {
                //hiển thị tất cả đơn hàng
                query = "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username;
            }
            else
            {
                query= "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username +" and TRANGTHAIHOADON = "+trangthai;
            }
            Repeater1.DataSource = connect.getData(query);
            Repeater1.DataBind();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string mahoadon = ((LinkButton)sender).CommandArgument;
            string update1 = "update HOADON set TRANGTHAIHOADON = 2 where MAHOADON = " + mahoadon;
            int result = connect.update(update1);
            if (result != 0)
            {
                string trangthai = Request.QueryString["id"] + "";
                string query = "";
                string username = Session["idUser"] + "";
                if (username == "") return;
                if (trangthai == "")
                {
                    //hiển thị tất cả đơn hàng
                    query = "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username;
                }
                else
                {
                    query = "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username + " and TRANGTHAIHOADON = " + trangthai;
                }
                Repeater1.DataSource = connect.getData(query);
                Repeater1.DataBind();
                Response.Redirect("Order.aspx?id=2");
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string mahoadon = ((LinkButton)sender).CommandArgument;
            string deleteCT = "delete CHITIETHOADON where MAHOADON = " + mahoadon;
            int result1 = connect.update(deleteCT);
            string deleteHoaDon = "delete HOADON where MAHOADON = " + mahoadon;
            int result = connect.update(deleteHoaDon);
            if(result != 0 && result1 != 0)
            {
                string trangthai = Request.QueryString["id"] + "";
                string query = "";
                string username = Session["idUser"] + "";
                if (username == "") return;
                if (trangthai == "")
                {
                    //hiển thị tất cả đơn hàng
                    query = "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username;
                }
                else
                {
                    query = "select HD.MAHOADON, TenSP, IdSanPham, IdDanhMuc ,MoTa , Gia , Img , SOLUONG , SOLUONG * Gia AS THANHTIEN FROM CHITIETHOADON AS CT , HOADON AS HD , SanPham where HD.MAHOADON = CT.MAHOADON AND CT.MASANPHAM = IdSanPham and MAKHACH = " + username + " and TRANGTHAIHOADON = " + trangthai;
                }
                Repeater1.DataSource = connect.getData(query);
                Repeater1.DataBind();
            }
        }





    }
}