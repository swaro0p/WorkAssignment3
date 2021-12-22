<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="NewAsset.aspx.cs" Inherits="WorkAssignment3.NewAsset" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="tablediv">
        <table style="width: 100%;">
            <tr>
                <td><asp:Label ID="LabelAssetName" runat="server" Text="Asset Name"></asp:Label>      
                <td> <asp:TextBox ID="TextBoxName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssetName" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TextBoxName">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorAssetName" runat="server" ErrorMessage="Only alphabets are allowed" ControlToValidate="TextBoxName" ForeColor="Red" ValidationExpression="[a-zA-Z ]+$">*</asp:RegularExpressionValidator>
                </td>             
            </tr>
            <tr>
                <td><asp:Label ID="LabelVendor" runat="server" Text="Vendor"></asp:Label>  </td>    
                 <td><asp:DropDownList ID="DropDownListVendorName" runat="server" Width="127px"></asp:DropDownList>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorVendor" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="DropDownListVendorName">*</asp:RequiredFieldValidator>
                </td>         
            </tr>
            <tr>
                <td><asp:Label ID="LabelPurchaseDate" runat="server" Text="Purchase Date"></asp:Label>  </td> 
                <td> <asp:TextBox ID="TextBoxDate" runat="server" AutoCompleteType="Disabled"></asp:TextBox> 
                    <ajaxToolkit:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" BehaviorID="TextBoxDate_CalendarExtender" TargetControlID="TextBoxDate">
                    </ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPurchaseDate" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TextBoxDate">*</asp:RequiredFieldValidator>
                </td>                
            </tr>
              <tr>
                <td><asp:Label ID="LabelCost" runat="server" Text="Cost"></asp:Label>  </td> 
                <td><asp:TextBox ID="TextBoxCost" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TextBoxCost">*</asp:RequiredFieldValidator>            
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" /></td>
                <td>
                    <asp:Button ID="ButtonCancle" runat="server" Text="Cancel" /></td>
            </tr>
        </table>

    </div>
</asp:Content>
