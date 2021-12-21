<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAsset.aspx.cs" Inherits="WorkAssignment3.EditAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td><asp:Label ID="LabelAssetId" runat="server" Text="AssetId"></asp:Label></td>
                    <td><asp:TextBox ID="TextBoxAssetId" runat="server"></asp:TextBox></td>                  
                </tr>
                <tr>
                     <td><asp:Label ID="LabelAssetName" runat="server" Text="AssetName"></asp:Label></td>
                    <td><asp:TextBox ID="TextBoxAssetName" runat="server"></asp:TextBox></td> 
                  
                </tr>
                <tr>
                    <td><asp:Label ID="LabelVendorDropDown" runat="server" Text="Vendor"></asp:Label></td>                       
                    <td><asp:DropDownList ID="DropDownListVendor" runat="server" Height="16px" Width="127px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="LabelPurchaseDate" runat="server" Text="Purchase Date"></asp:Label></td>                       
                    <td><asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox></td> 
                </tr>
                <tr>
                    <td><asp:Label ID="LabelCost" runat="server" Text="Cost"></asp:Label></td>                       
                    <td><asp:TextBox ID="TextBoxCost" runat="server"></asp:TextBox></td> 
                </tr>
            </table>           
        </div>
        <div>
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
            <asp:Button ID="ButtonCancle" runat="server" Text="Cancle" OnClick="ButtonCancle_Click" />
        </div>
    </form>
</body>
</html>
