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
    public partial class AddAdmin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["studentid"];
            if (cookie != null)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Users] WHERE StudentID LIKE '%' + @studentID + '%'", conn);
                cmd.Parameters.AddWithValue("@studentID", cookie["studentid"]);

                SqlDataReader dr = cmd.ExecuteReader();
                bool recordfound = dr.Read();
                if (recordfound)
                {
                    lblStudentID.Text = dr["StudentID"].ToString();
                    lblName.Text = dr["Name"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                    lblDOB.Text = dr["DateOfBirth"].ToString();
                    lblMajor.Text = dr["Major"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblContact.Text = dr["ContactNo"].ToString();
                    lblUsername.Text = dr["Username"].ToString();
                    lblPassword.Text = dr["Password"].ToString();
                }
                conn.Close();
            }
        }

        protected void btnAdminAdd_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO [Users](StudentID, Name, Gender, DateOfBirth, Major, Email, ContactNo, Username, Password, IsAdmin) VALUES (@studentid, @name, @gender, @dob, @major, @email, @contactno, @username, @password, @isadmin)", conn);
                com.Parameters.AddWithValue("@studentid", txtStudentID.Text);
                com.Parameters.AddWithValue("@name", txtName.Text);
                com.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                com.Parameters.AddWithValue("@dob", txtDOB.Text);
                com.Parameters.AddWithValue("@major", ddlMajor.SelectedValue);
                com.Parameters.AddWithValue("@email", txtEmail.Text);
                com.Parameters.AddWithValue("@contactno", txtContact.Text);
                com.Parameters.AddWithValue("@username", txtUsername.Text);
                com.Parameters.AddWithValue("@password", txtPassword.Text);
                com.Parameters.AddWithValue("@isadmin", 1);

                int k = com.ExecuteNonQuery();
                if (k != 0)
                {
                    lblAdminStatus.Text = "New record added successfully!";
                    lblAdminStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                else
                {
                    lblAdminStatus.Text = "Unable to add the new admin.";
                    lblAdminStatus.ForeColor = System.Drawing.Color.Red;
                }
                conn.Close();
                txtStudentID.Text = "";
                txtName.Text = "";
                ddlGender.SelectedValue = "";
                txtDOB.Text = "";
                ddlMajor.SelectedValue = "";
                txtEmail.Text = "";
                txtContact.Text = "";
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }

        protected void btnAdminUpdate_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();

                string UpdateSql = "UPDATE Users SET Name=@name, Gender=@gender, DateOfBirth=@dob, Major=@major, Email=@email, ContactNo=@contactno, Username=@username, Password=@password WHERE StudentID=@studentid";
                SqlCommand com = new SqlCommand(UpdateSql, conn);
                {
                    com.Parameters.AddWithValue("@studentid", txtStudentID.Text);
                    com.Parameters.AddWithValue("@name", txtName.Text);
                    com.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                    com.Parameters.AddWithValue("@dob", txtDOB.Text);
                    com.Parameters.AddWithValue("@major", ddlMajor.SelectedValue);
                    com.Parameters.AddWithValue("@email", txtEmail.Text);
                    com.Parameters.AddWithValue("@contactno", txtContact.Text);
                    com.Parameters.AddWithValue("@username", txtUsername.Text);
                    com.Parameters.AddWithValue("@password", txtPassword.Text);

                    com.ExecuteNonQuery();
                }
                lblAdminStatus.Text = "Record updated successfully!";
                lblAdminStatus.ForeColor = System.Drawing.Color.Green;
                //Response.Write("<sript>alert('Record updated successfully!')</script>");
                com.Dispose(); //release any "unmanaged" resources
                conn.Close();

                btnAdminAdd.Visible = true;
                btnAdminUpdate.Visible = false;
                btnAdminUpdateClear.Visible = false;
                txtStudentID.Text = "";
                txtStudentID.Enabled = true;
                txtName.Text = "";
                ddlGender.SelectedValue = "";
                txtDOB.Text = "";
                ddlMajor.SelectedValue = "";
                txtEmail.Text = "";
                txtContact.Text = "";
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }

        protected void btnAdminAddClear_Click(object sender, EventArgs e)
        {
            txtStudentID.Text = "";
            txtName.Text = "";
            ddlGender.SelectedValue = "";
            txtDOB.Text = "";
            ddlMajor.SelectedValue = "";
            txtEmail.Text = "";
            txtContact.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnAdminEdit_Click(object sender, EventArgs e)
        {
            btnAdminUpdate.Visible = true;
            btnAdminUpdateClear.Visible = true;
            btnAdminAdd.Visible = false;
            btnAdminAddClear.Visible = false;
            txtStudentID.Text = lblStudentID.Text;
            txtStudentID.Enabled = false;
            txtName.Text = lblName.Text;
            ddlGender.SelectedValue = lblGender.Text;
            txtDOB.Text = lblDOB.Text;
            ddlMajor.SelectedValue = lblMajor.Text;
            txtEmail.Text = lblEmail.Text;
            txtContact.Text = lblContact.Text;
            txtUsername.Text = lblUsername.Text;
            txtPassword.Text = lblPassword.Text;
        }

        protected void btnAdminUpdateClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            ddlGender.SelectedValue = "";
            txtDOB.Text = "";
            ddlMajor.SelectedValue = "";
            txtEmail.Text = "";
            txtContact.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}