using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace DoAnNhom
{
    public partial class Blog : System.Web.UI.Page
    {
        //tạo một kết nối tới csdl ở đây lớp customize được đặt là Connect
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select * from BLOG";
                Repeater1.DataSource = connect.getData(query);
                Repeater1.DataBind();
            }
        }
    }
}