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
        <asp:GridView ID="GridViewAssetList" runat="server" AutoGenerateColumns="False" OnRowEditing="GridViewAssetList_RowEditing" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="AssetId" HeaderText="Asset Id" />
                <asp:BoundField DataField="AssetName" HeaderText="Asset" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" />
          
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
    
    <%--<div>
       <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelPopUp" TargetControlID="linkEdit"></ajaxToolkit:ModalPopupExtender>
       <asp:Panel ID="PanelPopUp" runat="server">
           <iframe style=" width: 350px; height: 300px;" id="irm1" src="EditAsset.aspx">

           </iframe>
       </asp:Panel>
   </div>--%>
</asp:Content>
