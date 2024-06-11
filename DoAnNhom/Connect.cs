using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DoAnNhom
{
    public class Connect : System.Web.UI.Page
    {
        SqlConnection con;

        public void connection()
        {
            //Có thể thay bằng 
             string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            //string stringconnect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("/App_Data/Database1.mdf") + "; Integrated Security=True";
            con = new SqlConnection(connectionString);
            con.Open();
        }

        public void close()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        public DataTable getData(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                this.connection();
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }
            catch(Exception ex)
            {

            }
            finally
            {
                this.close();
            }
            return dt;
        }


        public int update(string query)
        {
            int result = 0;
            try
            {
                this.connection();
                SqlCommand cmd = new SqlCommand(query,con);
                result = cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                this.close();
            }
            return result;
        }

        public int comand(string sql)
        {
            int result = 0;
            try
            {
                this.connection();
                SqlCommand cmd = new SqlCommand(sql, con);
                result = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch
            {

            }
            finally
            {
                this.close();
            }
            return result;
        }

    }
}