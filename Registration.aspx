<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PRGGroupProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <link href="Style/MyStyle.css" rel="stylesheet" />
 <link href="MyStyle.css" rel="stylesheet" />
 <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Registration</h2> 
    <table class="auto-style1">
        <tr>
            <td>
                Student ID</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtStudentID" runat="server" Height="20px" Width="190px" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                   ID="rfvStudentID" 
                   runat="server" ControlToValidate="txtStudentID"
                   ErrorMessage="Please enter valid StudentID: I########."
                   ValidationExpression="[\+?I?i]*[0-9]{8}"
                   ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td>
                Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtName" runat="server" Height="20px" Width="190px" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="rfvName" 
                    runat="server" ControlToValidate="txtName"
                    ErrorMessage="You must give a name."
                    ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Gender" runat="server" />
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlGender" runat="server" Height="20px" Width="190px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="rfvGender" 
                    runat="server" ControlToValidate="ddlGender"
                    ErrorMessage="You must select gender."
                    ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td>
                Date of Birth</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtBirth" runat="server" textmode="Date" Height="20px" Width="190px" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                   ID="rfvBirth" 
                   runat="server" ControlToValidate="txtBirth"
                   ErrorMessage="You must choose a date."
                   ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Major" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="ddlMajor" runat="server" Height="20px" Width="190px">
                    <asp:ListItem>BITI</asp:ListItem>
                    <asp:ListItem>BCSI</asp:ListItem>
                    <asp:ListItem>BAF</asp:ListItem>
                    <asp:ListItem>BBUS</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="rfvMajor" 
                    runat="server" ControlToValidate="ddlMajor"
                    ErrorMessage="You must select a major."
                    ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtEmail" runat="server" Height="20px" Width="190px" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                   ID="rfvEmail" 
                   runat="server" ControlToValidate="txtEmail"
                   ErrorMessage="You must enter an email."
                   ForeColor="Red" Display="Dynamic"/>
                <asp:RegularExpressionValidator
                   ID="revEmail"
                   runat="server"
                   ControlToValidate="txtEmail"
                   ErrorMessage="Please enter valid email: xxx@yyy.zzz"
                   ValidationExpression="\S+\@+\S+\.\S+"
                   ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Contact" runat="server" />
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtContact" runat="server" Height="20px" Width="190px" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                   ID="rfvContact" 
                   runat="server" ControlToValidate="txtContact"
                   ErrorMessage="You must enter contact number."
                   ForeColor="Red" Display="Dynamic"/>

                <asp:RegularExpressionValidator
                    ID="revContact" 
                    runat="server"
                    ControlToValidate="txtContact"
                    ErrorMessage="Please enter valid phone number: ###-#######."
                    ValidationExpression="(\+?6?01)[0-46-9]-*[0-9]{7,8}"
                    ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Username" runat="server" />
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtUsername" runat="server" Height="20px" Width="190px" />
                <asp:Label Text="*" runat="server" ForeColor="Red" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="rfvUserName" 
                    runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="You must give a name."
                    ForeColor="Red"/>
           </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Password" runat="server" />
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="20px" Width="190px" />
                 <asp:Label Text="*" runat="server" ForeColor="Red" />
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="rfvPassword" 
                    runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Please enter a password."
                    ForeColor="Red" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Confirm Password" runat="server" />
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Height="20px" Width="190px" />
            </td>
            <td>
                        <asp:RequiredFieldValidator
                            ID="rfvConfirmPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Please enter password again"
                            ForeColor="red" Display="Dynamic"/>
                        <asp:CompareValidator ID="comvConfirmPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            Operator="Equal"
                            ErrorMessage="Does not match with password"
                            ForeColor="Red" Display="Dynamic"/>
                    </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:Button Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="button" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label Text="" ID="lblStatus" runat="server"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="~/Logout.aspx">Login</asp:HyperLink>
            </td>
        </tr>

    </table>
    </div>
    </form>
</body>
</html>


