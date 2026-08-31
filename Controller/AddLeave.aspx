<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLeave.aspx.cs" Inherits="ProjectDemo.AddLeave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Allocate Leave Deptwise</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Allocate Leave Deptwise</h2>

            Select Department
            <br />
            <asp:DropDownList ID="DropDownListDept" runat="server"></asp:DropDownList>
            <br />
            <br />

            Select Leave Type
            <br />
            <asp:DropDownList ID="DropDownListLeaveType" runat="server"></asp:DropDownList>
            <br />
            <br />

            Number of Leaves Allocated
            <br />
            <asp:TextBox ID="TextBoxLeavesCount" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="ButtonAllocate" runat="server" Text="Allocate Leave" OnClick="ButtonAllocate_Click" />
        </div>
    </form>
</body>
</html>
