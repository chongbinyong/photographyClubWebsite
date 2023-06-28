<%@ Page Language="C#" MasterPageFile="~/DefaultMember.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="PRGGroupProject.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
    <div>
        <asp:Button ID="btnBlog" runat="server" CausesValidation="false" Text="Your Blog" CssClass="button" OnClick="btnBlog_Click" />
        <asp:Button ID="btnOtherBlogs" runat="server" CausesValidation="false" Text="Other Blogs" CssClass="button" OnClick="btnOtherBlogs_Click" />
    </div>
    <div id="YourBlog" runat="server" visible="false" style="text-align: left">
        <h1>Blog</h1>
        <asp:GridView ID="gvBlog" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="BlogsTitle" HeaderText="Blog Title"></asp:BoundField>
                <asp:BoundField DataField="BlogsDescription" HeaderText="Blog Description"></asp:BoundField>
                <asp:TemplateField HeaderText="Blog Image">
                    <ItemTemplate>
                        <asp:Image ID="blogImg" runat="server" ImageUrl='<%# "~/FileUpload/Blogs/" + Eval("BlogsFileUpload","{0}") %>' height="200" width="200"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BlogsDateTime" HeaderText="Posted Date & Time"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblBlog" runat="server" />
        <br />
        <h1>Reply</h1>
        <asp:GridView ID="gvReply" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ReplyUsername" HeaderText="Username"></asp:BoundField>
                <asp:BoundField DataField="ReplyMessage" HeaderText="Message"></asp:BoundField>
                <asp:BoundField DataField="ReplyDateTime" HeaderText="Posted Date & Time"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblReply" runat="server" />
        <br />
        <h1>Add Blog</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblBlogsStudentID" runat="server" Text="Student ID: " Font-Size="15" />
                    <asp:Label ID="lblBlogsStudentID0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtBlogsStudentID" runat="server" Enabled="false" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfcBlogsStudentID" runat="server" ControlToValidate="txtBlogsStudentID" ErrorMessage="You must enter your student ID." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBlogsUsername" runat="server" Text="Username: " Font-Size="15" />
                    <asp:Label ID="lblBlogsUsername0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtBlogsUsername" runat="server" Enabled="false" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvBlogsUsername" runat="server" ControlToValidate="txtBlogsUsername" ErrorMessage="You must enter your username." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBlogsTitle" runat="server" Text="Title: " Font-Size="15" />
                    <asp:Label ID="lblBlogsTitle0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtBlogsTitle" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvBlogsTitle" runat="server" ControlToValidate="txtBlogsTitle" ErrorMessage="You must give a title." ForeColor="Red" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBlogsDesc" runat="server" Text="Description: " Font-Size="15" />
                    <%--<asp:Label ID="lblBlogsDesc0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />--%>
                </td>
                <td>
                    <asp:TextBox ID="txtBlogsDesc" runat="server" Columns="38" Rows="5" TextMode="MultiLine" ></asp:TextBox></td>
                <td>
                    <%--<asp:RequiredFieldValidator ID="rfvBlogsDesc" runat="server" ControlToValidate="txtBlogsDesc" ErrorMessage="You must provide the description." ForeColor="Red" />--%></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblBlogsFileUpload" runat="server" Text="File Upload: " Font-Size="15" /></td>
                <td><asp:FileUpload ID="fiBlogsFileUpload" runat="server" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnBlogsPost" runat="server" Text="Post" CssClass="button" OnClick="btnBlogsPost_Click" />
                    <asp:Button ID="btnBlogsClear" runat="server" Text="Clear" CausesValidation="false" CssClass="button" OnClick="btnBlogsClear_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><asp:Label ID="lblBlogsStatus" runat="server" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="OtherBlogs" runat="server" visible="false" style="text-align: left">
        <h1>Other Blogs</h1>
        <asp:SqlDataSource ID="SqlDSOtherBlogs" runat="server" ConnectionString="<%$ ConnectionStrings:Photography %>" SelectCommand="SELECT [BlogsStudentID], [BlogsUsername] FROM [Blogs]"></asp:SqlDataSource>
        <asp:Label ID="lblOtherBlogs" runat="server" Text="Choose a person: " />
        <asp:DropDownList ID="ddlOtherBlogs" runat="server" DataTextField="BlogsUsername" DataValueField="BlogsStudentID" CausesValidation="false" AutoPostBack="True" OnSelectedIndexChanged="ddlOtherBlogs_SelectedIndexChanged"></asp:DropDownList>
        <br />
        <asp:GridView ID="gvOtherBlogs" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="BlogsTitle" HeaderText="Blog Title"></asp:BoundField>
                <asp:BoundField DataField="BlogsDescription" HeaderText="Blog Description"></asp:BoundField>
                <asp:TemplateField HeaderText="Blog Image">
                    <ItemTemplate>
                        <asp:Image ID="blogImg" runat="server" ImageUrl='<%# "~/FileUpload/Blogs/" + Eval("BlogsFileUpload","{0}") %>' height="200" width="200"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BlogsDateTime" HeaderText="Posted Date & Time"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="gvOtherReply" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ReplyUsername" HeaderText="Username"></asp:BoundField>
                <asp:BoundField DataField="ReplyMessage" HeaderText="Message"></asp:BoundField>
                <asp:BoundField DataField="ReplyDateTime" HeaderText="Posted Date & Time"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <h1>Add Reply</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblReplyUsername" runat="server" Text="Username: " Font-Size="15" />
                    <asp:Label ID="lblReplyUsername0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtReplyUsername" runat="server" Enabled="false" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvReplyUsername" runat="server" ControlToValidate="txtReplyUsername" ErrorMessage="You must enter your username." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReplyMessage" runat="server" Text="Message: " Font-Size="15" />
                    <asp:Label ID="lblReplyMessage0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtReplyMessage" runat="server" Columns="38" Rows="5" TextMode="MultiLine" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvReplyMessage" runat="server" ControlToValidate="txtReplyMessage" ErrorMessage="You must give a message." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnReplyPost" runat="server" Text="Post" CssClass="button" OnClick="btnReplyPost_Click" />
                    <asp:Button ID="btnReplyClear" runat="server" Text="Clear" CausesValidation="false" CssClass="button" OnClick="btnReplyClear_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReplyStatus" runat="server" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
