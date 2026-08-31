<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployeeSalary.aspx.cs" Inherits="ProjectDemo.AddEmployeeSalary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee Salary</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add Employee Salary</h2>

            Select Employee:
            <br />
            <asp:DropDownList ID="DropDownListEmployee" runat="server"></asp:DropDownList>
            <br /><br />

            Total Salary:
            <br />
            <asp:TextBox ID="TextBoxTotalSalary" runat="server" AutoPostBack="true" OnTextChanged="TextBoxTotalSalary_TextChanged"></asp:TextBox>
            <br /><br />

            <h3>Earnings</h3>
            <asp:Repeater ID="RepeaterEarnings" runat="server">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenFieldEarningId" runat="server" Value='<%# Eval("EarningsId") %>' />
                    <asp:HiddenField ID="HiddenFieldEarningsPercentage" runat="server" Value='<%# Eval("EarningsPercentage") %>' />
                    
                    <asp:Label ID="LabelEarning" runat="server" Text='<%# Eval("EarningName") + " (" + Eval("EarningsPercentage") + "%)" %>'></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxEarningAmount" runat="server" ReadOnly="true" Text="0.00"></asp:TextBox>
                    <br /><br />
                </ItemTemplate>
            </asp:Repeater>

            <h3>Deductions</h3>
            <asp:Repeater ID="RepeaterDeductions" runat="server">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenFieldDeductionId" runat="server" Value='<%# Eval("DeductionId") %>' />
                    <asp:HiddenField ID="HiddenFieldDeductionPercentage" runat="server" Value='<%# Eval("DeductionPercentage") %>' />
                    
                    <asp:Label ID="LabelDeduction" runat="server" Text='<%# Eval("DeductionName") + " (" + Eval("DeductionPercentage") + "%)" %>'></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxDeductionAmount" runat="server" ReadOnly="true" Text="0.00"></asp:TextBox>
                    <br /><br />
                </ItemTemplate>
            </asp:Repeater>

            <asp:Button ID="ButtonSave" runat="server" Text="Save Salary" OnClick="ButtonSave_Click" />
        </div>
    </form>
</body>
</html>
