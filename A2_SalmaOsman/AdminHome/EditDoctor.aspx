<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="EditDoctor.aspx.cs" Inherits="A2_SalmaOsman.AdminHome.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 98%;
            height: 273px;
        }
        .auto-style6 {
            width: 90px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
        .auto-style8 {
            width: 396px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Update/Delete Doctor Records"></asp:Label>
    <br />
    <br />
    <asp:HyperLink ID="hplGoToAddPage" runat="server" NavigateUrl="~/AdminHome/NewDoctor.aspx">Back to Add Records</asp:HyperLink>
    <br />
    <br />
    <table class="auto-style5">
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtID" runat="server" CssClass="auto-style7" Width="187px"></asp:TextBox>
&nbsp;
                <asp:RequiredFieldValidator ID="valID" runat="server" ErrorMessage="Required Field" ControlToValidate="txtID" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;
                <asp:RegularExpressionValidator ID="regExID" runat="server" ControlToValidate="txtID" ErrorMessage="Numbers Only" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td rowspan="7">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="164px" Width="287px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="specialty" HeaderText="specialty" SortExpression="specialty" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalAdminConnectionString %>" SelectCommand="SELECT * FROM [doctors]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="btnGetRecord" runat="server" Text="Get Record" Width="96px" OnClick="btnGetRecord_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label3" runat="server" Text="First name"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtFirst" runat="server" Width="189px"></asp:TextBox>
&nbsp;
                <asp:RequiredFieldValidator ID="valFirstN" runat="server" ErrorMessage="Required Field" ControlToValidate="txtFirst" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label4" runat="server" Text="Last name"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtLastname" runat="server" Width="190px"></asp:TextBox>
&nbsp;
                <asp:RequiredFieldValidator ID="valLastN" runat="server" ErrorMessage="Required Field" ControlToValidate="txtLastname" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label5" runat="server" Text="Specialty"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtSpecialty" runat="server"  Width="191px"></asp:TextBox>
&nbsp;
                <asp:RequiredFieldValidator ID="valSpec" runat="server" ErrorMessage="Required Field" ControlToValidate="txtSpecialty" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                &nbsp;</td>
            <td class="auto-style8">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="85px" OnClick="btnUpdate_Click" />
&nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="84px" OnClick="btnDelete_Click" />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
