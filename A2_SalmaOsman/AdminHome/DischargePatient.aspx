<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome/AdminHeader.Master" AutoEventWireup="true" CodeBehind="DischargePatient.aspx.cs" Inherits="A2_SalmaOsman.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="lblHeader" runat="server" Text="Please select the patient you would like to discharge"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridViewVisits" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dataDischargePatient" Height="149px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="814px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Visit Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="visit_start" HeaderText="visit_start" SortExpression="visit_start" />
                <asp:BoundField DataField="visit_end" HeaderText="visit_end" SortExpression="visit_end" />
                <asp:BoundField DataField="patient_id" HeaderText="patient_id" SortExpression="patient_id" />
                <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dataDischargePatient" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalAdminConnectionString %>" SelectCommand="SELECT [reason], [visit_end], [visit_start], [Id], [patient_id] FROM [visits]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
