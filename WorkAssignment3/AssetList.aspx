<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="AssetList.aspx.cs" Inherits="WorkAssignment3.AssetList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <asp:Label ID="LabelVendorSearch" runat="server" Text="Search"></asp:Label>
        <asp:TextBox ID="TextBoxVendorSearch" runat="server" OnTextChanged="TextBoxVendorSearch_TextChanged" AutoPostBack="True"></asp:TextBox>
    </div>
    <div>
        <asp:GridView ID="GridViewAssetList" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="Asset is empty" DataKeyNames="AssetId" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" OnSelectedIndexChanging="GridViewAssetList_SelectedIndexChanging" OnRowDeleting="GridViewAssetList_RowDeleting" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="AssetID" HeaderText="Asset Id" />
                <asp:BoundField DataField="AssetName" HeaderText="Asset" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" />

                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowSelectButton="true" />
                <asp:CommandField ButtonType="Button" HeaderText="delete" ShowDeleteButton="true" />
          
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
    
   <div style="border:1px solid black; width:413px;" >
    <table >
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="AssetId:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEditAssetId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="AssetName:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEditAssetName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssetName" runat="server" ControlToValidate="TextBoxEditAssetName" ErrorMessage="Field Cannot Be Empty" ForeColor="Red">*Field Cannot Be Empty</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="VendorName:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListEditVendorAsset" runat="server"></asp:DropDownList>
                </td>
            </tr>
         
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Cost"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEditCost" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonEditAsset" runat="server" Text="Edit" OnClick="ButtonEditAsset_Click" />
                </td>
                <td>
                    <asp:Button ID="ButtonCancelEdit" runat="server" Text="Cancel" OnClick="ButtonCancelEdit_Click" />
                </td>
            </tr>
        </table>
        </div>
</asp:Content>
