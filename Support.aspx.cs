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
    public partial class Support : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                    conn.Open();
                    if (fiQnImage.HasFile)
                    {
                        String strPath = System.IO.Path.GetFileName(fiQnImage.FileName);
                        fiQnImage.SaveAs(Server.MapPath("~/FileUpload/Questions/") + strPath);
                        SqlCommand com = new SqlCommand("INSERT INTO [Questions](QnName, QnStudentID, QnEmail, QnQuestion, QnImage) VALUES (@qnname, @qnstudentid, @qnemail, @qnquestion, @qnimage)", conn);
                        //@qnname, @qnstudentid, @qnemail, @qnquestion, @qnimage
                        com.Parameters.AddWithValue("@qnname", txtName.Text);
                        com.Parameters.AddWithValue("@qnstudentid", txtINTIStudentID.Text);
                        com.Parameters.AddWithValue("@qnemail", txtPsnEmail.Text);
                        com.Parameters.AddWithValue("@qnquestion", txtQuestion.Text);
                        com.Parameters.AddWithValue("@qnimage", Path.GetFileName(fiQnImage.PostedFile.FileName));

                        int k = com.ExecuteNonQuery();
                        if (k != 0)
                        {
                            lblResult.Text = "New record added successfully!";
                            lblResult.ForeColor = System.Drawing.Color.CornflowerBlue;
                        }
                        else
                        {
                            lblResult.Text = "Unable to send the question.";
                            lblResult.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        SqlCommand com = new SqlCommand("INSERT INTO [Questions](QnName, QnStudentID, QnEmail, QnQuestion) VALUES (@qnname, @qnstudentid, @qnemail, @qnquestion)", conn);
                        //@qnname, @qnstudentid, @qnemail, @qnquestion, @qnimage
                        com.Parameters.AddWithValue("@qnname", txtName.Text);
                        com.Parameters.AddWithValue("@qnstudentid", txtINTIStudentID.Text);
                        com.Parameters.AddWithValue("@qnemail", txtPsnEmail.Text);
                        com.Parameters.AddWithValue("@qnquestion", txtQuestion.Text);

                        int k = com.ExecuteNonQuery();
                        if (k != 0)
                        {
                            lblResult.Text = "New record added successfully!";
                            lblResult.ForeColor = System.Drawing.Color.CornflowerBlue;
                        }
                        else
                        {
                            lblResult.Text = "Unable to send the question.";
                            lblResult.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    conn.Close();
            }
                txtName.Text = "";
                txtINTIStudentID.Text = "";
                txtPsnEmail.Text = "";
                txtQuestion.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
                txtName.Text = "";
                txtINTIStudentID.Text = "";
                txtPsnEmail.Text = "";
                txtQuestion.Text = "";
        }
    }
}