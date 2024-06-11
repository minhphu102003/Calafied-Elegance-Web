using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnNhom
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Connect connect = new Connect();
                string query = "select * from SanPham where NgayNhap >= dateadd(day, -60, getdate())";
                rptProducts.DataSource = connect.getData(query);
                rptProducts.DataBind();

                string query1 = "select * from DanhMucSanPham";
                Repeater1.DataSource = connect.getData(query1);
                Repeater1.DataBind();

                string query2 = "select * from SanPham where Star>=4";
                Repeater2.DataSource = connect.getData(query2);
                Repeater2.DataBind();
            }
        }
    }
}