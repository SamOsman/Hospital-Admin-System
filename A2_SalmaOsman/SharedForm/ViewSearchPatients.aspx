<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSearchPatients.aspx.cs" Inherits="A2_SalmaOsman.SharedForm.SearchPatients" %>
<%@ Import Namespace="A2_SalmaOsman" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 340px;
        }
        .auto-style3 {
            height: 505px;
        }
        .auto-style4 {
            width: 537px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style3">
        
        <asp:Label ID="lblHeader" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
        <br />
        
&nbsp;&nbsp;&nbsp;<asp:Button ID="btnGoBack" runat="server" OnClick="btnGoBack_Click" Text="Take me back" Width="125px" />
&nbsp;<br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Search Patient records using keyword" Font-Size="Large"></asp:Label>
&nbsp;<br />
                    <asp:TextBox ID="txtSearchKeyWord" runat="server"  Width="222px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Button ID="btnSearchKeyword" runat="server" Text="Look up" Width="102px" OnClick="btnSearchKeyword_Click" />
                &nbsp;
                    <asp:Button ID="btnShowAll" runat="server" OnClick="btnShowAll_Click" Text="Show All" Width="101px" />
                </td>
                <td>&nbsp;&nbsp;
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" Text="Patient Records"></asp:Label>
                    <br />
                    <asp:GridView ID="GridViewPatients" runat="server" OnRowDataBound="SetHeader" Width="935px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <br />
        
        <br />
        <br />
        
    </div>
    </form>
</body>
</html>
