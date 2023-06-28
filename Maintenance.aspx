<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultAdmin.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="PRGGroupProject.Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
    <asp:Button ID="btnDefault" runat="server" Text="Add Best Photo of Week" CausesValidation="false" OnClick="btnDefault_Click" />
    <asp:Button ID="btnAnn" runat="server" Text="Add Announcements" CausesValidation="false" OnClick="btnAnn_Click" />
    <br />
            <div>
            <table id="bestphoto" runat="server" class="center">
                <tr>
                    <td colspan="3"><asp:Label ID="lblDefault" runat="server" Text="EDIT DEFAULT PAGE" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="lblValidation" runat="server" Text="* Required" Font-Size="10" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUpload" runat="server" Text="Upload Image: " Font-Size="15" />
                        <asp:Label ID="lblUpload1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:FileUpload ID="fiUpImage" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvUpload" runat="server" ControlToValidate="fiUpImage" ErrorMessage="You must upload an image." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPhotographer" runat="server" Text="Photographer: " Font-Size="15" />
                        <asp:Label ID="lblPhotographer1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPhotographer" Columns="40" Rows="1" runat="server" />
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvPhotographer" runat="server" ControlToValidate="txtPhotographer" ErrorMessage="You must enter the name of photographer." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDesc" runat="server" Text="Description: " Font-Size="15" />
                        <asp:Label ID="lblDesc1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtDesc" runat="server" Columns="32" Rows="5" TextMode="MultiLine" ></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDesc" ErrorMessage="You must provide the description." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="button" OnClick="btnUpload_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CausesValidation="false" CssClass="button" OnClick="btnClear_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblDefaultStatus" runat="server"/></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <br />
        <div>
            <table id="ann" runat="server" class="center">
                <tr>
                    <td colspan="3"><asp:Label ID="lblAnnouncement" runat="server" Text="CREATE ANNOUNCEMENT" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="lblValidation1" runat="server" Text="* Required" Font-Size="10" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAnnTitle" runat="server" Text="Announcement Title: " Font-Size="15" />
                        <asp:Label ID="lblAnnTitle1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtAnnTitle" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvAnnTitle" runat="server" ControlToValidate="txtAnnTitle" ErrorMessage="You must enter the annoucement title." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAnnDetails" runat="server" Text="Announcement Details: " Font-Size="15" />
                        <asp:Label ID="lblAnnDetails1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtAnnDetails" runat="server" Columns="38" Rows="5" TextMode="MultiLine" ></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvAnnDetails" runat="server" ControlToValidate="txtAnnDetails" ErrorMessage="You must enter the annoucement details." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAnnAttachedFile" runat="server" Text="Attached Image: " Font-Size="15" />
                        <%--<asp:Label ID="lblAnnAttachedFile1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />--%>
                    </td>
                    <td><asp:FileUpload ID="fiAnnAttachedFile" runat="server" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnAnnPost" runat="server" Text="Post" CssClass="button" OnClick="btnAnnPost_Click" />
                        <asp:Button ID="btnAnnClear" runat="server" Text="Clear" CausesValidation="false" CssClass="button" OnClick="btnAnnClear_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAnnStatus" runat="server"/></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
</asp:Content>
