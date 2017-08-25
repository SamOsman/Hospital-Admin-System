<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="NewPatient.aspx.cs" Inherits="A2_SalmaOsman.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 275px;
        }
        .auto-style6 {
            width: 189px;
        }
        .auto-style7 {
            width: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="lblHeader" runat="server" Text="Add new Patient"></asp:Label>
    </p>
    <p>
        <asp:HyperLink ID="hplGoToEditPatient" runat="server" NavigateUrl="~/AdminHome/EditPatient.aspx">Edit/Delete Patient Records</asp:HyperLink>
    </p>
    <table class="auto-style5">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label1" runat="server" Text="First name"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtFirstName" runat="server" Width="171px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="valFirst" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label2" runat="server" Text="Last name"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtLastname" runat="server" Width="168px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="valLast" runat="server" ControlToValidate="txtLastname" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="Age"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtAge" runat="server" Width="167px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="valAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="regExAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Numbers Only" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" Text="OHIP Number"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtOHIP" runat="server" Width="166px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="valOhip" runat="server" ControlToValidate="txtOHIP" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RegularExpressionValidator ID="regExOhip" runat="server" ControlToValidate="txtOHIP" ErrorMessage="Numbers only" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Patient" Width="113px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
</asp:Content>
