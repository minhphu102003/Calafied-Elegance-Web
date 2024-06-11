using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DoAnNhom
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Connect connect = new Connect();
                string idCategory = Request.QueryString["idCategory"] + "";
                string query = "";
                if (idCategory == "")
                {
                    //mọi category đều được gán id trên url, chỉ có một trường hợp khi người dùng 
                    //click vào link cứng của trang web thì sẽ vào block code này 
                    query = "select * from SanPham";
                }
                else
                {
                    query = "select * from SanPham where IdDanhMuc=" + idCategory;
                }
                dlProducts.DataSource = connect.getData(query);
                dlProducts.DataBind();

                string sqlCategory = "select * from DanhMucSanPham where IDdanhmuc = " + idCategory;
                Repeater1.DataSource = connect.getData(sqlCategory);
                Repeater1.DataBind();

                Repeater2.DataSource = connect.getData(sqlCategory);
                Repeater2.DataBind();
            }
        }
    }
}