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
    public partial class Events : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
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
            //                gvEvent.DataSource = dt;
            //                gvEvent.DataBind();
            //            }
            //        }
            //    }
            //}

            //if (conn.State == ConnectionState.Closed)
            //{
            //    conn.Open();
            //    SqlCommand cmd1 = new SqlCommand("SELECT * FROM [Annoucements]", conn);
            //    SqlDataReader dr1 = cmd1.ExecuteReader();
            //    bool recordfound1 = dr1.Read();
            //    if (recordfound1)
            //    {
            //        gvEvent.DataSource = dr1;
            //        gvEvent.DataBind();
            //    }
            //    else
            //    {
            //        lblEvents.Text = "There is no any event yet.";
            //    }
            //    conn.Close();
            //}
        }

        protected void btnPropEventAdd_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO [ProposedEvents](PropEventTitle, PropEventDescription) VALUES (@propeventtitle, @propeventdescription)", conn);
                com.Parameters.AddWithValue("@propeventtitle", txtPropEventTitle.Text);
                com.Parameters.AddWithValue("@propeventdescription", txtPropEventDesc.Text);

                int k = com.ExecuteNonQuery();
                if (k != 0)
                {
                    lblPropEventStatus.Text = "New record added successfully!";
                    lblPropEventStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                else
                {
                    lblPropEventStatus.Text = "Unable to add the proposed event.";
                    lblPropEventStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
            conn.Close();
            txtPropEventTitle.Text = "";
            txtPropEventDesc.Text = "";
        }

        protected void btnPropEventClear_Click(object sender, EventArgs e)
        {
            txtPropEventTitle.Text = "";
            txtPropEventDesc.Text = "";
        }
        private void BindGrid()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Events]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvEvent.DataSource = dt;
                            gvEvent.DataBind();
                        }
                    }
                }
            }
        }
    }
}