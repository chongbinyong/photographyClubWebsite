<%@ Page Language="C#" MasterPageFile="~/DefaultMember.Master" AutoEventWireup="true" CodeBehind="Support.aspx.cs" Inherits="PRGGroupProject.Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 25%;
        }
        .auto-style6 {
            width: 70%;
        }
        .auto-style7 {
            margin-left: auto;
            margin-right: auto;
            width: 950px;
        }
        .auto-style8 {
            height: 38px;
        }
        .auto-style9 {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
        <div>
            <table class="auto-style7">
                <tr>
                    <td colspan="3"><asp:Label ID="lblAsk" runat="server" Text="ASK YOUR QUESTION" Font-Size="20" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="lblAsk1" runat="server" Text="We would love to hear from you!" Font-Size="12" /></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label ID="lblValidation" runat="server" Text="* Required" Font-Size="10" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="NAME: " Font-Size="15" />
                        <asp:Label ID="lblName1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtName" Columns="40" Rows="1" runat="server" />
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="You must enter your name." ForeColor="Red" Display="Dynamic"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblINTIStudentID" runat="server" Text="STUDENT ID: " Font-Size="15" />
                        <asp:Label ID="lblINTIStudentID1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtINTIStudentID" Columns="40" Rows="1" runat="server" />
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvINTIStudentID" runat="server" ControlToValidate="txtINTIStudentID" ErrorMessage="You must enter your student ID." ForeColor="Red" Display="Dynamic"/>
                        <asp:RequiredFieldValidator 
                            ID="rfvStudentID" 
                            runat="server" ControlToValidate="txtINTIStudentID"
                            ErrorMessage="Please enter valid StudentID: I########."
                            ValidationExpression="[\+?I?i]*[0-9]{8}"
                            ForeColor="Red" Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPsnEmail" runat="server" Text="EMAIL: " Font-Size="15" />
                        <asp:Label ID="lblPsnEmail1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPsnEmail" Columns="40" Rows="1" runat="server" />
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfcPsnEmail" runat="server" ControlToValidate="txtPsnEmail" ErrorMessage="You must enter your email." ForeColor="Red" Display="Dynamic"/>
                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtPsnEmail"
                            ErrorMessage="Please enter valid email: xxx@yyy.zzz"
                            ValidationExpression="\S+\@+\S+\.\S+"
                            ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQuestion" runat="server" Text="QUESTION: " Font-Size="15" />
                        <asp:Label ID="lblQuestion1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtQuestion" runat="server" Columns="38" Rows="5" TextMode="MultiLine" />
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvQuestion" runat="server" ControlToValidate="txtQuestion" ErrorMessage="You must give a question." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblImage" runat="server" Text="IMAGE (if any): " Font-Size="15" />
                    </td>
                    <td class="auto-style6"><asp:FileUpload ID="fiQnImage" runat="server" /></td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right">
                        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" CssClass="button" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" CssClass="button" />
                    </td>
                    <td style="text-align:right">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style2">
                        <asp:Label ID="lblResult" runat="server"/>
                    </td>
                    <td class="auto-style2">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>

