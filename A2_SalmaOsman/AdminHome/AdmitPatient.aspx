<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="AdmitPatient.aspx.cs" Inherits="A2_SalmaOsman.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            width: 456px;
        }
        .auto-style7 {
            margin-top: 0px;
        }
        .auto-style8 {
            width: 208px;
        }
        .auto-style9 {
            width: 100%;
            height: 83px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    &nbsp;
        &nbsp;<table class="auto-style9">
            <tr>
                <td>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Text="Before admitting a patinet, enter a doctor ID:" Font-Size="Large"></asp:Label>
    &nbsp;<asp:TextBox ID="txtDoctorId" runat="server" Width="180px"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="regexDoctorId" runat="server" ControlToValidate="txtDoctorId" ErrorMessage="Numbers only" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </p>
    <table class="auto-style5">
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Press select on the patient you want admitted"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="List of available Doctors"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:GridView ID="GridViewPatientData" runat="server" AutoGenerateColumns="False" CssClass="auto-style7" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="148px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="407px" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                    </Columns>
                </asp:GridView>
            </td>
            <td class="auto-style8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Width="180px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="specialty" HeaderText="specialty" SortExpression="specialty" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalAdminConnectionString %>" SelectCommand="SELECT [Id], [firstname], [lastname], [specialty] FROM [doctors]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalAdminConnectionString %>" SelectCommand="SELECT [Id], [firstname], [lastname] FROM [patients]"></asp:SqlDataSource>
    <br />
    <br />
    <p>
        &nbsp;</p>
    
</asp:Content>
