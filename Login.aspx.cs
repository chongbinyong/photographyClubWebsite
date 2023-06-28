using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace PRGGroupProject
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("StudentID");
            cookie["StudentID"] = txtStudentID.Text;
            Response.Cookies.Add(cookie);
            cookie.Expires = DateTime.Now.AddDays(30);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Users] WHERE StudentID=@StudentID and Password=@Password", conn);
            cmd.Parameters.AddWithValue("@StudentID", txtStudentID.Text);
            cmd.Parameters.AddWithValue("@Password", txtPwd.Text);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["UserName"] = dr["Username"].ToString();
                    int userRole = Convert.ToInt16(dr["IsAdmin"].ToString());

                    switch (userRole)
                    {
                        case 0:
                            Response.Redirect("~/DefaultMember.aspx"); /*~/ProductsPage OR ~/NewFolder/ProductsPage*/
                            break;
                        case 1:
                            Response.Redirect("~/DefaultAdmin.aspx");
                            break;
                    }
                }
            }
            else
            {
                lblMessage.Text = "Username and / or password not found!";
            }
            conn.Close();
        }
    }
}