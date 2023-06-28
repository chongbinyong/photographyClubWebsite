<%@ Page Language="C#" MasterPageFile="~/DefaultMember.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="PRGGroupProject.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
    <div>
        <asp:SqlDataSource ID="SqlEvents" runat="server" ConnectionString="<%$ ConnectionStrings:Photography %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
        <h1 style="text-align:left">Events</h1>
        <asp:GridView ID="gvEvent" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="Event ID"></asp:BoundField>
                <asp:BoundField DataField="EventName" HeaderText="Event Name"></asp:BoundField>
                <asp:BoundField DataField="EventDescription" HeaderText="Event Description"></asp:BoundField>
                <asp:TemplateField HeaderText="Event Image">
                <ItemTemplate>
                    <asp:Image ID="imgEventImage" runat="server" ImageUrl='<%# "~/FileUpload/Events/" + Eval("EventImage","{0}") %>' height="200" width="200"/>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblEvents" runat="server" />
    </div>
    <br />
    <div>
        
        <table>
            <tr>
                <td colspan="2"><asp:Label ID="lblProposedEvents" runat="server" Text="PROPOSED EVENTS" Font-Size="20" Font-Bold="true" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPropEventTitle" runat="server" Text="Proposed Event Title: " Font-Size="15" />
                    <asp:Label ID="lblPropEventTitle0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" /></td>
                <td><asp:TextBox ID="txtPropEventTitle" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPropEventTitle" runat="server" ControlToValidate="txtPropEventTitle" ErrorMessage="You must give a title." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPropEventDesc" runat="server" Text="Proposed Event Description: " Font-Size="15" />
                    <asp:Label ID="lblPropEventDesc0" runat="server" Text=" *" Font-Size="10" ForeColor="Red" /></td>
                <td><asp:TextBox ID="txtPropEventDesc" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPropEventDesc" runat="server" ControlToValidate="txtPropEventDesc" ErrorMessage="You must provide event description." ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnPropEventAdd" runat="server" Text="Add" CssClass="button" OnClick="btnPropEventAdd_Click" />
                    <asp:Button ID="btnPropEventClear" runat="server" Text="Clear" CssClass="button" CausesValidation="false" OnClick="btnPropEventClear_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPropEventStatus" runat="server"/></td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
    </div>
</asp:Content>

