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
    public partial class Maintenance : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bestphoto.Visible = false;
            ann.Visible = false;
        }

        protected void btnDefault_Click(object sender, EventArgs e)
        {
            bestphoto.Visible = true;
            
        }

        protected void btnAnn_Click(object sender, EventArgs e)
        {
            ann.Visible = true;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                if (fiUpImage.HasFile)
                {
                    String strPath = System.IO.Path.GetFileName(fiUpImage.FileName);
                    fiUpImage.SaveAs(Server.MapPath("~/FileUpload/BestPhoto/") + strPath);
                    SqlCommand com = new SqlCommand("INSERT INTO [BestPhoto](BestImage, BestImagePhotographer, BestImageDescription) VALUES (@bestimage, @photographer, @description)", conn);
                    com.Parameters.AddWithValue("@bestimage", Path.GetFileName(fiUpImage.PostedFile.FileName));
                    com.Parameters.AddWithValue("@photographer", txtPhotographer.Text);
                    com.Parameters.AddWithValue("@description", txtDesc.Text);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblDefaultStatus.Text = "New record added successfully!";
                        lblDefaultStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblDefaultStatus.Text = "Unable to add the Best Photo of Week.";
                        lblDefaultStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                conn.Close();
            }
            txtPhotographer.Text = "";
            txtDesc.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            bestphoto.Visible = true;
            txtPhotographer.Text = "";
            txtDesc.Text = "";
        }

        protected void btnAnnPost_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                if (fiAnnAttachedFile.HasFile)
                {
                    String strPath = System.IO.Path.GetFileName(fiAnnAttachedFile.FileName);
                    fiAnnAttachedFile.SaveAs(Server.MapPath("~/FileUpload/Annoucements/") + strPath);
                    SqlCommand com = new SqlCommand("INSERT INTO [Announcements](AnnTitle, AnnDetails, AnnAttachedFile) VALUES (@anntitle, @anndetails, @annattachedfile)", conn);
                    com.Parameters.AddWithValue("@anntitle", txtAnnTitle.Text);
                    com.Parameters.AddWithValue("@anndetails", txtAnnDetails.Text);
                    com.Parameters.AddWithValue("@annattachedfile", Path.GetFileName(fiAnnAttachedFile.PostedFile.FileName));

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblAnnStatus.Text = "New record added successfully!";
                        lblAnnStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblAnnStatus.Text = "Unable to create the announcement.";
                        lblAnnStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    SqlCommand com = new SqlCommand("INSERT INTO [Announcements](AnnTitle, AnnDetails) VALUES (@anntitle, @anndetails)", conn);
                    com.Parameters.AddWithValue("@anntitle", txtAnnTitle.Text);
                    com.Parameters.AddWithValue("@anndetails", txtAnnDetails.Text);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblAnnStatus.Text = "New record added successfully!";
                        lblAnnStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblAnnStatus.Text = "Unable to create the announcement.";
                        lblAnnStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                conn.Close();
            }
            txtAnnTitle.Text = "";
            txtAnnDetails.Text = "";
        }

        protected void btnAnnClear_Click(object sender, EventArgs e)
        {
            ann.Visible = true;
            txtAnnTitle.Text = "";
            txtAnnDetails.Text = "";
        }
    }
}