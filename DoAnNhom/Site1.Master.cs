using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace DoAnNhom
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        Connect connect = new Connect();
        //tạo một kết nối đến database
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                string query = "Select * from DanhMucSanPham";
                //đổ dữ liệu ra table
                DataTable dt = connect.getData(query);
                foreach (DataRow row in dt.Rows)
                {
                    // Lấy giá trị của cột "TenDanhMuc"
                    string tenDanhMuc = row["TenDanhMuc"].ToString();
                    string id = row["IDdanhmuc"].ToString();
                    HtmlGenericControl liElement = new HtmlGenericControl("li");
                    liElement.Attributes.Add("class", "sub-item");

                    // Tạo HyperLink và đặt nội dung và URL
                    HyperLink hyperLink = new HyperLink();
                    hyperLink.Attributes.Add("OnClick", "HyperLink_Click");
                    hyperLink.Text = tenDanhMuc;
                    hyperLink.NavigateUrl = "Category.aspx?idCategory=" + id;
                    // Thêm HyperLink vào thẻ <li>
                    liElement.Controls.Add(hyperLink);

                    // Thêm thẻ <li> vào submenu
                    subMenu.Controls.Add(liElement);

                    //để giữ lại css đã làm giao diên ở trước nên phải rườm ra như này. thêm li và class vào để hưởng được css
                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("Order.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string sql = "select * from KHACHANG where USERNAME='" + username + "' and PASSWORD = '" + password + "'";
            DataTable dt = connect.getData(sql);
            if (dt.Rows.Count > 0)
            {
                Session["idUser"] = dt.Rows[0]["MAKHACH"].ToString();
                Response.Redirect("Default.aspx");
            }
        }
    }

}