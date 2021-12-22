<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WorkAssignment3.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridViewReport" runat="server"></asp:GridView>
    </div>
    <div>
       <asp:Label ID="LabelTotalCost" runat="server" Text="Total Cost:"></asp:Label>
       <asp:Label ID="LabelSum" runat="server" Text="Sum:"></asp:Label>
        
    </div>
</asp:Content>
