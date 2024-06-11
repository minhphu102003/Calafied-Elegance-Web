using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace DoAnNhom
{
    public partial class Signup : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string emailString = email.Text;
            string userNameString = username.Text;
            string passwordString = password.Text;
            string confirmPasswordString = confirmpassword.Text;

            if (!IsValidEmail(emailString))
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(userNameString))
            {
                return;
            }

            if (passwordString.Length < 6 || !ContainsUpperCaseLetter(passwordString) || !ContainsSpecialCharacter(passwordString))
            {
                return;
            }

            if (passwordString != confirmPasswordString)
            {
                return;
            }
            //lấy ra trường username check thử đã có chưa
            string queryUserName = "select USERNAME from KHACHANG";
            DataTable dt = connect.getData(queryUserName);
            //duyệt qua tất cả username nếu không trùng khớp thì ok cho vào database
            foreach (DataRow row in dt.Rows)
            {
                //vì username trong database là unique nên không được trùng nhau , tương tự khóa chính
                string usernameInRow = row["Username"].ToString(); // Lấy giá trị cột "Username" trong hàng hiện tại

                if(string.Equals(userNameString, usernameInRow, StringComparison.OrdinalIgnoreCase))
                {
                    //nếu trùng thì thoát khỏi function
                    return;
                }
            }
            string update = "insert into KHACHANG ([USERNAME], [EMAIL], [PASSWORD]) VALUES('" + userNameString + "', '" + emailString + "', '" + passwordString + "') SELECT SCOPE_IDENTITY() AS NewMAKHACH";
            int result = connect.comand(update);
            if (result != 0)
            {
                Session["idUser"] = result;
                Response.Redirect("Default.aspx");
            }
        }

        private bool IsValidEmail(string email)
        {
            return new EmailAddressAttribute().IsValid(email);
        }

        private bool ContainsUpperCaseLetter(string input)
        {
            return Regex.IsMatch(input, @"[A-Z]");
        }
        
        private bool ContainsSpecialCharacter(string input)
        {
            return Regex.IsMatch(input, @"[!@#$%^&*(),.?""{}|<>]");
        }
    }
}