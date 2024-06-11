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
    public partial class BlogDetail : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string idBlog = Request.QueryString["id"] + "";
            string sql = "select * from BLOG where blog_id=" + idBlog;
            Repeater1.DataSource = connect.getData(sql);
            Repeater1.DataBind();

            Repeater2.DataSource = connect.getData(sql);
            Repeater2.DataBind();


            string blogDetail = "SELECT * FROM PART where BLOG_ID="+idBlog +" order by ORDER1";
            Repeater3.DataSource = connect.getData(blogDetail);
            Repeater3.DataBind();


            //DataTable dt = connect.getData(blogDetail);
            //foreach (DataRow row in dt.Rows)
            //{
            //    // Lấy giá trị từ cơ sở dữ liệu
            //    string tenTieuDe = row["TITLE"].ToString();
            //    string content = row["CONTENTPART"].ToString();
            //    string img = row["IMAGEPART"].ToString();

            //    // Tạo và cấu hình thẻ HTML trong mã code-behind
            //    HtmlGenericControl h3Element = new HtmlGenericControl("h3");
            //    h3Element.Attributes.Add("class","title-part");
            //    h3Element.InnerText = tenTieuDe;

            //    HtmlGenericControl pElement = new HtmlGenericControl("p");
            //    pElement.Attributes.Add("class", "description-part");
            //    pElement.InnerText = content;

            //    Div1.Controls.Add(h3Element);
            //    Div1.Controls.Add(pElement);

            //    if (!string.IsNullOrEmpty(img))
            //    {
            //        HtmlGenericControl imgElement = new HtmlGenericControl("img");
            //        imgElement.Attributes.Add("src", "img/"+img); // Đường dẫn ảnh từ cơ sở dữ liệu
            //        Div1.Controls.Add(imgElement);
            //    }
            //}
            // định làm như này để kiểm tra nếu có ảnh thì render ra thẻ img nhưng mà khó quá nên thôi
            //để giữ lại css đã làm giao diên ở trước nên phải rườm ra như này.
        }
        }
 }