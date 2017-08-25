<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSearchVisits.aspx.cs" Inherits="A2_SalmaOsman.SharedForm.ViewSearchPatients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 293px;
        }
        .auto-style2 {
            height: 78px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblHeader" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnBack" runat="server" Text="Take Me Back" Width="122px" OnClick="btnBack_Click" />
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Search using :" Font-Size="Large"></asp:Label>
&nbsp;&nbsp;<asp:DropDownList ID="ddlSearchOptions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectedIndexChange_SimpleSearch" Height="16px" Width="157px">
                        <asp:ListItem>Select option</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Admission Date</asp:ListItem>
                        <asp:ListItem>Discharge Date</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" Text="Visit Records"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    <asp:GridView ID="GridViewPaients" runat="server" Height="71px" Width="762px" OnRowDataBound="SetDocHeader">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
