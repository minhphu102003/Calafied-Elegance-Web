using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DoAnNhom
{
    public partial class InformationUser : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            string idUser = Session["idUser"] + "";
            if (idUser != "")
            {
                string sql = "select * from KHACHANG where MAKHACH=" + idUser;
                DataTable dt = connect.getData(sql);
                foreach (DataRow rows in dt.Rows)
                {
                    string userName = rows["USERNAME"].ToString();
                    string hoTen = rows["HOTEN"].ToString();
                    string email = rows["EMAIL"].ToString()+" ";
                    string phoneNumber = rows["DIENTHOAI"].ToString()+" ";
                    //vì userName ở database là unique và not null nên luôn có giá trị khỏi check 
                    username.Text = userName;
                    if (hoTen != "")
                    {
                        name.Text = hoTen;
                    }
                    if (email != "")
                    {
                        Email.Text = email;
                    }
                    if(phoneNumber != "")
                    {
                        PhoneNumber.Text = phoneNumber;
                    }
                }
            }

            //chưa làm cái cập nhật thông tin cái này cũng hơi khoai khi phải check input phù hợp với constraint ở database


        }
    }
}