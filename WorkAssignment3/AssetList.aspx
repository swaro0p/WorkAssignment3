<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="AssetList.aspx.cs" Inherits="WorkAssignment3.AssetList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <asp:Label ID="LabelVendorSearch" runat="server" Text="Search"></asp:Label>
        <asp:TextBox ID="TextBoxVendorSearch" runat="server" OnTextChanged="TextBoxVendorSearch_TextChanged"></asp:TextBox>
        &nbsp;<asp:Button ID="ButtonVendorSearch" runat="server" Text="Search" OnClick="ButtonVendorSearch_Click" />
    </div>
    <div>
        <asp:GridView ID="GridViewAssetList" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="AssetId" HeaderText="Asset Id" />
                <asp:BoundField DataField="AssetName" HeaderText="Asset" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" />
                <asp:TemplateField HeaderText="Edit">
                    
                    
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
   
</asp:Content>
