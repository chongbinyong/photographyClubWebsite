using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace PRGGroupProject
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO [Users](StudentID,Name,Gender,DateOfBirth,Major,Email,ContactNo,Username,Password,IsAdmin) VALUES(@StudentID,@Name,@Gender,@DateOfBirth,@Major,@Email,@ContactNo,@Username,@Password,@IsAdmin)", conn);
                com.Parameters.AddWithValue("@StudentID", txtStudentID.Text);
                com.Parameters.AddWithValue("@Name", txtName.Text);
                com.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                com.Parameters.AddWithValue("@DateOfBirth", txtBirth.Text);
                com.Parameters.AddWithValue("@Major", ddlMajor.SelectedValue);
                com.Parameters.AddWithValue("@Email", txtEmail.Text);
                com.Parameters.AddWithValue("@ContactNo", txtContact.Text);
                com.Parameters.AddWithValue("@Username", txtUsername.Text);
                com.Parameters.AddWithValue("@Password", txtPassword.Text);
                com.Parameters.AddWithValue("@IsAdmin", 0);

                int k = com.ExecuteNonQuery();
                if (k != 0)
                {
                    lblStatus.Text = "New record added successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                else
                {
                    lblStatus.Text = "Unable to add the new record";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
                conn.Close();
            }
        }
    }
}