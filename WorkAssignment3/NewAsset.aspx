<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMaster.Master" AutoEventWireup="true" CodeBehind="NewAsset.aspx.cs" Inherits="WorkAssignment3.NewAsset" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="tablediv">
        <table style="width: 100%;">
            <tr>
                <td><asp:Label ID="LabelAssetName" runat="server" Text="Asset Name"></asp:Label>      
                <td> <asp:TextBox ID="TextBoxName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssetName" runat="server" ErrorMessage="Asset Name Cannot Be Empty" ForeColor="Red" ControlToValidate="TextBoxName">*Asset Name Cant Be Empty</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorAssetName" runat="server" ErrorMessage="Only alphabets are allowed" ControlToValidate="TextBoxName" ForeColor="Red" ValidationExpression="[a-zA-Z ]+$">*Only alphabets are allowed</asp:RegularExpressionValidator>
                </td>             
            </tr>
            <tr>
                <td><asp:Label ID="LabelVendor" runat="server" Text="Vendor"></asp:Label>  </td>    
                 <td><asp:DropDownList ID="DropDownListVendorName" runat="server" Width="127px"></asp:DropDownList>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorVendor" runat="server" ErrorMessage="Please Select A Vendor" ForeColor="Red" ControlToValidate="DropDownListVendorName">*Please Select A Vendor</asp:RequiredFieldValidator>
                </td>         
            </tr>
            <tr>
                <td><asp:Label ID="LabelPurchaseDate" runat="server" Text="Purchase Date"></asp:Label>  </td> 
                <td> <asp:TextBox ID="TextBoxDate" runat="server" AutoCompleteType="Disabled"></asp:TextBox> 
                <td> <asp:TextBox ID="TextBoxDateDb" runat="server" AutoCompleteType="Disabled"></asp:TextBox> 
                    <ajaxToolkit:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" BehaviorID="TextBoxDate_CalendarExtender" TargetControlID="TextBoxDate">
                    </ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPurchaseDate" runat="server" ErrorMessage="Please Select A Purchase Date" ForeColor="Red" ControlToValidate="TextBoxDate">*Please Select A Purchase Date</asp:RequiredFieldValidator>
                </td>                
            </tr>
              <tr>
                <td><asp:Label ID="LabelCost" runat="server" Text="Cost"></asp:Label>  </td> 
                <td><asp:TextBox ID="TextBoxCost" runat="server"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="TextBoxCost_FilteredTextBoxExtender" runat="server" BehaviorID="TextBoxCost_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="TextBoxCost" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" runat="server" ErrorMessage="Cost Cannot Be Empty" ForeColor="Red" ControlToValidate="TextBoxCost">*Cost Cannot Be Empty</asp:RequiredFieldValidator>            
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
