<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMember.Master" AutoEventWireup="true" CodeBehind="DefaultMember.aspx.cs" Inherits="PRGGroupProject.DefaultMember1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:Photography %>" SelectCommand="SELECT * FROM [Announcements]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlBestPhoto" runat="server" ConnectionString="<%$ ConnectionStrings:Photography %>" SelectCommand="SELECT * FROM [BestPhoto]"></asp:SqlDataSource>
    <br />
    <h1>Announcement</h1>
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <asp:GridView ID="gvAnnouncements" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="AnnTitle" HeaderText="Announcement Title"></asp:BoundField>
            <asp:BoundField DataField="AnnDetails" HeaderText="Announcement Details"></asp:BoundField>
            <asp:TemplateField HeaderText="Attached Image">
                <ItemTemplate>
                    <asp:Image ID="imgAttachedImage" runat="server" ImageUrl='<%# "~/FileUpload/Announcements/" + Eval("AnnAttachedFile","{0}") %>' height="200" width="200"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblAnnouncements" runat="server" />
    <br />
    <h1>Best Photo Of Week</h1>
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <asp:GridView ID="gvBestPhoto" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Best Photo of Week">
                <ItemTemplate>
                    <asp:Image ID="imgBestPhoto" runat="server" ImageUrl='<%# "~/FileUpload/BestPhoto/" + Eval("BestImage","{0}") %>' height="200" width="200"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BestImagePhotographer" HeaderText="Photographer"></asp:BoundField>
            <asp:BoundField DataField="BestImageDescription" HeaderText="Description"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblBestPhoto" runat="server" />
</asp:Content>
