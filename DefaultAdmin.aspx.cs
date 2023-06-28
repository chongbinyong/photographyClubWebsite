using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace PRGGroupProject
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid1();
                this.BindGrid2();
            }

            //string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            //using (SqlConnection con = new SqlConnection(conStr))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Events]"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                gvAnnouncements.DataSource = dt;
            //                gvAnnouncements.DataBind();
            //            }
            //        }
            //    }

            //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM [BestPhoto]"))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter())
            //        {
            //            cmd.Connection = con;
            //            sda.SelectCommand = cmd;
            //            using (DataTable dt = new DataTable())
            //            {
            //                sda.Fill(dt);
            //                gvBestPhoto.DataSource = dt;
            //                gvBestPhoto.DataBind();
            //            }
            //        }
            //    }
            //}

            //if (conn.State == ConnectionState.Closed)
            //{
            //    conn.Open();
            //    SqlCommand cmd1 = new SqlCommand("SELECT * FROM [Annoucements]", conn);
            //    SqlCommand cmd2 = new SqlCommand("SELECT * FROM [BestPhoto]", conn);
            //    SqlDataReader dr1 = cmd1.ExecuteReader();
            //    SqlDataReader dr2 = cmd2.ExecuteReader();
            //    bool recordfound1 = dr1.Read();
            //    bool recordfound2 = dr2.Read();
            //    if (recordfound1)
            //    {
            //        gvAnnouncements.DataSource = dr1;
            //        gvAnnouncements.DataBind();
            //    }
            //    else
            //    {
            //        lblAnnouncements.Text = "There is no any announcement yet.";
            //    }

            //    if (recordfound2)
            //    {
            //        gvBestPhoto.DataSource = dr1;
            //        gvBestPhoto.DataBind();
            //    }
            //    else
            //    {
            //        lblBestPhoto.Text = "There is no any best photo of week yet.";
            //    }
            //    conn.Close();
            //}
        }
        private void BindGrid1()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Announcements]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvAnnouncements.DataSource = dt;
                            gvAnnouncements.DataBind();
                        }
                    }
                }
            }
        }
        private void BindGrid2()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [BestPhoto]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvBestPhoto.DataSource = dt;
                            gvBestPhoto.DataBind();
                        }
                    }
                }
            }
        }
    }
}