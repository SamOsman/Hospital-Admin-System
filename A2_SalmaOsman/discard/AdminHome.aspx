<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedIn_Header_Menu.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="A2_SalmaOsman.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <p>
        <asp:Label ID="lblStatus" runat="server" Text="Status: "></asp:Label>
        Admin</p>
<asp:Menu ID="Menu2" runat="server">
    <Items>
        <asp:MenuItem NavigateUrl="~/NewPatient.aspx" Text="Add Patient" Value="Add Patient"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/NewDoctor.aspx" Text="Add Doctor" Value="Add Doctor"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/AdmitPatient.aspx" Text="Admit Patient" Value="Admit Patient"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/DischargePatient.aspx" Text="Discharge Patient" Value="Discharge Patient"></asp:MenuItem>
    </Items>
</asp:Menu>
<p>
        &nbsp;</p>

</asp:Content>
