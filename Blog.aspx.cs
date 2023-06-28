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
    public partial class Blog : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Photography"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //YourBlog.Visible = false;
            //OtherBlogs.Visible = false;
            HttpCookie cookie = Request.Cookies["studentid"];
            if (cookie != null)
            {
                conn.Open();
                //string sql1 = "SELECT BlogsTitle, BlogsDescription, BlogsFileUpload, BlogsDateTime FROM [Blogs] WHERE BlogsStudentID = @studentid";
                //string sql1 = "SELECT * FROM [Blogs] WHERE BlogsStudentID = @studentid";
                //string sql2 = "SELECT ReplyUsername, ReplyMessage, ReplyDateTime FROM [Reply] WHERE ReplyStudentID = @studentid";
                //string sql2 = "SELECT * FROM [Reply] WHERE ReplyStudentID = @studentid";
                string sql3 = "SELECT Username FROM [Users] WHERE StudentID = @studentid";
                string sql4 = "SELECT StudentID, Username FROM [USERS] WHERE StudentID = @studentid";
                //SqlCommand cmd1 = new SqlCommand(sql1, conn);
                //SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlCommand cmd3 = new SqlCommand(sql3, conn);
                SqlCommand cmd4 = new SqlCommand(sql4, conn);
                //cmd1.Parameters.AddWithValue("@studentid", cookie["studentid"]);
                //cmd2.Parameters.AddWithValue("@studentid", cookie["studentid"]);
                cmd3.Parameters.AddWithValue("@studentid", cookie["studentid"]);
                cmd4.Parameters.AddWithValue("@studentid", cookie["studentid"]);

                //SqlDataReader dr1 = cmd1.ExecuteReader();
                //SqlDataReader dr2 = cmd2.ExecuteReader();
                SqlDataReader dr3 = cmd3.ExecuteReader();
                SqlDataReader dr4 = cmd4.ExecuteReader();
                //bool recordfound1 = dr1.Read();
                //bool recordfound2 = dr2.Read();
                bool recordfound3 = dr3.Read();
                bool recordfound4 = dr4.Read();
                //if (recordfound1)
                //{
                //    gvBlog.DataSource = dr1;
                //    gvBlog.DataBind();
                //}
                //else
                //{
                //    lblBlog.Text = "You haven't post any blog yet.";
                //}

                //if (recordfound2)
                //{
                //    gvReply.DataSource = dr2;
                //    gvReply.DataBind();
                //}
                //else
                //{
                //    lblReply.Text = "You didn't have any reply yet.";
                //}

                if (recordfound3)
                {
                    txtReplyUsername.Text = dr3["Username"].ToString();
                }

                if (recordfound4)
                {
                    txtBlogsStudentID.Text = dr4["StudentID"].ToString();
                    txtBlogsUsername.Text = dr4["Username"].ToString();
                }
                conn.Close();

                if (!this.IsPostBack)
                {
                    this.BindGrid1();
                    this.BindGrid2();
                    this.BindGrid3();
                    this.BindGrid4();
                    ddlOtherBlogs.DataSource = SqlDSOtherBlogs;
                    ddlOtherBlogs.DataBind();

                    ListItem myDefaultItem = new ListItem("(please select one)", string.Empty);
                    myDefaultItem.Selected = true;
                    ddlOtherBlogs.Items.Insert(0, myDefaultItem);
                }
            }
        }

        protected void ddlOtherBlogs_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid1();
            BindGrid2();
        }

        private void BindGrid1()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT BlogsTitle, BlogsDescription, BlogsFileUpload, BlogsDateTime FROM [Blogs] WHERE BlogsStudentID=@id"))
                {
                    string cat = ddlOtherBlogs.SelectedValue.ToString();
                    cmd.Parameters.AddWithValue("@id", cat);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvOtherBlogs.DataSource = dt;
                            gvOtherBlogs.DataBind();
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
                using (SqlCommand cmd = new SqlCommand("SELECT ReplyUsername, ReplyMessage, ReplyDateTime FROM [Reply] WHERE ReplyStudentID=@id"))
                {
                    string cat = ddlOtherBlogs.SelectedValue.ToString();
                    cmd.Parameters.AddWithValue("@id", cat);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvOtherReply.DataSource = dt;
                            gvOtherReply.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnBlog_Click(object sender, EventArgs e)
        {
            YourBlog.Visible = true;
            OtherBlogs.Visible = false;
        }

        protected void btnOtherBlogs_Click(object sender, EventArgs e)
        {
            OtherBlogs.Visible = true;
            YourBlog.Visible = false;
        }

        protected void btnReplyPost_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO [Reply](ReplyStudentID, ReplyUsername, ReplyMessage, ReplyDateTime) VALUES (@id, @username, @msg, @datetime)", conn);
                string cat = ddlOtherBlogs.SelectedValue.ToString();
                com.Parameters.AddWithValue("@id", cat);
                com.Parameters.AddWithValue("@username", txtReplyUsername.Text);
                com.Parameters.AddWithValue("@msg", txtReplyMessage.Text);
                com.Parameters.AddWithValue("@datetime", DateTime.Now);

                int k = com.ExecuteNonQuery();
                if (k != 0)
                {
                    lblReplyStatus.Text = "New record added successfully!";
                    lblReplyStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                else
                {
                    lblReplyStatus.Text = "Unable to post the message.";
                    lblReplyStatus.ForeColor = System.Drawing.Color.Red;
                }
                conn.Close();
                txtReplyMessage.Text = "";
            }
        }

        protected void btnReplyClear_Click(object sender, EventArgs e)
        {
            txtReplyMessage.Text = "";
        }

        protected void btnBlogsPost_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                if (fiBlogsFileUpload.HasFile)
                {
                    String strPath = System.IO.Path.GetFileName(fiBlogsFileUpload.FileName);
                    fiBlogsFileUpload.SaveAs(Server.MapPath("~/FileUpload/Blogs/") + strPath);
                    SqlCommand com = new SqlCommand("INSERT INTO [Blogs](BlogsStudentID, BlogsUsername, BlogsTitle, BlogsDescription, BlogsFileUpload, BlogsDateTime) VALUES (@id, @username, @title, @desc, @fileupload, @datetime)", conn);
                    com.Parameters.AddWithValue("@id", txtBlogsStudentID.Text);
                    com.Parameters.AddWithValue("@username", txtBlogsUsername.Text);
                    com.Parameters.AddWithValue("@title", txtBlogsTitle.Text);
                    com.Parameters.AddWithValue("@desc", txtBlogsDesc.Text);
                    com.Parameters.AddWithValue("@fileupload", Path.GetFileName(fiBlogsFileUpload.PostedFile.FileName));
                    com.Parameters.AddWithValue("@datetime", DateTime.Now);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblBlogsStatus.Text = "New record added successfully!";
                        lblBlogsStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblBlogsStatus.Text = "Unable to post the blog.";
                        lblBlogsStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    SqlCommand com = new SqlCommand("INSERT INTO [Blogs](BlogsStudentID, BlogsUsername, BlogsTitle, BlogsDescription, BlogsDateTime) VALUES (@id, @username, @title, @desc, @datetime)", conn);
                    com.Parameters.AddWithValue("@id", txtBlogsStudentID.Text);
                    com.Parameters.AddWithValue("@username", txtBlogsUsername.Text);
                    com.Parameters.AddWithValue("@title", txtBlogsTitle.Text);
                    com.Parameters.AddWithValue("@desc", txtBlogsDesc.Text);
                    com.Parameters.AddWithValue("@datetime", DateTime.Now);

                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblBlogsStatus.Text = "New record added successfully!";
                        lblBlogsStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblBlogsStatus.Text = "Unable to post the blog.";
                        lblBlogsStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                conn.Close();
            }
            txtBlogsTitle.Text = "";
            txtBlogsDesc.Text = "";
        }

        protected void btnBlogsClear_Click(object sender, EventArgs e)
        {
            txtBlogsTitle.Text = "";
            txtBlogsDesc.Text = "";
        }
        private void BindGrid3()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT BlogsTitle, BlogsDescription, BlogsFileUpload, BlogsDateTime FROM [Blogs] WHERE BlogsStudentID = @studentid"))
                {
                    HttpCookie cookie = Request.Cookies["studentid"];
                    cmd.Parameters.AddWithValue("@studentid", cookie["studentid"]);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvBlog.DataSource = dt;
                            gvBlog.DataBind();
                        }
                    }
                }
            }
        }

        private void BindGrid4()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Photography"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ReplyUsername, ReplyMessage, ReplyDateTime FROM [Reply] WHERE ReplyStudentID = @studentid"))
                {
                    HttpCookie cookie = Request.Cookies["studentid"];
                    cmd.Parameters.AddWithValue("@studentid", cookie["studentid"]);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvReply.DataSource = dt;
                            gvReply.DataBind();
                        }
                    }
                }
            }
        }
    }
}