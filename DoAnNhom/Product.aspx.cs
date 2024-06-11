using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DoAnNhom
{
    public partial class Product : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idProduct = Request.QueryString["id"];
                string sqlQuery = "select * from SanPham where IdSanPham =" + idProduct;
                Repeater1.DataSource = connect.getData(sqlQuery);
                Repeater1.DataBind();

                Repeater2.DataSource = connect.getData(sqlQuery);
                Repeater2.DataBind();

                Repeater3.DataSource = connect.getData(sqlQuery);
                Repeater3.DataBind();

                Repeater4.DataSource = connect.getData(sqlQuery);
                Repeater4.DataBind();

                string idCategory = Request.QueryString["idCategory"];
                //resopne.redirect cần thêm idCategory
                string sqlQueryCategory = "select * from DanhMucSanPham where IDdanhmuc=" + idCategory;
                rpLinkheader.DataSource = connect.getData(sqlQueryCategory);
                rpLinkheader.DataBind();

                Repeater8.DataSource = connect.getData(sqlQueryCategory);
                Repeater8.DataBind();

                //truy vấn chỉ lấy 4 sản phẩm đầu tiên của những sản phẩm cũng danh mục và có id với sản phẩm dang active ở trang 
                string sqlRelativeProduct = "select top 4 * from SanPham where IdDanhMuc=" + idCategory +"and IdSanPham!="+idProduct;
                Repeater5.DataSource = connect.getData(sqlRelativeProduct);
                Repeater5.DataBind();

                // t muốn sau này maintain ở phía admin có thể sửa tất cả dữ liệu trên trang sản phẩm nên giờ làm nốt mấy cái nhỏ nhỏ này luôn
                string queryWebProduct = "select * from SanPham where IdSanPham =" + idProduct;
                Repeater6.DataSource = connect.getData(sqlQuery);
                Repeater6.DataBind();

                Repeater7.DataSource = connect.getData(sqlQuery);
                Repeater7.DataBind();

                string queryAddtionImg = "select * from HinhSanPham where IDSANPHAM=" + idProduct;
                Repeater9.DataSource = connect.getData(queryAddtionImg);
                Repeater9.DataBind();

                string queryColor = "select * from Mausac where IDSANPHAM = " + idProduct;
                DataTable dt = connect.getData(queryColor);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        string tenMau = row["TenMau"].ToString();
                        string idMau = row["ID"].ToString();

                        ListItem listItem = new ListItem(tenMau, idMau);
                        dropdownColor.Items.Add(listItem);
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string makhach = Session["idUser"] + "";
            if (makhach != "")
            {
                string number = TextBox1.Text;
                string idProduct = Request.QueryString["id"];
                string selectedValue = dropdownColor.SelectedValue;
                string insertQuery = "";
                //thêm vào giỏ hàng có nghĩa là chờ thanh toán => trạng thái hóa đơn = 1
                string sqlcheck = "SELECT HOADON.MAHOADON FROM HOADON , CHITIETHOADON WHERE HOADON.MAHOADON=CHITIETHOADON.MAHOADON AND TRANGTHAIHOADON=1 AND MAKHACH=" + makhach + " AND MASANPHAM=" + idProduct;
                int mahoadon = connect.comand(sqlcheck);
                DataTable dt = connect.getData(sqlcheck);
                if (dt.Rows.Count > 0 && mahoadon != 0)
                {
                    insertQuery = "update chitiethoadon set SOLUONG = SOLUONG +" + number + " WHERE MAHOADON=" + mahoadon + "AND MASANPHAM=" + idProduct;
                    int result = connect.update(insertQuery);
                    if (result != 0)
                    {
                        Response.Redirect("Order.aspx");
                    }
                }
                else
                {
                    if (selectedValue != null)
                    {
                        insertQuery = "INSERT INTO HOADON (MAKHACH, TRANGTHAIHOADON, GHICHU) VALUES ('" + makhach + "',1 ,'" + selectedValue + "') SELECT SCOPE_IDENTITY() AS NewMAHOADON";
                    }
                    else
                    {
                        insertQuery = "INSERT INTO HOADON (MAKHACH, TRANGTHAIHOADON) VALUES ('" + makhach + "',1 ) SELECT SCOPE_IDENTITY() AS NewMAHOADON";
                    }
                    //result chính là mã hóa đơn
                    //giờ ta tiếp tục thêm vào trong Chitiethoa don
                    int result = connect.comand(insertQuery);
                    if (result != 0)
                    {
                        string query = "INSERT INTO CHITIETHOADON VALUES(" + result + "," + idProduct + "," + number + ")";
                        int k = connect.update(query);
                        if (k != 0)
                        {
                            Response.Redirect("Order.aspx");
                        }
                    }
                }
            }
        }
    }
}