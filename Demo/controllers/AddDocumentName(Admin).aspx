<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDocumentName(Admin).aspx.cs" Inherits="Demo.Controllers.AddDocumentName_Admin_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Add Document Name</title>
</head>

<body>

<form id="form1" runat="server">

    <div>

        <h2>Add Document Name</h2>

        <br />

        Document Name :

        <asp:TextBox ID="TextBox1"
            runat="server">
        </asp:TextBox>

        <br />
        <br />

        <asp:Button ID="btnSave"
            runat="server"
            Text="Save"
            OnClick="btnSave_Click" />

        &nbsp;&nbsp;

        <asp:Button ID="btnCancel"
            runat="server"
            Text="Cancel"
            OnClick="btnCancel_Click" />

    </div>

</form>

</body>

</html>
