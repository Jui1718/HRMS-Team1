<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDocumentName(admin).aspx.cs" Inherits="Demo.Controllers.EditDocumentName_admin_" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Edit Document Name</title>
</head>

<body>

<form id="form1" runat="server">

    <div>

        <h2>Edit Document Name</h2>

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

        

       

    </div>

</form>

</body>

</html>
