<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="A2_SalmaOsman.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 74%;
        height: 203px;
        margin-left: 87px;
    }
    .auto-style2 {
        width: 82px;
    }
    .auto-style3 {
        width: 240px;
    }
        .auto-style4 {
            width: 41%;
            height: 109px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<table class="auto-style1">
    <tr>
        <td class="auto-style2">
            <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="txtUsername" runat="server" Width="201px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="valUserName" runat="server" ControlToValidate="txtUsername" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="198px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" style="height: 26px" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">
            <asp:Label ID="lblLoginErr" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table border="1" class="auto-style4">
        <tr>
            <td>&nbsp;</td>
            <td>Username</td>
            <td>Password</td>
        </tr>
        <tr>
            <td>Admin Login</td>
            <td>admin</td>
            <td>admin</td>
        </tr>
        <tr>
            <td>User Login</td>
            <td>user</td>
            <td>user</td>
        </tr>
    </table>
<br />
&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>
