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
    public partial class EditEvents : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            result.Visible = false;
            btnEventUpdate.Visible = false;
            btnEventDelete.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Events] WHERE EventID LIKE '%' + @eventID + '%'", conn);
            cmd.Parameters.AddWithValue("@eventID", txtSearch.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            bool recordfound = dr.Read();
            if (recordfound)
            {
                result.Visible = true;
                lblResult.Text = "Record found!";
                lblResult.ForeColor = System.Drawing.Color.Green;
                lblEventID.Text = dr["EventID"].ToString();
                lblEventName.Text = dr["EventName"].ToString();
                lblEventDesc.Text = dr["EventDescription"].ToString();
                string path = "~/FileUpload/Events/";
                imgEventImage.ImageUrl = path + dr["EventImage"].ToString(); 
            }
            else
            {
                lblResult.Text = "Record not found...";
                lblResult.ForeColor = System.Drawing.Color.Red;
                result.Visible = false;
            }
            conn.Close();
        }

        protected void btnEventAdd_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                if (fiEventImage.HasFile)
                {
                    String strPath = System.IO.Path.GetFileName(fiEventImage.FileName);
                    fiEventImage.SaveAs(Server.MapPath("~/FileUpload/Events/") + strPath);
                    SqlCommand com = new SqlCommand("INSERT INTO [Events](EventID, EventName, EventDescription, EventImage) VALUES (@eventid, @eventname, @eventdesc, @eventimage)", conn);
                    com.Parameters.AddWithValue("@eventid", txtEventID.Text);
                    com.Parameters.AddWithValue("@eventname", txtEventName.Text);
                    com.Parameters.AddWithValue("@eventdesc", txtEventDesc.Text);
                    com.Parameters.AddWithValue("@eventimage", Path.GetFileName(fiEventImage.PostedFile.FileName));

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblEventStatus.Text = "New record added successfully!";
                        lblEventStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblEventStatus.Text = "Unable to create the event.";
                        lblEventStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    SqlCommand com = new SqlCommand("INSERT INTO [Events](EventID, EventName, EventDescription) VALUES (@eventid, @eventname, @eventdesc)", conn);
                    com.Parameters.AddWithValue("@eventid", txtEventID.Text);
                    com.Parameters.AddWithValue("@eventname", txtEventName.Text);
                    com.Parameters.AddWithValue("@eventdesc", txtEventDesc.Text);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblEventStatus.Text = "New record added successfully!";
                        lblEventStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblEventStatus.Text = "Unable to create the event.";
                        lblEventStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                conn.Close();
            }
            txtEventID.Text = "";
            txtEventName.Text = "";
            txtEventDesc.Text = "";
        }

        protected void btnEventUpdate_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                if (fiEventImage.HasFile)
                {
                    String strPath = System.IO.Path.GetFileName(fiEventImage.FileName);
                    fiEventImage.SaveAs(Server.MapPath("~/FileUpload/Events/") + strPath);
                    string UpdateSql = "UPDATE Events SET EventName=@eventname, EventDescription=@eventdesc, EventImage=@eventimage WHERE EventID=@eventid";
                    SqlCommand com = new SqlCommand(UpdateSql, conn);
                    com.Parameters.AddWithValue("@eventid", txtEventID.Text);
                    com.Parameters.AddWithValue("@eventname", txtEventName.Text);
                    com.Parameters.AddWithValue("@eventdesc", txtEventDesc.Text);
                    com.Parameters.AddWithValue("@eventimage", Path.GetFileName(fiEventImage.PostedFile.FileName));

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblEventStatus.Text = "Record updated successfully!";
                        lblEventStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblEventStatus.Text = "Unable to update the event.";
                        lblEventStatus.ForeColor = System.Drawing.Color.Red;
                    }
                    com.Dispose();
                    conn.Close();
                }
                else
                {
                    string UpdateSql = "UPDATE Events SET EventName=@eventname, EventDescription=@eventdesc WHERE EventID=@eventid";
                    SqlCommand com = new SqlCommand(UpdateSql, conn);
                    com.Parameters.AddWithValue("@eventid", txtEventID.Text);
                    com.Parameters.AddWithValue("@eventname", txtEventName.Text);
                    com.Parameters.AddWithValue("@eventdesc", txtEventDesc.Text);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblEventStatus.Text = "Record updated successfully!";
                        lblEventStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblEventStatus.Text = "Unable to update the event.";
                        lblEventStatus.ForeColor = System.Drawing.Color.Red;
                    }
                    com.Dispose();
                    conn.Close();
                }
            }
            txtEventID.Text = "";
            txtEventName.Text = "";
            txtEventDesc.Text = "";
            btnEventAdd.Visible = true;
            btnEventUpdate.Visible = false;
            btnEventDelete.Visible = false;
        }

        protected void btnEventDelete_Click(object sender, EventArgs e)
        {
            result.Visible = false;
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM EVENTS WHERE EventID=@Id", conn))
                {
                    cmd.Parameters.AddWithValue("@Id", txtEventID.Text);
                    int rows = cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Record deleted successfully!')</script>");
                    conn.Close();
                    txtEventID.Text = "";
                    txtEventName.Text = "";
                    txtEventDesc.Text = "";
                    btnEventAdd.Visible = true;
                    btnEventUpdate.Visible = false;
                    btnEventDelete.Visible = false;
                }
            }
        }

        protected void btnEventClear_Click(object sender, EventArgs e)
        {
            txtEventID.Text = "";
            txtEventName.Text = "";
            txtEventDesc.Text = "";
        }

        protected void btnEventEdit_Click(object sender, EventArgs e)
        {
            result.Visible = false;
            btnEventAdd.Visible = false;
            btnEventUpdate.Visible = true;
            btnEventDelete.Visible = true;

            txtEventID.Text = lblEventID.Text;
            txtEventName.Text = lblEventName.Text;
            txtEventDesc.Text = lblEventDesc.Text;
        }

        private void BindGrid()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [ProposedEvents]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvPropEvents.DataSource = dt;
                            gvPropEvents.DataBind();
                        }
                    }
                }
            }
        }
    }
}