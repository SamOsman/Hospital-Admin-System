<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="NewDoctor.aspx.cs" Inherits="A2_SalmaOsman.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 207px;
        }
        .auto-style6 {
            margin-top: 0px;
        }
        .auto-style7 {
            width: 98px;
        }
        .auto-style8 {
            width: 214px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="Label5" runat="server" Text="Enter new doctor record"></asp:Label>
    <br />
    <br />
    <asp:HyperLink ID="hplGoToEdit" runat="server" NavigateUrl="~/AdminHome/EditDoctor.aspx">Edit/Delete Records</asp:HyperLink>
    <br />
    <br />
    <table class="auto-style5">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label2" runat="server" Text="First name"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtFrstN" runat="server" Width="179px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFrstN" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFrstN" ErrorMessage="Letters only" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="Last name"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtLastN" runat="server" Width="178px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastN" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastN" ErrorMessage="Letters only" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" Text="Speciality"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtSpeciality" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSpeciality" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="btnAdd" runat="server" CssClass="auto-style6" OnClick="btnAdd_Click" Text="Add" Width="58px" />
&nbsp; </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
