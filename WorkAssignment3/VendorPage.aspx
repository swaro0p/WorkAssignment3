<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="VendorPage.aspx.cs" Inherits="WorkAssignment3.VendorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VendorID" DataSourceID="GridViewSource" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
           <%-- <asp:CommandField ShowEditButton="True" />--%>
            <asp:BoundField DataField="VendorID" HeaderText="VendorId" InsertVisible="False" ReadOnly="True" SortExpression="VendorId" />
            <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" />
            <asp:BoundField DataField="VendorEmail" HeaderText="VendorEmail" SortExpression="VendorEmail" />
            <asp:BoundField DataField="VendorContact" HeaderText="Contact" SortExpression="Contact" />
            <asp:TemplateField HeaderText="CityId" SortExpression="CityId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DropDownSource" DataTextField="CityName" DataValueField="CityId" SelectedValue='<%# Bind("CityId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DropDownSource" runat="server" ConnectionString="<%$ ConnectionStrings:AssetRegister %>" SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" Visible="False" />
            <asp:CommandField ShowEditButton="True" />
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
    <asp:SqlDataSource ID="GridViewSource" runat="server" ConnectionString="<%$ ConnectionStrings:AssetRegister %>" 
        DeleteCommand="DELETE FROM [Vendor] WHERE [VendorID] = @VendorID" 
        InsertCommand="INSERT INTO [Vendor] ([VendorName], [VendorEmail], [VendorContact], [CityId]) VALUES (@VendorName, @VendorEmail, @VendorContact, @CityId)" 
        SelectCommand="SELECT Vendor.VendorID, Vendor.VendorName, Vendor.VendorEmail, Vendor.VendorContact, Vendor.CityId, City.CityName FROM Vendor INNER JOIN City ON Vendor.CityId = City.CityId" 
        UpdateCommand="UPDATE [Vendor] SET [VendorName] = @VendorName, [VendorEmail] = @VendorEmail, [VendorContact] = @VendorContact, [CityId] = @CityId WHERE [VendorID] = @VendorID">
        <DeleteParameters>
            <asp:Parameter Name="VendorID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="VendorEmail" Type="String" />
            <asp:Parameter Name="VendorContact" Type="Int64" />
            <asp:Parameter Name="CityId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="VendorEmail" Type="String" />
            <asp:Parameter Name="Contact" Type="Int64" />
            <asp:Parameter Name="CityId" Type="Int32" />
            <asp:Parameter Name="VendorID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
