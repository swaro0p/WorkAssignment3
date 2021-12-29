<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="Vendor.aspx.cs" Inherits="WorkAssignment3.Vendor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
        <h1>
        <asp:Label ID="LabelVendor" runat="server" Text="Vendor"></asp:Label>
         </h1>
    </div>
    <asp:GridView ID="GridViewVendor" runat="server" OnSelectedIndexChanged="GridViewVendor_SelectedIndexChanged" AutoGenerateColumns="False" OnRowDataBound="GridViewVendor_RowDataBound" OnRowCancelingEdit="GridViewVendor_RowCancelingEdit" OnRowEditing="GridViewVendor_RowEditing">
        <Columns>  
                <asp:BoundField DataField="VendorID" HeaderText="Vendor Id" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" />
                <asp:BoundField DataField="VendorEmail" HeaderText="Vendor Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                                                
            <asp:TemplateField HeaderText="City">
            <ItemTemplate>  
                        <asp:DropDownList ID="DropDownList1" runat="server">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                  </Columns>
    </asp:GridView>
    <div>
        <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
    </div>
    
</asp:Content>
