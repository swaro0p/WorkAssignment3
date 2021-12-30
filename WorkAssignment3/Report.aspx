<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WorkAssignment3.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="LabelSearch" runat="server" Text="Search"></asp:Label>
        <asp:TextBox ID="TextBoxReportSearch" runat="server" AutoPostBack="True" OnTextChanged="TextBoxReportSearch_TextChanged"></asp:TextBox>
    </div>
    <div>
        <asp:GridView ID="GridViewReport" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="No Items Inserted" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="AssetID" HeaderText="Asset Id" SortExpression="AssetID" />
                <asp:BoundField DataField="AssetName" HeaderText="Asset Name" SortExpression="AssetName" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" SortExpression="VendorName" />
                <asp:BoundField DataField="PurchaseDate" HeaderText="Purchase Date" SortExpression="PurchaseDate" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
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
    <div>
        <asp:Label ID="LabelTotalCost" runat="server" Text="Total Cost:"></asp:Label>
        <asp:Label ID="LabelSum" runat="server" Text="Sum:"></asp:Label>
        <asp:Label ID="LabelRowCount" runat="server" Text="Rows:"></asp:Label>


    </div>
</asp:Content>
