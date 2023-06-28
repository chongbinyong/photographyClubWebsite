<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultAdmin.Master" AutoEventWireup="true" CodeBehind="EditEvents.aspx.cs" Inherits="PRGGroupProject.EditEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
    <div>
            <table class="center">
                <tr>
                    <td colspan="3"><asp:Label ID="lblSearchEvent" runat="server" Text="EVENTS & ACTIVITES" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSearch" runat="server" Text="Event ID:" Font-Size="15"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="txtSearch" runat="server" /></td>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" CssClass="button" OnClick="btnSearch_Click" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblResult" runat="server" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table class="center">
                <tr>
                    <td colspan="3"><asp:Label ID="lblEvent" runat="server" Text="NEW EVENT / NEW ACTIVITY" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="lblValidation3" runat="server" Text="* Required" Font-Size="10" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEventID2" runat="server" Text="Event ID: " Font-Size="15" />
                        <asp:Label ID="lblEventID1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtEventID" runat="server" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="txtEventID" ErrorMessage="You must give the event ID." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEventName2" runat="server" Text="Event Name: " Font-Size="15" />
                        <asp:Label ID="lblEventName1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtEventName" runat="server" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEventName" runat="server" ControlToValidate="txtEventName" ErrorMessage="You must enter the event name." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEventDesc2" runat="server" Text="Event Description: " Font-Size="15" />
                        <asp:Label ID="lblEventDesc1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtEventDesc" runat="server" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEventDesc" runat="server" ControlToValidate="txtEventDesc" ErrorMessage="You must provide the event description." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEventImage" runat="server" Text="Event Image: " Font-Size="15" />
                        <%--<asp:Label ID="Label2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />--%>
                    </td>
                    <td><asp:FileUpload ID="fiEventImage" runat="server" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnEventAdd" runat="server" Text="Add" CssClass="button" OnClick="btnEventAdd_Click" />
                        <asp:Button ID="btnEventUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnEventUpdate_Click" />
                        <asp:Button ID="btnEventDelete" runat="server" Text="Delete" CssClass="button" OnClick="btnEventDelete_Click" />
                        <asp:Button ID="btnEventClear" runat="server" Text="Clear" CssClass="button" CausesValidation="false" OnClick="btnEventClear_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblEventStatus" runat="server" /></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
            </table>  
        </div>
        <br />
        <div>

            <table id="result" runat="server" class="center">
                <tr>
                    <td colspan="2"><asp:Label ID="lblUpdateEvent" runat="server" Text="EDIT EVENT / ACTIVITY" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td class="auto-style5"><asp:Label ID="lblEventID0" runat="server" Text="Event ID: " Font-Size="15" /></td>
                    <td class="auto-style5"><asp:Label ID="lblEventID" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblEventName0" runat="server" Text="Event Name: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblEventName" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblEventDesc0" runat="server" Text="Event Description: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblEventDesc" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Image ID="imgEventImage" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnEventEdit" runat="server" Text="Edit" CssClass="button" OnClick="btnEventEdit_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table class="center">
                <tr>
                    <td colspan="2"><asp:Label ID="lblProposedEvent" runat="server" Text="PROPOSED EVENTS" Font-Size="20" Font-Bold="true" /></td>
                </tr>
            </table>
            <asp:GridView ID="gvPropEvents" runat="server" AutoGenerateColumns="False" CssClass="center">
                <Columns>
                    <asp:BoundField DataField="PropEventTitle" HeaderText="Event Title">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PropEventDescription" HeaderText="Event Description">
                    <ItemStyle Width="500px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
