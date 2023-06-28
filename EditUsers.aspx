<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMember.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="PRGGroupProject.EditUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 25%;
        }
        .auto-style8 {
            height: 38px;
        }
        .auto-style9 {
            height: 39px;
        }
        .auto-style10 {
            width: 25%;
            height: 38px;
        }
        .auto-style11 {
            width: 100%;
            height: 38px;
        }
        .auto-style12 {
            width: 200px;
        }
        .auto-style13 {
            height: 38px;
            width: 200px;
        }
        .auto-style14 {
            height: 39px;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/MyStyle.css" rel="stylesheet" />
    <link href="MyStyle.css" rel="stylesheet" />
        <div>
            <table class="center">
                <tr>
                    <td colspan="2"><asp:Label ID="lblUpdate" runat="server" Text="EDIT USER PROFILE" Font-Size="20" Font-Bold="true" />
                <tr>
                    <td colspan="2"><asp:Label ID="lblValidation1" runat="server" Text="* Required" Font-Size="10" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td class="auto-style10"><asp:Label ID="lblStudentID0" runat="server" Text="Student ID: " Font-Size="15" /></td>
                    <td class="auto-style11"><asp:Label ID="lblStudentID" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style9"><asp:Label ID="lblName0" runat="server" Text="Name: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblName" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style9"><asp:Label ID="lblGender0" runat="server" Text="Gender: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblGender" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style9"><asp:Label ID="lblDOB0" runat="server" Text="Date of Birth: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblDOB" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style9"><asp:Label ID="lblMajor0" runat="server" Text="Major: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblMajor" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style5"><asp:Label ID="lblEmail0" runat="server" Text="Email: " Font-Size="15" /></td>
                    <td class="auto-style1"><asp:Label ID="lblEmail" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style9"><asp:Label ID="lblContact0" runat="server" Text="Contact No.: " Font-Size="15" /></td>
                    <td><asp:Label ID="lblContact" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style5"><asp:Label ID="lblUsername0" runat="server" Text="Username: " Font-Size="15" /></td>
                    <td class="auto-style1"><asp:Label ID="lblUsername" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style5"><asp:Label ID="lblPassword0" runat="server" Text="Password: " Font-Size="15" /></td>
                    <td class="auto-style1"><asp:Label ID="lblPassword" runat="server" Font-Size="15" /></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td style="text-align:right" class="auto-style1">
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CausesValidation="false" CssClass="button" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table class="center">
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblStudentID2" runat="server" Text="Student ID: " Font-Size="15" />
                        <asp:Label ID="lblStudentID1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" /></td>
                    <td><asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvStudentID0" runat="server" ControlToValidate="txtStudentID" ErrorMessage="Please enter valid StudentID: I########."
                            ValidationExpression="[\+?I?i]*[0-9]{8}" ForeColor="Red" Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblName1" runat="server" Text="Name: " Font-Size="15" />
                        <asp:Label ID="lblName2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="You must enter your name." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblGender1" runat="server" Text="Gender: " Font-Size="15" />
                        <asp:Label ID="lblGender2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:DropDownList ID="ddlGender" runat="server" Height="20px" Width="190px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList></td>
                    <td><asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" ErrorMessage="You must enter your gender." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblDOB1" runat="server" Text="Date of Birth: " Font-Size="15" />
                        <asp:Label ID="lblDOB2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="You must enter your date of birth." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblMajor1" runat="server" Text="Major: " Font-Size="15" />
                        <asp:Label ID="lblMajor2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="ddlMajor" runat="server" Height="20px" Width="190px">
                        <asp:ListItem>BITI</asp:ListItem>
                        <asp:ListItem>BCSI</asp:ListItem>
                        <asp:ListItem>BAF</asp:ListItem>
                        <asp:ListItem>BBUS</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="auto-style8"><asp:RequiredFieldValidator ID="rfvMajor" runat="server" ControlToValidate="ddlMajor" ErrorMessage="You must enter your major." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="lblEmail2" runat="server" Text="Email: " Font-Size="15" />
                        <asp:Label ID="lblEmail1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style9"><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfcPsnEmail0" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter your email." ForeColor="Red" display="Dynamic"/>
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
                    <td class="auto-style13">
                        <asp:Label ID="lblContact1" runat="server" Text="Contact No.: " Font-Size="15" />
                        <%--<asp:Label ID="lblContact2" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />--%>
                    </td>
                    <td><asp:TextBox ID="txtContact" runat="server"></asp:TextBox></td>
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
                    <td class="auto-style13">
                        <asp:Label ID="lblUsername2" runat="server" Text="Username: " Font-Size="15" />
                        <asp:Label ID="lblUsername1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td class="auto-style8"><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvName0" runat="server" ControlToValidate="txtUsername" ErrorMessage="You must give an username." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblPassword2" runat="server" Text="Password: " Font-Size="15" />
                        <asp:Label ID="lblPassword1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="You must choose a password." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password: " Font-Size="15" />
                        <asp:Label ID="lblConfirmPassword1" runat="server" Text=" *" Font-Size="10" ForeColor="Red" />
                    </td>
                    <td><asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="You must reenter password." ForeColor="Red" />
                        <asp:CompareValidator ID="comvConfirm" runat="server" ControlToValidate="txtConfirmPassword" Operator="Equal" Type="String" ControlToCompare="txtPassword" ErrorMessage="Does not match with password." ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td style="text-align:right">
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" Visible="false" CssClass="button" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" CausesValidation="false" CssClass="button" />
                    </td>
                    <td style="text-align:right">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12"><asp:Label ID="lblUserStatus" runat="server"/></td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
