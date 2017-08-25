<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="A2_SalmaOsman.UserHome.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblHeader" runat="server" Text="You are logged in as " Font-Size="Large" ForeColor="#006699"></asp:Label>
        <br />
        <asp:Label ID="lblStatus" runat="server" Text="Status: " Font-Size="Large" ForeColor="#006699"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="linkToSearchPatinets" runat="server" NavigateUrl="~/SharedForm/ViewSearchPatients.aspx">Search patient records</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="linkToVisitRecords" runat="server" NavigateUrl="~/SharedForm/ViewSearchVisits.aspx">Search Visit Records</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="linkLogout" runat="server" NavigateUrl="~/Login.aspx">Logout</asp:HyperLink>
    
        <br />
        <br />
        <br />
        <asp:Label ID="lblTitle" runat="server" Font-Size="Large" ForeColor="#006699" Text="This is the User Home page"></asp:Label>
    
    </div>
    </form>
</body>
</html>
