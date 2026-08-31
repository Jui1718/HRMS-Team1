<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDocumentName(employee).aspx.cs" Inherits="Demo.Controllers.EditDocumentName_employee_" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Edit Employee Document</title>
</head>

<body>

<form id="form1" runat="server">

    <div>

        <h2>Edit Employee Document Name</h2>

        <br />

        Document Name :

        <asp:TextBox ID="TextBox1"
            runat="server">
        </asp:TextBox>

        <br />
        <br />

        <asp:Button ID="btnUpdate"
            runat="server"
            Text="Update"
            OnClick="btnUpdate_Click" />

        &nbsp;&nbsp;

        <asp:Button ID="btnCancel"
            runat="server"
            Text="Cancel"
            OnClick="btnCancel_Click" />

    </div>

</form>

</body>

</html>