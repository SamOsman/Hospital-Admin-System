<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="EditPatient.aspx.cs" Inherits="A2_SalmaOsman.AdminHome.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 343px;
        }
        .auto-style7 {
            width: 72px;
        }
        .auto-style8 {
            width: 122px;
        }
        .auto-style9 {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:HyperLink ID="hplGoToAddPatient" runat="server" NavigateUrl="~/AdminHome/NewPatient.aspx">Back to Add Patient Page</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <table class="auto-style5">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtID" runat="server" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valID" runat="server" ControlToValidate="txtID" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style8" rowspan="8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="216px" Width="413px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:BoundField DataField="OHIP" HeaderText="OHIP" SortExpression="OHIP" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalAdminConnectionString %>" SelectCommand="SELECT * FROM [patients]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Get Records" Width="93px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="First name"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtFirst" runat="server" Width="167px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valFirst" runat="server" ControlToValidate="txtFirst" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" Text="Last name"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtLast" runat="server" Width="164px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valLast" runat="server" ControlToValidate="txtLast" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label5" runat="server" Text="Age"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtUserAge" runat="server" Width="164px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valUserAge" runat="server" ControlToValidate="txtUserAge" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label6" runat="server" Text="Ohip"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtOhip" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valOhip" runat="server" ControlToValidate="txtOhip" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" Width="88px" />
&nbsp;
                <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" Width="79px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
