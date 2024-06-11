using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DoAnNhom
{
    public partial class Login : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string username = txtUsername.Text;
            string password1 = password.Text;
            string sql = "select * from KHACHANG where USERNAME='" + username + "' and PASSWORD = '" + password1 + "'";
            DataTable dt = connect.getData(sql);
            if (dt.Rows.Count > 0)
            {
                Session["idUser"] = dt.Rows[0]["MAKHACH"].ToString();
                Response.Redirect("Default.aspx");
            }
        }
    }
}