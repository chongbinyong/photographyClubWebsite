<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PRGGroupProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet" />
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 350px;
        }
        .auto-style3 {
            width: 110px;
        }
        .auto-style5 {
            width: 283px;
        }
        .auto-style6 {
            width: 260px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="center">
                <tr>
                    <td colspan="3">
                        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/banner.jpg" Height="345px" Width="700px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center; font-size: x-large; font-weight: bold; font-family: fantasy;">

                        Login</td>
                </tr>
                <tr>
                    <td class="auto-style5">

                    </td>
                    <td class="auto-style1" colspan="2">

                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" style="font-family: fantasy; font-size: smaller; font-weight: bolder; text-align:right">

                        Student ID:</td>
                    <td class="auto-style3">

                        <asp:TextBox ID="txtStudentID" runat="server" Width="160px"></asp:TextBox>

                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtStudentID"
                            ErrorMessage="Please enter your Student ID." ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" style="font-family: fantasy; font-size: smaller; font-weight: bolder; text-align:right">

                        Password:

                    </td>
                    <td class="auto-style3">

                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="160px"></asp:TextBox>

                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd"
                            ErrorMessage="Please enter your Password." ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">

                    </td>
                    <td class="auto-style1" colspan="2">

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">

                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                    </td>
                </tr>
                <%--<tr>
                    <td colspan="3" style="text-align:center">

                        <asp:Label ID="lblMsg" runat="server" Text=" " />

                    </td>
                </tr>--%>
                <tr>
                    <td colspan="3" style="text-align:center">

                        <asp:Button ID="btnLogin" runat="server" Text="Login"
                            Font-Bold="True"
                            Font-Names="Franklin Gothic Medium" Width="100px"
                            CssClass="button" OnClick="btnLogin_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                        Need an account? 
                        <asp:Hyperlink ID="lblRegister" runat="server" Text="Sign Up"
                            Font-Names="Berlin Sans FB" Font-Underline="True"
                            ForeColor="#0066FF"
                            NavigateUrl="~/Registration.aspx" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

