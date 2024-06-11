using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnNhom
{
    public partial class Account1 : System.Web.UI.MasterPage
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            string iduser = Session["idUser"] + "";
            if (iduser != "")
            {
                string query = "select * from KHACHANG where MAKHACH =" + iduser;
                Repeater1.DataSource = connect.getData(query);
                Repeater1.DataBind();
            }
        }
    }
}